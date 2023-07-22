---@type MappingsTable
local M = {}

local camelcasemotion_mappings = {
  ["w"] = { "<Plug>CamelCaseMotion_w", "Next word" },
  ["b"] = { "<Plug>CamelCaseMotion_b", "Previous word" }
}

local hop_mappings = {
    ["f"] = {
    function()
      require("hop").hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true })
    end,
    "Hop next character",
    opts = {
      remap = true,
    }
  },
  ["F"] = {
    function()
      require("hop").hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true })
    end,
    "Hop previous character",
    opts = {
      remap = true,
    }
  },
  ["t"] = {
    function()
      require("hop").hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
    end,
    "Hop til next character",
    opts = {
      remap = true,
    }
  },
  ["T"] = {
    function()
      require("hop").hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
    end,
    "Hop til previous character",
  },
  ["<leader>w"] = {
    function()
      require("hop").hint_words({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true })
    end,
    "Hop next word",
  },
  ["<leader>k"] = {
    function()
      require("hop").hint_lines({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR })
    end,
    "Hop previous line",
  },
  ["<leader>j"] = {
    function()
      require("hop").hint_lines({ direction = require('hop.hint').HintDirection.AFTER_CURSOR })
    end,
    "Hop next line",
  },
}

M.general = {
  n = {
    ["<leader>n"] = { require('custom.utils').set_workspace_name, "Set workspace name"},
    ["<leader><space>"] = {":noh<CR>", "No Highlight"},
    ["ss"] = {":split<CR>", "Split horizontal", opts = { silent = true }},
    ["sv"] = {":vsplit<CR>", "Split vertical", opts = { silent = true }},
    ['sh'] = {"<C-w>h", "Go to left window", opts = { silent = true }},
    ['sk'] = {"<C-w>k", "Go to top window", opts = { silent = true }},
    ['sj'] = {"<C-w>j", "Go to right window", opts = { silent = true }},
    ['sl'] = {"<C-w>l", "Go to bottom window", opts = { silent = true }},
    ['sH'] = {"<C-w>H", "Move window to left", opts = { silent = true }},
    ['sK'] = {"<C-w>K", "Move window to top", opts = { silent = true }},
    ['sJ'] = {"<C-w>J", "Move window to right", opts = { silent = true }},
    ['sL'] = {"<C-w>L", "Move window to bottom", opts = { silent = true }},
  }
}

M.nvimtree = {
  n = {
    ["se"] = { ":NvimTreeToggle <CR>", "Toggle nvimtree" },
  }
}

M.tabufline = {
  n = {
    ["<leader>x"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  }
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

return M
