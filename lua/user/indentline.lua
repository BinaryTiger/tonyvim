local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
  return
end

-- vim.g.indentLine_enabled = 1
-- vim.g.indent_blankline_show_first_indent_level = true
-- vim.g.indent_blankline_context_patterns = {
--   "class",
--   "return",
--   "function",
--   "method",
--   "^if",
--   "^while",
--   "jsx_element",
--   "^for",
--   "^object",
--   "^table",
--   "block",
--   "arguments",
--   "if_statement",
--   "else_clause",
--   "jsx_element",
--   "jsx_self_closing_element",
--   "try_statement",
--   "catch_clause",
--   "import_statement",
--   "operation_type",
-- }
--vim.opt.listchars = { space = "⋅", eol = "↴", tab = ">~" }
--vim.opt.list = true

ibl.setup({
  exclude = {
    filetypes = { "help", "startify", "dashboard", "packer", "neogitstatus", "NvimTree", "Trouble", "norg" },
  },
  scope = {
    enabled = true,
  }
})
