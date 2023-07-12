local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason").setup()
require("mason-lspconfig").setup()
