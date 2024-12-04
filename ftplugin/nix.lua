local map = require("user.helpers").leader_map

map("x.", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Actions")

local nvim_lsp = require("lspconfig")
nvim_lsp.nil_ls.setup({
   settings = {
      ['nil'] = {
         formatting = {
            command = { "nixfmt" },
         },
      },
   },
})
