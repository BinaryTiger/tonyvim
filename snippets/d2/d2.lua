local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  s("image",
    fmta(
      [[
        <>: {
          shape: image
          icon: ./icons/<>.<>
          height: 75
          width: 75
        }
      ]],
      {
        i(1),
        rep(1),
        c(2, {t("png"), t("webp"), t("svg")}),
      }
    )
  )
}
