local helpers = {}

function helpers.filename_no_ext(_, _, _)
  return vim.fn.expand('%:t:r')
end

function helpers.today(_, _, _)
  return os.date("%Y-%m-%d")
end

function helpers.now(_, _, _)
  return os.date("%H:%M")
end

return helpers
