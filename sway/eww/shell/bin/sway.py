#!/usr/bin/env python3

import re
import i3ipc
import json

import gi

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk

REGEX_NAMES = [
    ("^Minecraft.*", "minecraft"),
]

TERMINAL = "kitty"
TERM_OVERRIDES = [
    ("^nv:", "neovim"),
    ("^lf:", "file-manager"),
    ("^qalc$", "qalculator"),
    ("^btm$", "preferences-system-performance"),
    ("^pms$", "multimedia-audio-player"),
]

CLASS_OVERRIDES = {
    "zenity": "dialog-info",
    "vesktop": "discord",
    "nm-connection-editor": "networkmanager",
    "Spotify": "spotify-client",
}


def get_icon(icon_name, size=48, fallback="gtk-index"):
    if not icon_name:
        icon_name = fallback

    icon_theme = Gtk.IconTheme.get_default()
    icon = icon_theme.lookup_icon(icon_name, size, 0)
    if icon:
        return icon.get_filename()
    else:
        return get_icon(None)


def get_for_ws(workspace: i3ipc.Con, output):
    on_ws = []
    is_active = False
    for w in workspace.descendants():
        if not w.pid:
            continue
        app_id = w.app_id or w.window_class or None
        app_id = CLASS_OVERRIDES.get(app_id, app_id)

        if app_id == TERMINAL:
            for override in TERM_OVERRIDES:
                if re.match(override[0], w.name):
                    app_id = override[1]
        # overrides
        for override in REGEX_NAMES:
            if re.match(override[0], w.name):
                app_id = override[1]

        # past this point, we have no clue
        # give smth that at least helps us a bit
        if not app_id:
            if w.window_instance:
                app_id = "xorg"
            else:
                app_id = "wayland"

        rect = {"x": 0, "y": 0, "width": 0, "height": 0}

        width_scale = output.rect.width
        height_scale = output.rect.height

        rect["x"] = (w.rect.x - output.rect.x) / width_scale
        rect["y"] = (w.rect.y - output.rect.y) / height_scale

        rect["width"] = w.rect.width / width_scale
        rect["height"] = w.rect.height / height_scale

        win = {
            "float": w.type == "floating_con",
            "app_id": app_id,
            "id": w.id,
            "name": w.name,
            "pid": w.pid,
            "focused": w.focused,
            "rect": rect,
            "icon": get_icon(app_id),
        }
        if w.focused:
            is_active = True

        on_ws.append(win)
    return sorted(on_ws, key=lambda w: w["float"]), is_active


def sort_by_name(ws):
    name = ws["ws"]
    return int(name)


def update(i3, e):
    root = i3.get_tree()

    focused_output = "0x0B9C"
    workspaces = []
    for output in root.nodes:
        if output.name == "__i3":
            continue

        for workspace in output.nodes:
            windows, is_active = get_for_ws(workspace, output)
            ws = {
                "wins": windows,
                "focused": workspace.focused or is_active,
                "wsnum": workspace.num,
                "ws": workspace.name,
                "is_virtual": False,
                "screen": False,
                "screen_name": output.ipc_data["model"],
            }
            if ws["focused"]:
                focused_output = ws["screen_name"]
            workspaces.append(ws)

    sorted_ws = sorted(workspaces, key=sort_by_name)

    if len(sorted_ws[-1]["wins"]) != 0:
        sorted_ws.append(
            {
                "wins": [],
                "focused": False,
                "wsnum": sorted_ws[-1]["wsnum"] + 1,
                "ws": str(sorted_ws[-1]["wsnum"] + 1),
                "is_virtual": True,
            }
        )

    print(
        json.dumps(
            {
                "workspaces": sorted_ws,
                "scratch_count": len(root.scratchpad().floating_nodes),
                "screen_name_focused": focused_output,
            }
        ),
        flush=True,
    )


if __name__ == "__main__":
    i3 = i3ipc.Connection()
    update(i3, None)
    i3.on(i3ipc.Event.WINDOW, update)
    i3.on(i3ipc.Event.WORKSPACE_FOCUS, update)
    i3.main()
