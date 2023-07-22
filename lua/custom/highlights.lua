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

  -- Diagnostic
  DiagnosticUnderlineError = {
    undercurl = true,
  },
  DiagnosticUnderlineWarn = {
    undercurl = true,
  },
  DiagnosticUnderlineInfor = {
    undercurl = true,
  },
  DiagnosticUnderlineInfo = {
    undercurl = true,
  },
  DiagnosticUnderlineHint = {
    undercurl = true,
  },
}

return M
