local map = vim.keymap.set

map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("n", "<leader>h", "^", { desc = "Go to line start" })
map("n", "<leader>l", "$", { desc = "Go to line end" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- windows (vim-tmux-navigator: also moves into neighbouring tmux panes)
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Focus left window/pane" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Focus lower window/pane" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Focus upper window/pane" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Focus right window/pane" })

-- LSP
-- Neovim defaults: K (hover), grr (references), gri (implementation), grn (rename), gra (code action)
map("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame" })
map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction" })

-- diagnostics
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics [Q]uickfix list" })

-- plugins
map("n", "<leader>pu", function()
	vim.pack.update()
end, { desc = "[P]lugins [U]pdate" })
