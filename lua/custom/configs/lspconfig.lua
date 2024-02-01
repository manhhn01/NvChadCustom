local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "clangd", "jsonls", "prismals" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      importModuleSpecifierPreference = "shortest",
    },
  },
}

local local_node_module = vim.fn.getcwd() .. "/node_modules"
local language_server = "/Users/markng/.nvm/versions/node/v16.20.2/lib/node_modules"
local cmd = {
  "ngserver",
  "--stdio",
  "--tsProbeLocations",
  local_node_module,
  "--ngProbeLocations",
  language_server,
}

lspconfig.angularls.setup {
  cmd = cmd,
  on_new_config = function(new_config)
    new_config.cmd = cmd
  end,
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Remove notify on hover
vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
  config = config or {}
  config.focus_id = ctx.method
  if not (result and result.contents) then
    return
  end
  local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
  markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
  if vim.tbl_isempty(markdown_lines) then
    return
  end
  return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
end
