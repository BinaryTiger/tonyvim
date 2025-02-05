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
local helpers = require("user.helpers")

local function fn(
  args,     -- text from i(2) in this example i.e. { { "456" } }
  parent   -- parent snippet or parent node
)
   return args[1][1]
end

return {
  s({trig="bcadd", dscr="Easy New Transaction"},
    fmt(
      [[
      {} * "{}"
        {} -{} CAD
        {} {} CAD
      ]],
      {
        f(helpers.today),
        i(1),
        i(2),
        i(3),
        i(4),
        f(fn, {3}),
      })
  ),
  s({trig="bccondofee"},
    fmt(
      [[
      {} * "Condo Fee {}"
        Assets:Tangerine:Checking -{} CAD
        Expenses:473Langelier:Fee {} CAD
      {}
      ]],
      {
        f(helpers.today),
        i(1),
        i(2),
        f(fn, {2}),
        i(3),
      })
  ),
  s({trig="bcmortg"},
    fmt(
      [[
        {} * "Mortgage Payment"
          Assets:Tangerine:Checking              -{} CAD
          Expenses:473Langelier:Interests         {} CAD
          Expenses:473Langelier:Taxes             {} CAD
          Assets:473Langelier:Equity              {} CAD
      ]],
      {
        f(helpers.today),
        i(1),
        i(2),
        i(3),
        i(4),
      })
  ),
  s({trig="bccc"},
    fmt(
      [[
        {} * "{}"
          Liabilities:Tangerine:CreditCard       -{} CAD
          Expenses:{}         {} CAD
      ]],
      {
        f(helpers.today),
        i(1),
        i(2),
        i(3),
        f(fn, {2}),
      })
  ),
}
