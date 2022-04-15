vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.wo.number = true

vim.g.mapleader = " "

vim.opt.encoding="utf-8"


local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'

vim.call('plug#end')


local keymap = vim.api.nvim_set_keymap

keymap('n', "<leader>pt", ":NERDTreeToggle<CR>", {})
keymap('n', "<leader>pf", ":NERDTreeFind ", {})

keymap('n', "<leader>fa", ":Git add .<CR>", {})
keymap('n', "<leader>fs", ":Git status<CR>", {})
keymap('n', "<leader>fd", ":Gvdiff :0<CR>", {})
keymap('n', "<leader>fj", ":diffget //2<CR>", {})
keymap('n', "<leader>fk", ":diffget //3<CR>", {})
keymap('n', "<leader>fm", ":Gdiffsplit!<CR>", {})
keymap('n', "<leader>fc", ":Git commit<CR>", {})

keymap('n', "<leader>oo", ":only<CR>", {})


-- This cmd will switch between absolute and relative line numbers
vim.cmd [[
augroup numbertoggle
autocmd!
autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
]]

