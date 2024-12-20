local map = require("user.helpers").leader_map

map("gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit")
map("gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk")
map("gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk")
map("gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame")
map("gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk")
map("gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk")
map("gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer")
map("gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk")
map("gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk")
map("gd", "<cmd>Gitsigns diffthis HEAD<cr>", "Diff")

require("gitsigns").setup({
  signs = {
    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "󱅇", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false,    -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false,   -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false,
  },
})

