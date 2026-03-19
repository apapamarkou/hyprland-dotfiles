require("nvchad.configs.lspconfig").defaults()

local servers = {
  "bashls",
  "pyright",
  "html",
  "cssls",
  "jdtls",
}

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
