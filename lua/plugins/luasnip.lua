local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  vim.notify("Could not load LuaSnip")
  return
end

luasnip.config.set_config({ -- Setting LuaSnip config
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
})

require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets/" })

