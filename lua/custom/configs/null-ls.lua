local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins
local severity = vim.diagnostic.severity

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with {
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "html", "markdown", "css", "json" },
  },

  b.diagnostics.eslint_d.with {
    prefer_local = "node_modules/.bin",
  },
  b.code_actions.eslint_d.with {
    prefer_local = "node_modules/.bin",
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
