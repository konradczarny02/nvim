# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture

This config uses **Neovim 0.12+** native APIs throughout — no lazy.nvim, no packer:

- `init.lua` — entry point, loads `core.*` then `plugins`
- `lua/core/options.lua` — vim options and globals (leader = `<Space>`)
- `lua/core/keymaps.lua` — global keymaps (LSP, diagnostics, windows, `jk` → Esc)
- `lua/core/autocmds.lua` — global autocmds (highlight on yank)
- `lua/plugins/init.lua` — `vim.pack.add(...)` plugin declarations, then requires each plugin config module
- `lua/plugins/lsp.lua` — LSP via native `vim.lsp.config` / `vim.lsp.enable` (not lspconfig's `setup()`)
- `lua/plugins/cmp.lua` — blink.cmp (completion), conform.nvim (format-on-save), todo-comments, trouble, flash
- `lua/plugins/treesitter.lua` — treesitter parser installs and FileType autocmds
- `lua/plugins/ui.lua` — which-key, gitsigns, oil.nvim (file browser, replaces netrw), telescope, catppuccin theme

## Key design points

**Package manager**: `vim.pack.add` is the built-in Neovim 0.12 package system. Plugins are declared as a list of `{ src = "github_url" }` tables — no `config` key; setup calls live in the dedicated module files.

**LSP setup pattern**: Uses the new `vim.lsp.config("server", { ... })` + `vim.lsp.enable("server")` API, not `require("lspconfig").server.setup()`. Configured servers: `gopls`, `ts_ls`, `templ`, `lua_ls`, `tailwindcss`.

**Formatting**: conform.nvim formats on `BufWritePre` for Go (goimports + gofumpt), JS/TS/CSS/JSON/templ (prettier), Lua (stylua). TypeScript also runs organize-imports via LSP on save. `ts_ls` has `documentFormattingProvider` disabled so prettier takes over.

**Completion**: blink.cmp with `<C-p>`/`<C-n>` navigate, `<C-y>` accept, `<Tab>`/`<S-Tab>` for snippets (LuaSnip).

## Language support

| Language | LSP | Formatter |
|---|---|---|
| Go | gopls (gofumpt, staticcheck) | goimports + gofumpt |
| TypeScript / JS | ts_ls | prettier |
| Lua | lua_ls | stylua |
| templ | templ | templ |
| Tailwind CSS | tailwindcss | prettier |

## Notable keymaps

| Key | Action |
|---|---|
| `-` | Oil (open parent directory) |
| `<leader>sf` | Telescope find files |
| `<leader>sg` | Telescope live grep |
| `<leader>s.` | Telescope recent files |
| `<leader>sb` / `<leader><leader>` | Telescope buffers |
| `<leader>sh` | Telescope help tags |
| `<leader>sd` | Telescope diagnostics |
| `<leader>/` | Fuzzy search in current buffer |
| `<leader>xx` | Toggle Trouble diagnostics panel |
| `s` | Flash jump (normal, visual, operator-pending) |
| `gd` / `grr` / `K` | LSP go-to-def / references / hover (`grr`, `K` are Neovim defaults) |
| `<leader>rn` / `<leader>ca` | LSP rename / code action |
| `<leader>q` | Open diagnostics quickfix list |
| `<leader>h` / `<leader>l` | Jump to line start / end |
| `<C-h/j/k/l>` | Move between windows |
| `<Esc>` | Clear search highlight |
| `<leader>pu` | Update plugins (`vim.pack.update()`) |

## Testing changes

Source the modified file inside Neovim (`:source %`) or restart Neovim. There is no build step or test suite.
