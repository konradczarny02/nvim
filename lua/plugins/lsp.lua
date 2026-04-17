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

vim.lsp.enable("gopls")
vim.lsp.enable("ts_ls")

-- diagnostics UI
vim.diagnostic.config({
  float = { border = "rounded" },
  severity_sort = true,
})
