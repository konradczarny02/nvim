vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>h", "^")
vim.keymap.set("n", "<leader>l", "$")

-- LSP
-- Neovim defaults: K (hover), grr (references), gri (implementation), grn (rename), gra (code action)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

-- diagnostics
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics [Q]uickfix list" })
