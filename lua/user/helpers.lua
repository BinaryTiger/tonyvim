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

function helpers.leader_map(shortcut, mapping, desc, opts)
  opts = opts or { noremap = true, silent = true }
  opts.desc = desc

  vim.api.nvim_set_keymap("n", "<leader>" .. shortcut, mapping, opts)
end

function helpers.v_leader_map(shortcut, mapping, desc, opts)
  opts = opts or { noremap = true, silent = true }
  opts.desc = desc

  vim.api.nvim_set_keymap("v", "<leader>" .. shortcut, mapping, opts)
end

return helpers
