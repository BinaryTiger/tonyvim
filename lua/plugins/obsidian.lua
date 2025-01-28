local map = require("user.helpers").leader_map
local vmap = require("user.helpers").v_leader_map

-- toggle table mode
require("obsidian").setup({
  workspaces = {
    {
      name = "personal",
      path = "~/notes/obsidian/personal",
    },
    {
      name = "work",
      path = "~/notes/obsidian/work"
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
    nvim_cmp = false,
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

-- link and create
map("wn", "viw :ObsidianLinkNew<cr>", "New Link")
vmap("wn", ":ObsidianLinkNew<cr>", "New Link")

-- link only
map("wl", "viw :ObsidianLink<cr>", "Link")
vmap("wl", ":ObsidianLink<cr>", "Link")

-- search
map("wf", ":ObsidianSearch<cr>", "Search")
map("wt", ":TableModeToggle<cr>", "Toggle Table Mode")

-- create
map("ww", ":ObsidianNew<cr>", "New")

