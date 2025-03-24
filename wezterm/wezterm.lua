local wezterm = require 'wezterm'

return {
  color_scheme = 'Catppuccin Mocha',
  enable_tab_bar = false,

  font_size = 12.0,
  font = wezterm.font('JetBrains Mono'),

  window_background_opacity = 0.92,
  window_decorations = 'RESIZE',

  keys = {
    { key = '-', mods = 'CTRL', action = wezterm.action.DecreaseFontSize },
    { key = '=', mods = 'CTRL', action = wezterm.action.IncreaseFontSize },
    { key = 'C', mods = 'CTRL', action = wezterm.action.CopyTo 'Clipboard' },
    { key = 'V', mods = 'CTRL', action = wezterm.action.PasteFrom 'Clipboard' },
    {
      key = '1',
      mods = 'CTRL',
      action = wezterm.action.SendString "\x1b[49;5u"
    },
    {
      key = '2',
      mods = 'CTRL',
      action = wezterm.action.SendString "\x1b[50;5u"
    },
    {
      key = '3',
      mods = 'CTRL',
      action = wezterm.action.SendString "\x1b[51;5u"
    },
    {
      key = '4',
      mods = 'CTRL',
      action = wezterm.action.SendString "\x1b[52;5u"
    },
    {
      key = '5',
      mods = 'CTRL',
      action = wezterm.action.SendString "\x1b[53;5u"
    },
    {
      key = '6',
      mods = 'CTRL',
      action = wezterm.action.SendString "\x1b[54;5u"
    },
    {
      key = '7',
      mods = 'CTRL',
      action = wezterm.action.SendString "\x1b[55;5u"
    },
    {
      key = '8',
      mods = 'CTRL',
      action = wezterm.action.SendString "\x1b[56;5u"
    },
    {
      key = '9',
      mods = 'CTRL',
      action = wezterm.action.SendString "\x1b[57;5u"
    },
  },
  mouse_bindings = {
    -- Ctrl-click will open the link under the mouse cursor
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = wezterm.action.OpenLinkAtMouseCursor,
    },
  },
}

