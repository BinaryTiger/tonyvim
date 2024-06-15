-- Setup Custom wiki path if required
require('kiwi').setup({
    {
        name = "work",
        path = "/home/thunderscore/notes/wiki/work"
    },
    {
        name = "journal",
        path = "/home/username/notes/wiki/journal"
    }
})

-- Use default path (i.e. ~/wiki/)
local kiwi = require('kiwi')

-- Necessary keybindings
vim.keymap.set('n', '<leader>ww', kiwi.open_wiki_index, {})
vim.keymap.set('n', 'T', kiwi.todo.toggle, {})
