local lspconfig = require("lspconfig")

require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
    })
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  -- ["rust_analyzer"] = function ()
  --     require("rust-tools").setup {}
  -- end,
  ["solargraph"] = function()
    lspconfig.solargraph.setup({
      capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
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
            useBundler = false,
            --definition = true,
            --declaration = true,
          },
        },
      },
    })
  end,
})
