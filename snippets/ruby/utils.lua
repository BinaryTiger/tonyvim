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
  s({trig="rlog", dscr="Easy Rails Logging for Debug"},
    {
      t("Rails.logger.error(\"[ARACINE] "),i(1),t("\")")
    }
  ),
  s({trig="flog", dscr="Easy Frizzle Logging for Debug"},
    {
      t("Frizzle.logger.error(\"[ARACINE] "),i(1),t("\")")
    }
  ),
  s({trig="log", dscr="Easy Puts Logging for Debug"},
    {
      t("puts \"[ARACINE] "),i(1),t("\"")
    }
  ),
  --s("test", t("a test snippet"))
}
