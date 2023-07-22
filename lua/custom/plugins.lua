---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    config = function(_, opts)
      local cmp = require "cmp"
      cmp.setup(opts)
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        },
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({{ name = 'path' }, { name = 'cmdline', }})
      })
    end,
    dependencies = {
      "hrsh7th/cmp-cmdline",
    }
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = require "custom.configs.overrides.mason"
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "custom.configs.overrides.treesitter"
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "custom.configs.overrides.nvim-tree",
    lazy = false,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = require "custom.configs.overrides.cmp"
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = require "custom.configs.overrides.indent-blankline"
  },

  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  {
    "phaazon/hop.nvim",
    lazy = false,
    config = function()
      require('hop').setup {
        teasing = false
      }
    end
  },

  {
    "bkad/CamelCaseMotion",
    lazy = false,
  },

  {
    "tpope/vim-surround",
    lazy = false,
  }

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
}

return plugins
