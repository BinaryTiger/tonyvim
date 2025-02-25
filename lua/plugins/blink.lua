require("blink.cmp").setup({
  keymap = {
    preset = 'enter',
    ['<Tab>'] = {
      function(cmp)
        if cmp.snippet_active() then
          return cmp.accept()
        else
          return cmp.select_next()
        end
      end,
      'snippet_forward',
      'fallback'
    },
  },
  appearance = {
    nerd_font_variant = 'mono'
  },
  signature = {
    enabled = true
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  snippets = { preset = 'mini_snippets' },
  completion = {
    list = {
      selection = {
        preselect = false,
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 250,
      treesitter_highlighting = true,
      window = { border = "rounded" },
    },
    trigger = {
      show_in_snippet = true,
    },
    -- menu = {
    --   auto_show = function(ctx) return ctx.mode ~= 'cmdline' end
    -- },
  },
})
