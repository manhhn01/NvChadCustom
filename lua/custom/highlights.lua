-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  -- IndentBlankline
  IndentBlanklineIndent1 = { fg = '#453941' },
  IndentBlanklineIndent2 = { fg = '#494642' },
  IndentBlanklineIndent3 = { fg = '#3E4A42' },
  IndentBlanklineIndent4 = { fg = '#3F4050' },
  IndentBlanklineIndent5 = { fg = '#334654' },
  IndentBlanklineIndent6 = { fg = '#433B4E' },

  -- Fold
  FoldColumn = { fg = "#525a60", bg = "NONE" },

  -- Diagnostic
  DiagnosticUnderlineError = {
    undercurl = true,
    sp = "red"
  },
  DiagnosticUnderlineWarn = {
    undercurl = true,
    sp="yellow"
  },
  DiagnosticUnderlineInfo = {
    undercurl = true,
    sp = "nord_blue"
  },
  DiagnosticUnderlineHint = {
    undercurl = true,
    sp = "purple"
  },

  -- Float
  FloatBorder = {
    bg = "NONE"
  }
}

return M
