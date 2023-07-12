vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- this is a comment
require("nvim-tree").setup({
  sort_by = "name",
  update_focused_file = {
    enable = true,
    ignore_list = {},
  },
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = false,
        picker = "default",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
})
