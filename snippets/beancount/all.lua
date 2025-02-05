return {
  bcadd = {
    body = [[
${=os.date("%Y-%m-%d")} * "${1}"
  ${2} -${3} CAD
  ${4} ${3} CAD]],
    show_condition = function() return vim.bo.filetype == 'beancount' end
  },
  
  bccondofee = {
    body = [[
${=os.date("%Y-%m-%d")} * "Condo Fee ${1}"
  Assets:Tangerine:Checking -${2} CAD
  Expenses:473Langelier:Fee ${2} CAD
${3}]],
    show_condition = function() return vim.bo.filetype == 'beancount' end
  },
  
  bcmortg = {
    body = [[
${=os.date("%Y-%m-%d")} * "Mortgage Payment"
  Assets:Tangerine:Checking              -${1} CAD
  Expenses:473Langelier:Interests         ${2} CAD
  Expenses:473Langelier:Taxes             ${3} CAD
  Assets:473Langelier:Equity              ${4} CAD]],
    show_condition = function() return vim.bo.filetype == 'beancount' end
  },
  
  bccc = {
    body = [[
${=os.date("%Y-%m-%d")} * "${1}"
  Liabilities:Tangerine:CreditCard       -${2} CAD
  Expenses:${3}         ${2} CAD]],
    show_condition = function() return vim.bo.filetype == 'beancount' end
  }
}
