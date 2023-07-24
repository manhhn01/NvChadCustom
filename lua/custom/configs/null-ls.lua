local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "javascript", "typescript", "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  b.diagnostics.eslint_d.with({
    prefer_local = "node_modules/.bin",
    -- disabled_filetypes = shared.default_filetype_deny,
  }),
  b.code_actions.eslint_d.with({
    prefer_local = "node_modules/.bin",
    -- disabled_filetypes = shared.default_filetype_deny,
  }),

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
