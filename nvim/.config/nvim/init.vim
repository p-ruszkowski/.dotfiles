set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab 
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=120                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse clic
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set spell                 " enable spell check (may need to download
" language package)
" " set noswapfile            " disable creating swap file
" " set backupdir=~/.cache/vim " Directory to store backup files.

set cursorline
set encoding=UTF-8

call plug#begin('~/.vim/plugged')
 Plug 'bluz71/vim-moonfly-colors'
 Plug 'rust-lang/rust.vim'
 Plug 'scrooloose/nerdtree'
 Plug 'mhinz/vim-startify'
 Plug 'scrooloose/nerdcommenter'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'jiangmiao/auto-pairs'
 Plug 'leafgarland/typescript-vim'
 Plug 'peitalin/vim-jsx-typescript'
 Plug 'sonph/onehalf', { 'rtp': 'vim' }
 Plug 'Pocco81/Catppuccino.nvim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'folke/tokyonight.nvim', { 'branch': 'main'  } 
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim'
 Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
 Plug 'tpope/vim-fugitive'
call plug#end()

:let mapleader = " "
colorscheme moonfly

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

  set termguicolors
endif

"Navigate through panes
 map <leader>h :wincmd h<CR>
 map <leader>j :wincmd j<CR>
 map <leader>k :wincmd k<CR>
 map <leader>l :wincmd l<CR>

 " Navigate through tabs
 map <leader>th :tabp<CR>
 map <leader>tl :tabn<CR>

" git-fugitive
 nnoremap <leader>fd :Gvdiff :0<CR>
 nnoremap <leader>fa :Git add .<CR>
 nnoremap <leader>fs :Git status<CR>
 nnoremap <leader>fc :Git commit<CR>
 nnoremap <leader>fm :Gdiffsplit!<CR>
 nnoremap <leader>fj :diffget //2<CR>:diffupdate<CR>
 nnoremap <leader>fk :diffget //3<CR>:diffupdate<CR>
 nnoremap <leader>fo :only<CR>
 nnoremap <leader>fch :Git checkout 
" NERDTree mappings
 nnoremap <leader>pt :NERDTreeToggle<CR>
 nnoremap <silent><leader>pv :NERDTreeFind<CR>
 nmap <Leader>pr :NERDTreeFocus<cr>R<c-w><c-p>

 " Telescope 
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Startify mappings
  nnoremap <leader>sf :Startify<CR>


 " COC
 " " Code action on <leader>a
 vmap <leader>a <Plug>(coc-codeaction-selected)<CR>
 nmap <leader>a <Plug>(coc-codeaction-selected)<CR>

 " Format action on <leader>f
 vmap <leader>f  <Plug>(coc-format-selected)
 nmap <leader>f  <Plug>(coc-format-selected)
 " Goto definition
 nmap <silent> gd <Plug>(coc-definition)
 " Open definition in a split window
 nmap <silent> gv :vsp<CR><Plug>(coc-definition)<C-W>L

 nmap <silent> gb <C-O>

" " use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show element documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

set shell=/bin/zsh
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END


let g:startify_custom_header = [
\ '   __   __     ______     ______     __   __   __     __    __     ',  
\ '  /\ "-.\ \   /\  ___\   /\  __ \   /\ \ / /  /\ \   /\ "-./  \    ',  
\ '  \ \ \-.  \  \ \  __\   \ \ \/\ \  \ \ \`/   \ \ \  \ \ \-./\ \   ',  
\ '   \ \_\\"\_\  \ \_____\  \ \_____\  \ \__|    \ \_\  \ \_\ \ \_\  ', 
\ '    \/_/ \/_/   \/_____/   \/_____/   \/_/      \/_/   \/_/  \/_/  ', 
\ '',
\ '',
\ ]

