local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
                                  install_path}
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {
                border = "rounded"
            }
        end
    }
}

-- Install your plugins here
return packer.startup(function(use)
    -- meta
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "moll/vim-bbye" -- better buffer management

    use {
      "lewis6991/gitsigns.nvim",
      config = [[ require("user.gitsigns") ]]
    }

    use {
      "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
      config = [[ require("user.autopairs") ]]
    }
    --use "numToStr/Comment.nvim" -- Easily comment stuff
    --use "nvim-tree/nvim-web-devicons"
    --use "nvim-tree/nvim-tree.lua"
    --use "akinsho/bufferline.nvim" -- buffers as "tabs"
    use {
      "nvim-lualine/lualine.nvim", -- status bar
      config = [[ require("user.lualine") ]]
    }
    --use "akinsho/toggleterm.nvim" -- terminal integration
    -- use "ahmedkhalf/project.nvim" -- easily switch git repos with telescope
    use { -- lazy loading stuff
      "lewis6991/impatient.nvim",
      config = function()
        require("impatient").enable_profile()
      end
    }

    use {
      "lukas-reineke/indent-blankline.nvim",
      config = [[ require("user.indentline") ]]
    }

    use {
      "goolord/alpha-nvim", -- welcome screen
      config = [[ require("user.alpha") ]]
    }
    -- use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
    -- use "folke/which-key.nvim" -- visual menu of multi key mapping for easier discovery
    -- use "rmagatti/auto-session" -- automatic session management
    -- use "rmagatti/session-lens" -- auto-session telescope plugin


    -- snippets
    -- use "L3MON4D3/LuaSnip"

    -- visual
    -- use "RRethy/vim-illuminate" -- intelligently color words using LSP

    use {
      "sainnhe/gruvbox-material",
      config = function()
        vim.cmd "colorscheme gruvbox-material"
      end
    }

    -- better motion
    use {
        "justinmk/vim-sneak",
        config = function ()
          vim.g["sneak#label"]  = 0 -- enable for EasyMotion like labelling
          vim.g["sneak#s_next"] = 1 -- enable jump to next with s
        end
    }

    -- some rspec commands
    -- use {
    --     "thoughtbot/vim-rspec",
    --     ft = {"ruby"}
    -- }

    -- fuzzy finding
    -- use "nvim-telescope/telescope.nvim"

    -- Completion
    -- use {
    --     "hrsh7th/nvim-cmp",
    --     requires = {"hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "hrsh7th/cmp-nvim-lua",
    --                 "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-nvim-lsp"}
    -- }

    -- use {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     config = function()
    --         require("user.copilot")
    --     end
    -- }

    -- -- LSP
    -- use {
    --     "neovim/nvim-lspconfig", -- enable LSP,
    --     requires = {"tamago324/nlsp-settings.nvim", -- language server settings defined in json for
    --     "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
    --     }
    -- }

    -- use {
    --     "williamboman/mason.nvim",
    --     run = ":MasonUpdate", -- :MasonUpdate updates registry contents
    --     requires = {"williamboman/mason-lspconfig.nvim"}
    -- }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      requires = {
        "JoosepAlviste/nvim-ts-context-commentstring", 
        "RRethy/nvim-treesitter-endwise"
      },
      config = [[ require("user.treesitter") ]]
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
