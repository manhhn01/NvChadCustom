-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local opt = vim.opt
local g = vim.g

g.mapleader = ";"

opt.relativenumber = true
opt.scrolloff = 5
opt.shell = "fish"
opt.showbreak = "↪"
opt.list = true
opt.listchars:append "trail:⋅"
opt.listchars:append "multispace:⋅"
opt.fillchars:append { diff = "╱" }

-- custom close tab
vim.cmd "function! TbTabCloseCustom(a,b,c,d) \n lua require('custom.utils').del_workspace_name(); require('nvchad.tabufline').closeAllBufs('closeTab') \n endfunction"

-- enable undercurl
vim.cmd [[let &t_Cs = "\e[4:3m"]]
vim.cmd [[let &t_Ce = "\e[4:0m"]]

-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  command = "silent! lua vim.highlight.on_yank()",
})

-- Turn off number in terminal
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = "setlocal nonumber norelativenumber signcolumn=no",
})

-- Autoclose quickfix
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.cmd "setlocal nonumber"
    vim.keymap.set("n", "q", ":q<CR>", { silent = true, noremap = true, buffer = true })
    vim.keymap.set("n", "<CR>", "<CR>:cclose<CR>", { silent = true, noremap = true, buffer = true })
  end,
})

-- Add commands for mistypes
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("Qa", "qa", {})
vim.api.nvim_create_user_command("QA", "qa", {})
