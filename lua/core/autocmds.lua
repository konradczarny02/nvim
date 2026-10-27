vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Reload buffers changed outside nvim (e.g. by an AI agent in another pane).
-- `autoread` only acts when nvim checks the file, so trigger the check here.
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	desc = "Check for files changed on disk",
	callback = function()
		-- :checktime is not allowed in the command-line window
		if vim.fn.getcmdwintype() == "" then
			vim.cmd("checktime")
		end
	end,
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
	desc = "Notify when a buffer was reloaded from disk",
	callback = function(args)
		vim.notify("File reloaded from disk: " .. vim.fn.fnamemodify(args.file, ":~:."), vim.log.levels.INFO)
	end,
})
