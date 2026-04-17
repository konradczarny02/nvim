require("nvim-treesitter").setup({
  ensure_installed = { "javascript", "typescript", "go", "lua", "bash", "c", "lua", "html", "vim", "vimdoc" },
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(_, buf)
      local max = 200 * 1024
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      return ok and stats and stats.size > max
    end,
  },
})
