require("blink.cmp").setup({
  keymap = { preset = 'super-tab' },
  appearance = {
    nerd_font_variant = 'mono'
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  snippets = { preset = 'luasnip' },
  completion = {
    trigger = {
      show_in_snippet = false,
    },
    menu = {
      auto_show = function(ctx) return ctx.mode ~= 'cmdline' end 
    },
  },
})
