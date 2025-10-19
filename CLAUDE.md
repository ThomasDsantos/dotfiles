# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for Linux development environments. It uses **GNU Stow** to manage symlinks for configuration files across different tools and applications. The repository is managed by Ansible automation, so some files are auto-generated and should not be modified directly.

## Deployment

The primary deployment method is GNU Stow:

```sh
# Deploy all configurations
stow .

# Deploy specific configurations
stow nvim
stow sway
stow tmux
```

The `.stowrc` file configures Stow to:
- Target `~/.config` directory
- Ignore `.stowrc` and `.gitmodules` files

## Architecture

### Configuration Structure

Each top-level directory represents a separate tool/application configuration:

- **nvim/**: Neovim configuration using Lazy.nvim plugin manager
- **sway/**: Sway window manager configuration (modular structure)
- **tmux/**: Terminal multiplexer configuration
- **wezterm/**: Terminal emulator configuration
- **starship.toml**: Shell prompt configuration
- **.zshenv**: Zsh environment variables

### Neovim Architecture

Neovim uses **Lazy.nvim** for plugin management with a modular structure:

- **Entry point**: `nvim/init.lua` → loads `config/` module
- **Core config**: `nvim/lua/config/`
  - `init.lua`: Loads remap, set, utils, and lazy modules
  - `lazy.lua`: Bootstraps Lazy.nvim and loads plugins from `lua/plugins/`
  - `remap.lua`: Core keybindings (leader: space)
  - `set.lua`: Vim settings
  - `utils.lua`: Helper functions

- **Plugins**: `nvim/lua/plugins/` - Each file is a Lazy.nvim plugin spec
  - LSP configuration in `lsp.lua` uses `vim.lsp.enable()` for multiple language servers
  - Per-language LSP configs in `nvim/lsp/*.lua`

- **Plugin management**:
  ```sh
  # Inside Neovim
  :Lazy           # Open Lazy.nvim UI
  :Lazy sync      # Update/install plugins
  ```

### Sway Architecture

Sway configuration uses a **modular include pattern**:

- **Main config**: `sway/config` (Ansible-managed - DO NOT EDIT)
- **Includes**:
  - `./theme`: Visual theming
  - `./displays`: Display configuration
  - `./rules`: Window rules
  - `./workspaces`: Workspace definitions
  - `./binds/*`: Keybindings split by category (base, exec, media, screenshots, workspaces, lock)

Terminal: wezterm
Modifier key: Mod4 (Super/Windows key)
Navigation keys: h/j/k/l (vim-style)

### Tmux Architecture

- **Prefix key**: Changed from default `C-b` to `C-s`
- **Plugin manager**: TPM (Tmux Plugin Manager)
- **Theme**: Catppuccin Mocha
- **Key plugins**:
  - vim-tmux-navigator: Seamless navigation between tmux panes and Neovim
  - tmux-yank: System clipboard integration

Reload config: `prefix + r`

## Language Servers

The following LSP servers are enabled (via nvim/lua/plugins/lsp.lua:59-77):
- ansiblels (Ansible)
- bashls (Bash)
- cspell_ls (Spell checking)
- dockerls (Docker)
- eslint (JavaScript/TypeScript linting)
- gopls (Go)
- helm_ls (Helm)
- jsonls (JSON)
- lua_ls (Lua)
- nil_ls (Nix)
- pyright (Python)
- ruff (Python linting)
- rust_analyzer (Rust)
- sqls (SQL)
- ts_ls (TypeScript)
- vue_ls (Vue.js)
- yamlls (YAML)

## Key Patterns

### Neovim Keybindings

**Leader key**: Space

Common patterns (from remap.lua and plugin configs):
- `<leader>pv`: File explorer (Ex command)
- `<leader>f`: LSP format
- `<leader>w`: Window commands (`<C-w>` prefix)
- `<leader>y/Y`: Yank to system clipboard
- `<leader>d`: Delete to void register

**Telescope** (fuzzy finder):
- `<leader>ff`: Find git files
- `<leader>fa`: Find all files
- `<leader>fr`: Recent files
- `<leader>fgf`: Live grep
- `<leader>fgw`: Grep word under cursor
- `<leader>fp`: Find project files (excludes tests)

**LSP**:
- `<leader>gd`: Go to definition
- `<leader>gr`: Find references
- `<F2>`: Rename symbol
- `<F3>`: Format file
- `<F4>`: Code actions

### Special Filetype Detection

Ansible files are auto-detected based on path patterns (host_vars, group_vars, playbooks, roles, tasks) and set to `yaml.ansible` filetype.

## Important Notes

1. **Ansible-managed files**: `sway/config` is managed by Ansible - changes will be overwritten. Modify the Ansible role instead.
2. **Submodules**: Neovim may be managed as a git submodule - use `git clone --recursive` when cloning.
3. **Plugin directories**: `tmux/plugins/` contains TPM and tmux plugins - these are git submodules.
4. **Wayland-focused**: Sway, Wofi, and related tools are Wayland-specific.
