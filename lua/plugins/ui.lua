require("which-key").setup()

require("gitsigns").setup()

require("nvim-tree").setup({
  view = { width = 50 },
  renderer = { group_empty = true },
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>")

require("telescope").setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git/",
      "dist",
    },
  },
})

vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep)

vim.cmd.colorscheme("catppuccin")
