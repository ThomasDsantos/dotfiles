#!/usr/bin/env python3
"""
Waybar module for displaying current Sway mode with keybinding hints.
Subscribes to Sway IPC mode events and outputs JSON for waybar.
"""

import json
import subprocess
import sys

# Mode display names
MODE_NAMES = {
    "default": "default",
    "resize": "resize",
    "session-manager": "Session",
    "media": "media",
    "screenshot": "print"
}

# Mode keybinding hints
MODE_HINTS = {
    "default": [],
    "screenshot": [
        {"keys": "s", "action": "Screen"},
        {"keys": "v", "action": "Visual"},
        {"keys": "w", "action": "Window"},
        {"keys": "Ctrl+*", "action": "To Disk"}
    ],
    "resize": [
        {"keys": "hjkl", "action": "Resize"}
    ],
    "session-manager": [
        {"keys": "q", "action": "Lock session"},
        {"keys": "l", "action": "Logout"},
        {"keys": "r", "action": "Restart"},
        {"keys": "s", "action": "Shutdown"}
    ],
    "media": [
        {"keys": "p", "action": "Previous"},
        {"keys": "n", "action": "Next"},
        {"keys": "Space", "action": "Play/Pause"}
    ]
}


def format_hints(hints, inline=False):
    """Format keybinding hints into a readable string."""
    if not hints:
        return ""

    if inline:
        # Format for inline display in the bar
        hint_parts = []
        for hint in hints:
            hint_parts.append(f"[{hint['keys']}: {hint['action']}]")
        return "  " + "  ".join(hint_parts)
    else:
        # Format for tooltip
        hint_parts = []
        for hint in hints:
            hint_parts.append(f"{hint['keys']}: {hint['action']}")
        return " | ".join(hint_parts)


def output_mode(mode_name):
    """Output mode information in waybar JSON format."""
    display_name = MODE_NAMES.get(mode_name, mode_name)
    hints = MODE_HINTS.get(mode_name, [])
    hint_text_tooltip = format_hints(hints, inline=False)
    hint_text_inline = format_hints(hints, inline=True)

    # For default mode, show "default" text
    if mode_name == "default":
        text = " default"
        tooltip = "Default mode"
        css_class = "mode-default"
    else:
        text = f" {display_name}{hint_text_inline}"
        tooltip = f"{display_name}\n{hint_text_tooltip}" if hint_text_tooltip else display_name
        css_class = f"mode-{mode_name}"

    output = {
        "text": text,
        "tooltip": tooltip,
        "class": css_class,
        "alt": mode_name
    }

    print(json.dumps(output), flush=True)


def main():
    """Subscribe to Sway mode events and output to waybar."""
    # Initial state - default mode
    output_mode("default")

    # Subscribe to mode events
    try:
        process = subprocess.Popen(
            ["swaymsg", "-t", "subscribe", "-m", '["mode"]'],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )

        for line in process.stdout:
            try:
                event = json.loads(line.strip())
                if event.get("change"):
                    mode_name = event["change"]
                    output_mode(mode_name)
            except json.JSONDecodeError:
                continue

    except KeyboardInterrupt:
        pass
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
