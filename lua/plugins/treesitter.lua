require("nvim-treesitter").install({
	"typescript",
	"javascript",
	"go",
	"lua",
	"templ",
	"html",
	"css",
})

-- Start treesitter for every filetype that has a parser; silently skip the rest.
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})
