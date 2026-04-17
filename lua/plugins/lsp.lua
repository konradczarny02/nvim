local capabilities = require("blink.cmp").get_lsp_capabilities()

-- GO
vim.lsp.config("gopls", {
  capabilities = capabilities,
  settings = {
    gopls = {
      gofumpt = true,
      staticcheck = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
    },
  },
})

-- TS
vim.lsp.config("ts_ls", {
  capabilities = capabilities,
  settings = {
    typescript = {
      tsserver = {
        maxTsServerMemory = 4096,
      },
    },
  },
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
})


vim.lsp.config("templ", {
  capabilities = capabilities
})

vim.lsp.config("lua_ls", {
  capabilities = capabilities
})

vim.lsp.config("tailwindcss", {
  capabilities = capabilities
})



vim.lsp.enable("gopls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("templ")
vim.lsp.enable("lua_ls")
vim.lsp.enable("tailwindcss")

-- diagnostics UI
vim.diagnostic.config({
  float = { border = "rounded" },
  severity_sort = true,
})
