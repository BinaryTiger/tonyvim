local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({
        border = "rounded",
      })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- meta packages
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
  use("nvim-lua/popup.nvim")   -- An implementation of the Popup API from vim in Neovim

  -- utility functions to manage buffers
  use("moll/vim-bbye")

  -- visual git goodies
  use({
    "lewis6991/gitsigns.nvim",
    config = [[ require("user.gitsigns") ]],
  })

  -- better brackets
  use({
    "windwp/nvim-autopairs",
    config = [[ require("user.autopairs") ]],
  })

  -- utility functions to comment stuff
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })

  -- directory explorer
  use({
    "nvim-tree/nvim-tree.lua",
    config = [[ require("user.nvim2tree")]],
    requires = { "nvim-tree/nvim-web-devicons" },
  })

  -- status line
  use({
    "nvim-lualine/lualine.nvim",
    config = [[ require("user.lualine") ]],
  })

  -- lazy loader
  use({
    "lewis6991/impatient.nvim",
    config = function()
      require("impatient").enable_profile()
    end,
  })

  use({
    "akinsho/toggleterm.nvim",
    config = [[ require("user.toggleterm") ]],
  })

  use({
    "lukas-reineke/indent-blankline.nvim",
    config = [[ require("user.indentline") ]],
  })

  -- home page
  use({
    "goolord/alpha-nvim", -- welcome screen
    config = [[ require("user.alpha") ]],
  })

  -- visual menu and keymapping
  use({
    "folke/which-key.nvim",
    config = [[ require("user.which2key") ]],
  })

  -- completion & snippets
  use("L3MON4D3/LuaSnip")
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = [[ require("user.cmp") ]],
  })

  -- LSP server manager
  use({
    "williamboman/mason.nvim",
    run = ":MasonUpdate",
    config = [[ require("user.mason") ]],
    requires = {
      "williamboman/mason-lspconfig.nvim",
    },
  })

  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("user.lsp.options")
      require("user.lsp.keymaps")
      require("user.lsp.configs")
    end,
    requires = {},
  })

  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = [[ require("user.lsp.nullls") ]],
  })

  -- highlight instances of words under cursor using LSP
  use("RRethy/vim-illuminate")

  -- fuzzy finder for everything
  --use {
  -- 'nvim-telescope/telescope-fzf-native.nvim',
  --run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  -- }
  use({
    "nvim-telescope/telescope.nvim",
    config = [[ require("user.360telescope") ]],
  })

  -- project switch in the same nvim instance
  use({
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
      })
      require("telescope").load_extension("projects")
    end,
  })

  -- keep layout and open buffer between restarts
  use({
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        auto_session_suppress_dirs = { "~/", "~/src" },
        session_lens = {
          load_on_setup = true,
        },
      })
      vim.keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, {
        noremap = true,
      })
    end,
  })

  -- colors
  use({
    "sainnhe/gruvbox-material",
    config = function()
      vim.cmd("colorscheme gruvbox-material")
    end,
  })

  -- better motion
  use({
    "justinmk/vim-sneak",
    config = function()
      vim.g["sneak#label"] = 0 -- enable for EasyMotion like labelling
      vim.g["sneak#s_next"] = 1 -- enable jump to next with s
    end,
  })

  -- some rspec commands
  use({
    "thoughtbot/vim-rspec",
    ft = { "ruby" },
  })

  -- use "akinsho/bufferline.nvim" -- buffers as "tabs"

  -- use {
  --     "zbirenbaum/copilot.lua",
  --     cmd = "Copilot",
  --     event = "InsertEnter",
  --     config = function()
  --         require("user.copilot")
  --     end
  -- }

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "RRethy/nvim-treesitter-endwise",
    },
    config = [[ require("user.treesitter") ]],
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
