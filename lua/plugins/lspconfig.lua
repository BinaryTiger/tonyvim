local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn",  text = "" },
  { name = "DiagnosticSignHint",  text = "" },
  { name = "DiagnosticSignInfo",  text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- TODO map when needed
--   a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
--   d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics" },
--   w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
--   f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
--   i = { "<cmd>LspInfo<cr>", "Info" },
--   I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
--   j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
--   k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
--   l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
--   q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
--   r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
--   s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
--   S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
-- },

local config = {
  virtual_text = false,
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)
--vim.lsp.set_log_level("debug")

vim.lsp.handlers["textdocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textdocument/signaturehelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local bufnr = ev.buf
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    --vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<A-.>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "[d",
      '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
      opts
    )
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "]d",
      '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
      opts
    )
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])
  end,
})

require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
local servers = {
  lua_ls = {},
  vale_ls = {},
  taplo = {},
  lemminx = {},
  omnisharp = {},
  -- ruby_lsp = {},
  gopls = {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        gofumpt = true,
      },
    },
  },
}

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {
      capabilities = require('blink.cmp').get_lsp_capabilities(),
      --on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}

local lspconfig = require('lspconfig')
lspconfig.ruby_lsp.setup({
  capabilities = capabilities,
  cmd = { "ruby-lsp"},
  init_options = {
    formatter = 'standard',
    linters = { 'rubocop' },
  },
})
