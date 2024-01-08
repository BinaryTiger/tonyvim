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

local function filename_no_ext(_, _, _)
  return vim.fn.expand('%:t:r')
end

return {
  s({trig="ticket_metadata", dscr="Create norg ticket metadata header"},
    fmt(
      [[
        @document.meta
        title: <> 
        description: 
        authors: aracine
        categories: ticket
        created: 2024-01-03T11:47:09-0500
        updated: 2024-01-03T11:47:09-0500
        version: 1.1.1
        @end


        Link: {https://jobber.atlassian.net/browse/<>}[<>]

        * Action Items
        ** Me
        
        ** Not Me

        * Timeline
      ]],
      {
        f(filename_no_ext),
        f(filename_no_ext),
        f(filename_no_ext),
      },
      {delimiters = "<>"} -- manually specifying angle bracket delimiters
    )
  ),
}
