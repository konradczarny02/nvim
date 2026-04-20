vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },

	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", lazy = false, build = ":TSUpdate" },

	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },

	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },

	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },

	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/folke/which-key.nvim" },

	{ src = "https://github.com/folke/todo-comments.nvim" },
	{ src = "https://github.com/folke/trouble.nvim" },
	{ src = "https://github.com/folke/flash.nvim" },

	{ src = "https://github.com/catppuccin/nvim" },
})

require("plugins.lsp")
require("plugins.cmp")
require("plugins.treesitter")
require("plugins.ui")
require("plugins.tools")
