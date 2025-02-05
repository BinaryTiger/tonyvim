-- TODO convert to mini.snippets
return {
  s({trig="rlog", dscr="Easy Rails Logging for Debug"},
    {
      t("Rails.logger.error(\"[ARACINE] "),i(1),t("\")")
    }
  ),
  s({trig="log", dscr="Easy Puts Logging for Debug"},
    {
      t("puts \"[ARACINE] "),i(1),t("\"")
    }
  ),
  --s("test", t("a test snippet"))
  s({trig="cread", dscr="Read STDIN from console"},
    fmt(
      [[
        print "->"
        prompt = $stdin.gets.chomp
        {}
      ]],
      {
        i(1),
      })),

  s({trig="fread", dscr="Read text from file"},
    fmt(
      [[
        ARGF.each_line do |line|
          # process
          {}
        end
      ]],
      {
        i(1),
      })),
}
