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

return {
  s({trig="ticket_metadata", dscr="Create norg ticket metadata header"},
    fmt(
      [[
        @document.meta
        title: <> 
        description: 
        authors: aracine
        categories: ticket
        created: <>T<>-0500
        updated: <>T<>-0500
        version: 1.1.1
        @end


        Link: {https://jobber.atlassian.net/browse/<>}[<>]

        * Action Items
        ** Me
        
        ** Not Me

        * Timeline
      ]],
      {
        f(helpers.filename_no_ext),
        f(helpers.today),
        f(helpers.now),
        f(helpers.today),
        f(helpers.now),
        f(helpers.filename_no_ext),
        f(helpers.filename_no_ext),
      },
      {delimiters = "<>"} -- manually specifying angle bracket delimiters
    )
  ),
  s({trig="prod_day_loop", dscr="Create a production loop tracker for the day"},
    fmt(
      [[
        * <>
        ** <> - <>

        *** Goal
            - ( ) <>
        *** Notes

      ]],
      {
        f(helpers.today),
        f(helpers.now),
        f(helpers.now),
        i(1),
      },
      {delimiters = "<>"}
    )
  ),

  s({trig="prod_block_loop", dscr="Create a production loop tracker for the next block"},
    fmt(
      [[
        ** <> - <>

        *** Goal
            - ( ) <>
        *** Notes

      ]],
      {
        f(helpers.now),
        f(helpers.now),
        i(1),
      },
      {delimiters = "<>"}
    )
  ),
}
