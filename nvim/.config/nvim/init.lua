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


-- This cmd will switch between absolute and relative line numbers
vim.cmd [[
augroup numbertoggle
autocmd!
autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
]]

