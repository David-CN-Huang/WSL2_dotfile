---------------------------------------------------------------------------------------------------
-- Plugin list
---------------------------------------------------------------------------------------------------
local plugins = {
  -- Packer can manage itself as an optional plugin
  { "wbthomason/packer.nvim", },
  -- lsp
  { "neovim/nvim-lspconfig", },
  { "tamago324/nlsp-settings.nvim", },
  { "jose-elias-alvarez/null-ls.nvim", },
  { "antoinemadec/FixCursorHold.nvim", }, -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  { "williamboman/nvim-lsp-installer", },
  -- color scheme
  { "lunarvim/onedarker.nvim",
    config = function()
      pcall(function()
        if mycode and mycode.ui.colorscheme == "onedarker" then
          require("onedarker").setup()
        end
      end)
    end
  },
  { "rcarriga/nvim-notify",
    requires = { "nvim-telescope/telescope.nvim" },
  },
  { "Tastyep/structlog.nvim", },
  { "nvim-lua/popup.nvim", },
  { "nvim-lua/plenary.nvim", },
  -- Telescope
  { "nvim-telescope/telescope.nvim", },
  { "nvim-telescope/telescope-fzf-native.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    run = "make",
  },
  -- Install nvim-cmp, and buffer source as a dependency
  { "hrsh7th/nvim-cmp",
    requires = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
  },
  { "rafamadriz/friendly-snippets", },
  { "L3MON4D3/LuaSnip",
    config = function()
      local paths = {
        join_paths(get_dir_runtime(), "site", "pack", "packer", "start", "friendly-snippets"),
      }
      local user_snippets = join_paths(get_dir_config(), "snippets")
      if is_directory(user_snippets) then
        paths[#paths + 1] = user_snippets
      end
      require("luasnip.loaders.from_lua").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = paths,
      }
      require("luasnip.loaders.from_snipmate").lazy_load()
    end,
  },
  { "hrsh7th/cmp-nvim-lsp", },
  { "saadparwaiz1/cmp_luasnip", },
  { "hrsh7th/cmp-buffer", },
  { "hrsh7th/cmp-path", },
  { "max397574/lua-dev.nvim", 
    module = "lua-dev",
  },
  -- Autopairs
  { "windwp/nvim-autopairs",
  },
  -- Treesitter
  { "nvim-treesitter/nvim-treesitter",
  },
  { "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPost",
  },
  -- NvimTree
  { "kyazdani42/nvim-tree.lua", },
  { "lewis6991/gitsigns.nvim",
    event = "BufRead",
  },
}

return plugins
