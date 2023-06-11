local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  s({trig="changemap", dscr="change_map pattern"},
    {
      t("\""),i(1),t("\" => ->(_, current) { {"),i(2),t(": current} },")
    }
  ),
  --s("test", t("a test snippet"))
}
