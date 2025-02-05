local function today()
  return os.date("%Y-%m-%d")
end

return {
  bcadd = {
    body = [[
${=today()} * "${1}"
  ${2} -${3} CAD
  ${4} ${3} CAD]],
    show_condition = function() return vim.bo.filetype == 'beancount' end
  },
  
  bccondofee = {
    body = [[
${=today()} * "Condo Fee ${1}"
  Assets:Tangerine:Checking -${2} CAD
  Expenses:473Langelier:Fee ${2} CAD
${3}]],
    show_condition = function() return vim.bo.filetype == 'beancount' end
  },
  
  bcmortg = {
    body = [[
${=today()} * "Mortgage Payment"
  Assets:Tangerine:Checking              -${1} CAD
  Expenses:473Langelier:Interests         ${2} CAD
  Expenses:473Langelier:Taxes             ${3} CAD
  Assets:473Langelier:Equity              ${4} CAD]],
    show_condition = function() return vim.bo.filetype == 'beancount' end
  },
  
  bccc = {
    body = [[
${=today()} * "${1}"
  Liabilities:Tangerine:CreditCard       -${2} CAD
  Expenses:${3}         ${2} CAD]],
    show_condition = function() return vim.bo.filetype == 'beancount' end
  }
}
