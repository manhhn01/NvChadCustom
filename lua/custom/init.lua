-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local opt = vim.opt
local g = vim.g

g.mapleader = ';'

-- custom close tab
vim.cmd "function! TbTabCloseCustom(a,b,c,d) \n lua require('custom.utils').del_workspace_name(); require('nvchad_ui.tabufline').closeAllBufs('closeTab') \n endfunction"

-- enable undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

