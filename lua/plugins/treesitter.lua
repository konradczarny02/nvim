require('nvim-treesitter').install{ 'typescript', 'javascript', 'go', 'lua', 'templ', 'html', 'css' }

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'templ' },
  callback = function() vim.treesitter.start() end,
})
