local helpers = {}

function helpers.filename_no_ext(_, _, _)
  return vim.fn.expand('%:t:r')
end

function helpers.today(_, _, _)
  return os.date("%Y-%m-%d")
end

function helpers.now(_, _, time_offset)
  -- offset is in seconds
  return os.date("%H:%M", os.time() + time_offset)
end

return helpers
