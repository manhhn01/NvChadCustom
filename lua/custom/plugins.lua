---@diagnostic disable: different-requires
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
    dependencies = {
      "nvim-telescope/telescope-symbols.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        lazy = false,
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        config = function()
          require("telescope").load_extension "fzf"
        end,
      },
    },
  },

  {
    "NvChad/nvterm",
    opts = require "custom.configs.overrides.nvterm",
  },

  {
    "folke/which-key.nvim",
    opts = require "custom.configs.overrides.whichkey",
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
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = require "custom.configs.lsp-signature",
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
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
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-context",
        opts = require "custom.configs.treesitter-context",
        config = function(_, opts)
          require("treesitter-context").setup(opts)
        end,
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "custom.configs.overrides.nvim-tree",
    lazy = false,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
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
    config = function()
      vim.g.VM_maps["Select Cursor Down"] = "<M-j>"
      vim.g.VM_maps["Select Cursor Up"] = "<M-k>"
      vim.g.VM_maps["Undo"] = "u"
      vim.g.VM_theme = "codedark"
      vim.g.VM_silent_exit = 1
    end,
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
    event = "BufReadPost",
    opts = require "custom.configs.tabout",
    config = function(_, opts)
      require("tabout").setup(opts)
    end,
  },

  {
    "Exafunction/codeium.vim",
    enabled = false,
    init = function()
      vim.g.codeium_disable_bindings = 1
      vim.g.codeium_filetypes = {
        TelescopePrompt = false,
        DressingInput = false,
      }
    end,
    event = "BufReadPost",
  },

  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
  },

  {
    "windwp/nvim-ts-autotag",
    event = "BufReadPost",
  },

  {
    "utilyre/barbecue.nvim",
    enabled = true,
    event = "BufReadPost",
    opts = require "custom.configs.barbecue",
    config = function(_, opts)
      require("barbecue").setup(opts)
    end,
    dependencies = {
      "SmiteshP/nvim-navic",
    },
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "BufReadPost",
    cmd = { "Lspsaga" },
    opts = require "custom.configs.lspsaga",
    config = function(_, opts)
      require("lspsaga").setup(opts)
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function(_, opts)
      require("todo-comments").setup(opts)
    end,
  },

  {
    "folke/trouble.nvim",
    -- event = "BufReadPost",
    cmd = { "Trouble" },
    -- opts = require "custom.configs.trouble",
    config = function(_, opts)
      require("trouble").setup(opts)
    end,
  },

  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },

  {
    "luckasRanarison/nvim-devdocs",
    event = "VeryLazy",
    opts = require "custom.configs.devdocs",
    config = function(_, opts)
      require("nvim-devdocs").setup(opts)
    end,
  },
  {
    "dgagn/diagflow.nvim",
    enabled = false,
    event = "LspAttach",
    opts = {},
  },
  {
    "VidocqH/lsp-lens.nvim",
    event = "VeryLazy",
    opts = require "custom.configs.lsp-lens",
    config = function(_, opts)
      require("lsp-lens").setup(opts)
    end,
  },
  {
    "David-Kunz/jester",
    enabled = false,
    -- config = function()
    --   require("jester").setup()
    -- end,
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    event = "WinNew",
    opts = require "custom.configs.colorful-winsep",
    config = function(_, opts)
      require("colorful-winsep").setup(opts)
    end,
  },
  {
    "jbyuki/instant.nvim",
    enabled = false,
    event = "VeryLazy",
    init = function(_)
      vim.g.instant_username = "Mac"
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = require "custom.configs.copilot",
    config = function(_, opts)
      require("copilot").setup(opts)
    end,
  },
  {
    "elgiano/nvim-treesitter-angular",
    branch = "topic/jsx-fix",
    event = "BufReadPost",
  },

  {
    "j-hui/fidget.nvim",
    enabled = false,
    opts = {
      progress = {
        ignore_done_already = true,
      },
    },
    event = "VeryLazy",
  },
}

return plugins
