local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add"})

vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end, { desc = "GoTo Harpoon 1"})
vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end, { desc = "GoTo Harpoon 2"})
vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end, { desc = "GoTo Harpoon 3"})
vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end, { desc = "GoTo Harpoon 4"})

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-H>", function() harpoon:list():prev() end, { desc = "Harpoon Next"})
vim.keymap.set("n", "<C-S-L>", function() harpoon:list():next() end, { desc = "Harpoon Previous"})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Quick Pick"})
vim.keymap.set("n", "<leader>hs", function() toggle_telescope(harpoon:list()) end, { desc = "Search" })
