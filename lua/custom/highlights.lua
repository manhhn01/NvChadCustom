-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },

  DiffAdd = {
    bg = "lightgreen",
  },

  DiffDelete = {
    bg = "lightred",
  },

  DiffChange = {
    bg = "lightorange",
  },

  -- For transparent background
  -- CmpDoc = {
  --   bg = "NONE",
  -- },
}

---@type HLTable
M.add = {
  -- Cmp doc border
  CmpDocBorder = { fg = "#545c62", bg = "#272f35" },
  -- IndentBlankline
  IndentBlanklineIndent1 = { fg = "#453941" },
  IndentBlanklineIndent2 = { fg = "#494642" },
  IndentBlanklineIndent3 = { fg = "#3E4A42" },
  IndentBlanklineIndent4 = { fg = "#3F4050" },
  IndentBlanklineIndent5 = { fg = "#334654" },
  IndentBlanklineIndent6 = { fg = "#433B4E" },

  -- vim illuminate
  IlluminatedWordText = { bg = "#363e44" },
  IlluminatedWordRead = { bg = "#363e44" },
  IlluminatedWordWrite = { bg = "#363e44" },

  -- Fold
  FoldColumn = { fg = "#525a60", bg = "NONE" },

  -- Diagnostic
  DiagnosticUnderlineError = {
    undercurl = true,
    sp = "red",
  },
  DiagnosticUnderlineWarn = {
    undercurl = true,
    sp = "yellow",
  },
  DiagnosticUnderlineInfo = {
    undercurl = true,
    sp = "nord_blue",
  },
  DiagnosticUnderlineHint = {
    undercurl = true,
    sp = "purple",
  },

  -- Float
  -- FloatBorder = {
  --   bg = "NONE",
  -- },

  -- Context separator
  TreesitterContextSeparator = {
    fg = "#525a60",
  },

  TreesitterContextBottom = {
    underline = true,
    sp = "#2b2940",
  }
}

return M
