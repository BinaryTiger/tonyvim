-- TODO convert to mini.snippets
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
