local M = {}

M.set_workspace_name = function()
  local tab_names = vim.g.tab_names or {}
  local tab_i = "" .. vim.fn.tabpagenr()

  local name = vim.fn.input "Enter workspace name: "
  if name == "" then
    return
  end

  tab_names[tab_i] = name
  vim.g.tab_names = tab_names

  vim.cmd "redrawtabline"
end

M.del_workspace_name = function()
  local tab_names = vim.g.tab_names or {}
  local tab_i = "" .. vim.fn.tabpagenr()

  tab_names[tab_i] = nil
  vim.g.tab_names = tab_names

  vim.cmd "redrawtabline"
end

return M
