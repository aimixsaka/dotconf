------------------------------
--------- global var ---------
------------------------------
local g = vim.g
-- leader key
g.mapleader = " "

------------------------------
--------- options  -----------
------------------------------
local opt = vim.opt

-- relativenumber
opt.relativenumber = true
opt.number = true

-- persist undo
opt.undofile = true

-- smartcase(must use with ignorecase)
opt.ignorecase = true
opt.smartcase = true

-- add this config as runtime path and packpath
opt.rtp:append("~/.config/nvim_small")
opt.packpath:append("~/.config/nvim_small")

opt.scroll = 10

------------------------------
---------- keymap ------------
------------------------------
local map = vim.keymap.set
local option = { silent = true }

map('n', '<ESC>', ':nohl<CR>', option)
-- copy to system clipboard
map('v', '<leader>y', '"+y', option)
map('n', '<leader>y', 'ggVG"+y', option)

map('i', '<C-w>', '<C-g>u<C-w>', option)
map('i', '<C-u>', '<C-g>u<C-u>', option)
map('i', '<CR>', '<C-g>u<CR>', option)

map('n', '<leader><Space>', '<cmd> wa<CR>')


