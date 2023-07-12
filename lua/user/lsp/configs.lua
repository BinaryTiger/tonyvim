local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  require("illuminate").on_attach(client)
end

lspconfig.solargraph.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    -- this is disabled since I'm using rvm instead of the assumed rbenv
    --cmd = { "solargraph", "stdio" },
    cmd = { "/Users/aracine/.rvm/gems/ruby-2.7.6/bin/solargraph", "stdio" },
    filetypes = { "ruby", "rakefile" },
    init_options = {
      formatting = false,
    },
    --root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git"),
    settings = {
      solargraph = {
        autoformat = false,
        completion = true,
        diagnostic = true,
        references = true,
        rename = false,
        symbols = true,
        useBundler = true,
        --definition = true,
        --declaration = true,
      },
    },
  },
})

lspconfig.lua_ls.setup({})
