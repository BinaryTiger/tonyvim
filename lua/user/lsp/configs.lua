local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  require("illuminate").on_attach(client)
end

_timers = {}
local function setup_diagnostics(client, buffer)
  if require("vim.lsp.diagnostic")._enable then
    return
  end

  local diagnostic_handler = function()
    local params = vim.lsp.util.make_text_document_params(buffer)
    client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
      if err then
        local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
        vim.lsp.log.error(err_msg)
      end
      local diagnostic_items = {}
      if result then
        diagnostic_items = result.items
      end
      vim.lsp.diagnostic.on_publish_diagnostics(
        nil,
        vim.tbl_extend("keep", params, { diagnostics = diagnostic_items }),
        { client_id = client.id }
      )
    end)
  end

  diagnostic_handler() -- to request diagnostics on buffer when first attaching

  vim.api.nvim_buf_attach(buffer, false, {
    on_lines = function()
      if _timers[buffer] then
        vim.fn.timer_stop(_timers[buffer])
      end
      _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
    end,
    on_detach = function()
      if _timers[buffer] then
        vim.fn.timer_stop(_timers[buffer])
      end
    end,
  })
end

require("lspconfig").ruby_ls.setup({
  on_attach = function(client, buffer)
    setup_diagnostics(client, buffer)
  end,
})

-- lspconfig.solargraph.setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   --cmd = { "/Users/aracine/.rvm/gems/ruby-3.2.2/bin/solargraph", "stdio" },
--   -- this is disabled since I'm using rvm instead of the assumed rbenv
--   cmd = { "solargraph", "stdio" },
--   filetypes = { "ruby", "rakefile" },
--   init_options = {
--     formatting = false,
--   },
--   --root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git"),
--   settings = {
--     solargraph = {
--       autoformat = false,
--       completion = true,
--       diagnostic = true,
--       references = true,
--       rename = false,
--       symbols = true,
--       useBundler = true,
--       --definition = true,
--       --declaration = true,
--     },
--   },
-- })

lspconfig.lua_ls.setup({})
