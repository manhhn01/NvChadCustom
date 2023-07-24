---@type MappingsTable
local M = {}

M.general = {
  i = {
    ["<c-a>"] = { "ggVG", "Select all", opts = { silent = true } },
  },

  n = {
    ["<c-a>"] = { "ggVG", "Select all", opts = { silent = true } },
    ["<Leader>q"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    ["<leader>n"] = { require("custom.utils").set_workspace_name, "Set workspace name" },
    ["<leader><space>"] = { ":noh<CR>", "No Highlight" },
    ["ss"] = { ":split<CR>", "Split horizontal", opts = { silent = true } },
    ["sv"] = { ":vsplit<CR>", "Split vertical", opts = { silent = true } },
    ["sh"] = { "<C-w>h", "Go to left window", opts = { silent = true } },
    ["sk"] = { "<C-w>k", "Go to top window", opts = { silent = true } },
    ["sj"] = { "<C-w>j", "Go to right window", opts = { silent = true } },
    ["sl"] = { "<C-w>l", "Go to bottom window", opts = { silent = true } },
    ["sH"] = { "<C-w>H", "Move window to left", opts = { silent = true } },
    ["sK"] = { "<C-w>K", "Move window to top", opts = { silent = true } },
    ["sJ"] = { "<C-w>J", "Move window to right", opts = { silent = true } },
    ["sL"] = { "<C-w>L", "Move window to bottom", opts = { silent = true } },
    ["gi"] = { "gi", "Insert to last edit", opts = { silent = true } },

    ["<leader>i"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
  },

  t = {
    ["<C-[>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
  },
}

M.nvimtree = {
  n = {
    ["se"] = { ":NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.tabufline = {
  n = {
    ["<leader>q"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

local camelcasemotion_mappings = {
  ["w"] = { "<Plug>CamelCaseMotion_w", "Next word" },
  ["b"] = { "<Plug>CamelCaseMotion_b", "Previous word" },
}

local hop_mappings = {
  ["f"] = {
    function()
      require("hop").hint_char1 { direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = true }
    end,
    "Hop next character",
    opts = {
      remap = true,
    },
  },
  ["F"] = {
    function()
      require("hop").hint_char1 { direction = require("hop.hint").HintDirection.BEFORE_CURSOR, current_line_only = true }
    end,
    "Hop previous character",
    opts = {
      remap = true,
    },
  },
  ["t"] = {
    function()
      require("hop").hint_char1 {
        direction = require("hop.hint").HintDirection.AFTER_CURSOR,
        current_line_only = true,
        hint_offset = -1,
      }
    end,
    "Hop til next character",
    opts = {
      remap = true,
    },
  },
  ["T"] = {
    function()
      require("hop").hint_char1 {
        direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
        current_line_only = true,
        hint_offset = 1,
      }
    end,
    "Hop til previous character",
  },
  ["<leader>w"] = {
    function()
      require("hop").hint_words { direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = true }
    end,
    "Hop next word",
  },
  ["<leader>k"] = {
    function()
      require("hop").hint_lines { direction = require("hop.hint").HintDirection.BEFORE_CURSOR }
    end,
    "Hop previous line",
  },
  ["<leader>j"] = {
    function()
      require("hop").hint_lines { direction = require("hop.hint").HintDirection.AFTER_CURSOR }
    end,
    "Hop next line",
  },
}

M.hop = {
  n = hop_mappings,
  v = hop_mappings,
  x = hop_mappings,
}

M.camelcasemotion = {
  n = camelcasemotion_mappings,
  x = camelcasemotion_mappings,
}

M.telescope = {
  n = {
    ["<leader>gs"] = { ":Telescope git_status <CR>", "Git status" },
    ["<leader>gt"] = { ":Telescope git_stash <CR>", "Git stash" },
    -- find
    ["<leader>ff"] = { ":Telescope find_files layout_strategy=vertical <CR>", "Find files" },
    ["<leader>fa"] = {
      ":Telescope find_files follow=true no_ignore=true hidden=true layout_strategy=vertical <CR>",
      "Find all",
    },
    ["<leader>fb"] = { ":Telescope buffers layout_strategy=vertical <CR>", "Find buffers" },
    ["<leader>fo"] = { ":Telescope oldfiles layout_strategy=vertical <CR>", "Find oldfiles" },
  },
}

M.gitsigns = {
  n = {
    ["<space>j"] = {
      function()
        if vim.wo.diff then
          return "<space>j"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["<space>k"] = {
      function()
        if vim.wo.diff then
          return "<space>k"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },

    ["<space><space>"] = {
      function()
        require("gitsigns").preview_hunk_inline()
      end,
      "Preview hunk",
    },

    ["<leader>rn"] = {
      function()
        if next(vim.lsp.get_active_clients()) ~= nil then
          vim.lsp.buf.rename()
        end
      end,
      "LSP rename",
    },
  },
}

M.codeium = {
  i = {
    ["<c-u>"] = {
      function()
        return vim.fn["codeium#Accept"]()
      end,
      "Accept suggestion",
      opts = { expr = true },
    },
    ["<c-e>"] = {
      function()
        return vim.fn["codeium#Clear"](1)
      end,
      "Clear suggestion",
      opts = { expr = true },
    },
  },
}

M.lspconfig = {
  n = {
    ["<leader>a"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
  },
}

return M
