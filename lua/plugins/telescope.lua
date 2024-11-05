local actions = require("telescope.actions")
local map = require("user.helpers").leader_map

map("b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Find Buffers")
map("f", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Find Files")
map("F", "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" )

map("sC", "<cmd>Telescope commands<cr>", "Commands")
map("sM", "<cmd>Telescope man_pages<cr>", "Man Pages")
map("sR", "<cmd>Telescope oldfiles<cr>", "Open Recent File")
map("sS", "<cmd>Telescope session-lens search_session<cr>", "Sessions")
map("sb", "<cmd>Telescope git_branches<cr>", "Git Branches")
map("sc", "<cmd>Telescope colorscheme<cr>", "Colorscheme")
map("sh", "<cmd>Telescope help_tags<cr>", "Find Help")
map("sk", "<cmd>Telescope keymaps<cr>", "Keymaps")
map("sm", "<cmd>Telescope marks", "Find Marks")
map("sr", "<cmd>Telescope registers<cr>", "Registers")
map("ss", "<cmd>Telescope grep_string<cr>", "Grep String")
map("sc", "<cmd>Telescope git_commits<cr>", "Commit")
map("sP", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Find Projects")

require("telescope").setup({
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
        ["<esc>"] = actions.close,
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  --   extensions = {
  --      fzf = {
  --          fuzzy = true, -- false will only do exact matching
  --        override_generic_sorter = true -- extension_name = {
  --   extension_config_key = value,
  -- }
  -- please take a look at the readme of the extension you want to configure
  --  }
  --}
})

--require('telescope').load_extension('fzf')
