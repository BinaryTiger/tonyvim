return {
  {
    prefix = 'minifile',
    body = [[
require 'minitest/autorun'

class Test${1} < Minitest::Test
  def setup
    @subject = ${1}.new
  end

  def test_example
    assert_equal "return value", @subject.method?
  end
end
    ]],
    desc = 'a test file'
  },
  {
    prefix = 'minitest',
    body = [[
def test_${1}
  ${2}
end
    ]],
    desc = 'a test',
  }
}

