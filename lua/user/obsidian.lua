require("obsidian").setup({
  workspaces = {
    {
      name = "personal",
      path = "~/notes/obsidian/personal",
    },
  },

  notes_subdir = "inbox",
  new_notes_location = "notes_subdir",
  daily_notes = {
    -- Optional, if you keep daily notes in a separate directory.
    folder = "journal",
    -- Optional, if you want to change the date format for the ID of daily notes.
    date_format = "%Y/%m/%d",
    -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
    template = nil
  },
  -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
  completion = {
    nvim_cmp = true,
    -- Trigger completion at 2 chars.
    min_chars = 2,
  },
  -- Optional, customize how note IDs are generated given an optional title.
  ---@param title string|?
  ---@return string
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will be given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return tostring(os.time()) .. "-" .. suffix
  end,
  mappings = {
    -- Smart action depending on context, either follow link or toggle checkbox.
    ["<cr>"] = {
      action = function()
        return require("obsidian").util.smart_action()
      end,
      opts = { buffer = true, expr = true },
    },
  }
})

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- link and create
keymap("n", "<leader>on", "viw :ObsidianLinkNew<cr>", opts)
keymap("v", "<leader>on", ":ObsidianLinkNew<cr>", opts)

-- link only
keymap("n", "<leader>ol", "viw :ObsidianLink<cr>", opts)
keymap("v", "<leader>ol", ":ObsidianLink<cr>", opts)

-- search
keymap("n", "<leader>of", ":ObsidianSearch<cr>", opts)

-- create
keymap("n", "<leader>nn", ":ObsidianNew<cr>", opts)
