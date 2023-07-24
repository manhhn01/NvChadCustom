---@type NvPluginSpec[]
local plugins = {
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
    "lewis6991/gitsigns.nvim",
    opts = require "custom.configs.overrides.gitsigns",
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = require "custom.configs.overrides.telescope",
  },

  {
    "NvChad/nvterm",
    opts = require "custom.configs.overrides.nvterm",
  },

  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    opts = require "custom.configs.overrides.cmp",
    config = function(_, opts)
      local cmp = require "cmp"
      cmp.setup(opts)
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
        performance = {
          max_view_entries = 7,
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources { { name = "path" }, { name = "cmdline" } },
        formatting = {
          fields = { "abbr" },
        },
        performance = {
          max_view_entries = 7,
        },
      })
    end,
    dependencies = {
      "hrsh7th/cmp-cmdline",
    },
  },

  {
    "rcarriga/nvim-notify",
    opts = require "custom.configs.notify",
    lazy = false,
    config = function(_, opts)
      vim.notify = require "notify"
      vim.notify.setup(opts)
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = require "custom.configs.overrides.mason",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "custom.configs.overrides.treesitter",
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "custom.configs.overrides.nvim-tree",
    lazy = false,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = require "custom.configs.overrides.indent-blankline",
  },

  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  {
    "phaazon/hop.nvim",
    lazy = false,
    config = function()
      require("hop").setup {
        teasing = false,
      }
    end,
  },

  {
    "bkad/CamelCaseMotion",
    lazy = false,
  },

  {
    "tpope/vim-surround",
    event = "BufReadPost",
  },

  {
    "kevinhwang91/nvim-hlslens",
    event = "BufReadPost",
    opts = require "custom.configs.hlslens",
    config = function(_, opts)
      require("hlslens").setup(opts)
    end,
  },

  {
    "dstein64/nvim-scrollview",
    event = "BufReadPost",
    opts = require "custom.configs.scrollview",
  },

  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = require "custom.configs.dressing",
    config = function(_, opts)
      require("dressing").setup(opts)
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    event = "BufReadPost",
    init = function()
      local opt = vim.opt
      opt.foldcolumn = "1" -- '0' is not bad
      opt.fillchars:append "eob: "
      opt.fillchars:append "fold: "
      opt.fillchars:append "foldopen:"
      opt.fillchars:append "foldsep:│"
      opt.fillchars:append "foldclose:"
      opt.foldlevel = 99 -- Using ufo provider need a large value
      opt.foldlevelstart = 99
      opt.foldenable = true
    end,
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require "statuscol.builtin"
          require("statuscol").setup {
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          }
        end,
      },
    },
    opts = require "custom.configs.vim-ufo",
  },

  {
    "mg979/vim-visual-multi",
    event = "BufReadPost",
  },

  {
    "numToStr/Comment.nvim",
    opts = function()
      local opts = require "custom.configs.overrides.comment"
      return opts
    end,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },

  {
    "abecodes/tabout.nvim",
  },

  {
    "Exafunction/codeium.vim",
    init = function()
      vim.g.codeium_disable_bindings = 1
      vim.g.codeium_filetypes = {
        TelescopePrompt = false
      }
    end,
    event = "BufReadPost",
  },

  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
  }

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
}

return plugins
