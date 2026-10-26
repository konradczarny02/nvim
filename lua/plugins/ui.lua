require("which-key").setup()

require("gitsigns").setup()

--require("nvim-tree").setup({
--	view = { width = 50 },
--	renderer = { group_empty = true },
--})

--vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>")
--

require("oil").setup()

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			".git/",
			"dist",
		},
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "[S]earch recent files" })
vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch [B]uffers" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Fuzzy search in buffer" })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find open buffers" })

vim.cmd.colorscheme("catppuccin")
