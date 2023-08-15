local keymap = vim.keymap

local function find_in_node()
  local s_api, api = pcall(require, 'nvim-tree.api')
  local s_telescope, telescope = pcall(require, 'telescope.builtin')
  if not (s_api or s_telescope) then return end

  local node = api.tree.get_node_under_cursor()

  if node.type == 'directory' then
    telescope.live_grep({
      cwd = node.absolute_path,
      prompt_title = "Find string in " .. node.name .. "/*",
    })
  else
    vim.notify("Not a directory")
  end
end

local function on_attach(bufnr)
  local s_api, api = pcall(require, 'nvim-tree.api')
  if not s_api then return end

  local opts = function(desc)
    return { desc = 'NvimTree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  -- add keymaps
  keymap.set('n', '.', api.node.run.system, opts('System open'))
  keymap.set('n', '<C-h>', api.node.open.horizontal, opts('Open horizontal'))
  keymap.set('n', '\\', find_in_node, opts('Find in node'))

  -- remove keymaps
  keymap.del('n', '<C-x>', { buffer = bufnr })
  keymap.del('n', 's', { buffer = bufnr })
end

return {
  on_attach = on_attach,

  git = {
    enable = true,
  },

  view = {
    width = 40,
  },

  renderer = {
    root_folder_label = true,
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}
