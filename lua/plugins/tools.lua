-- autopairs
require("nvim-autopairs").setup({
	check_ts = true,
})

-- formatter
require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		javascriptreact = { "prettier" },
		go = { "gofmt", "goimports", stop_after_first = true },
		lua = { "stylua" },
		css = { "prettier" },
		templ = { "templ" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(args)
		require("conform").format({
			bufnr = args.buf,
			async = false,
		})
	end,
})

-- TS organize imports
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.ts", "*.tsx" },
	callback = function()
		vim.lsp.buf.code_action({
			context = { only = { "source.organizeImports" } },
			apply = true,
		})
	end,
})

-- ✅ TODO comments (huge ROI)
require("todo-comments").setup()

-- diagnostics panel
require("trouble").setup()

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>")

require("flash").setup()
vim.keymap.set("n", "s", require("flash").jump)
