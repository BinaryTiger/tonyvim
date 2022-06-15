
local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
  vim.notify("Could not load auto-session")
	return
end

local status_ok_lens, session_lens = pcall(require, "session-lens")
if not status_ok_lens then
  vim.notify("Could not load auto-session")
	return
end

auto_session.setup {
  log_level = 'info',
  auto_session_suppress_dirs = {'~/', '~/src'}
}

session_lens.setup {

}
