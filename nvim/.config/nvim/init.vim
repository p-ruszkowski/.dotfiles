let g:startify_custom_header = [
\ '   __   __     ______     ______     __   __   __     __    __     ',  
\ '  /\ "-.\ \   /\  ___\   /\  __ \   /\ \ / /  /\ \   /\ "-./  \    ',  
\ '  \ \ \-.  \  \ \  __\   \ \ \/\ \  \ \ \`/   \ \ \  \ \ \-./\ \   ',  
\ '   \ \_\\"\_\  \ \_____\  \ \_____\  \ \__|    \ \_\  \ \_\ \ \_\  ', 
\ '    \/_/ \/_/   \/_____/   \/_____/   \/_/      \/_/   \/_/  \/_/  ', 
\ '',
\ '                                           - - - > dotfile by n3rd2',
\ ]

set ignorecase
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set termguicolors

call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mhinz/vim-startify'
Plug 'edluffy/specs.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'atelierbram/vim-colors_atelier-schemes'
Plug 'feline-nvim/feline.nvim'

call plug#end()

colorscheme Atelier_DuneDark 
set shell=/bin/zsh
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END


lua require('n3rd2.init')

