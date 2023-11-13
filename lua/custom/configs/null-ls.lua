local present, null_ls = pcall(require, "null-ls")
local u = require("null-ls.utils")

if not present then
  return
end

local conditional_utils = u.make_conditional_utils();

local b = null_ls.builtins
local severity = vim.diagnostic.severity

local sources = {
  b.formatting.prettier.with {
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "html", "markdown", "css", "scss", "json" },
  },

  b.diagnostics.eslint_d.with {
    prefer_local = "node_modules/.bin",
    cwd = function(params)
      return require("lspconfig.util").root_pattern "tsconfig.json"(params.bufname)
    end,
    condition = function(utils)
      return conditional_utils.root_has_file({ ".eslintrc", ".eslintrc.json", ".eslintrc.js"})
    end,
  },
  b.code_actions.eslint_d.with {
    prefer_local = "node_modules/.bin",
    cwd = function(params)
      return require("lspconfig.util").root_pattern "tsconfig.json"(params.bufname)
    end,
  },

  b.diagnostics.cspell.with {
    disabled_filetypes = {
      "fugitive",
      "NvimTree",
      "dbui",
      "DressingSelect",
      "alpha",
      "Troublel",
      "DiffviewFiles",
      "dbui",
    },
    diagnostic_config = {
      underline = true,
      virtual_text = false,
      signs = false,
      update_in_insert = false,
      severity_sort = true,
    },
    diagnostics_postprocess = function(diagnostic)
      diagnostic.severity = severity.HINT
    end,
  },
  b.code_actions.cspell,

  -- Lua
  b.formatting.stylua,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
