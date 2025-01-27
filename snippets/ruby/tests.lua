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

local function dup(
  args,     -- text from i(2) in this example i.e. { { "456" } }
  parent   -- parent snippet or parent node
)
   return args[1][1]
end

return {
  s({trig="minifile", dscr="minitest file scaffolding"},
    fmt(
      [[
        require 'minitest/autorun'

        class Test{} < Minitest::Test
          def setup
            @subject = {}.new
          end
          {}
          def test_example
            assert_equal "return value", @subject.method?
          end
        end
      ]],
      {
        i(1),
        f(dup, {1}),
        i(2),
      })
  ),
  s({trig="minitest"},
    fmt(
      [[
        def test_{}
          {}
        end
      ]],
      {
        i(1),
        i(2),
      })
  ),
}
