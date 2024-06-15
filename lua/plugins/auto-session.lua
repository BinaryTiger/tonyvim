require("auto-session").setup({
  auto_session_suppress_dirs = { "~/", "~/src" },
  session_lens = {
    load_on_setup = true,
  },
})

vim.keymap.set("n", "<c-s>", require("auto-session.session-lens").search_session, {
  noremap = true,
})
