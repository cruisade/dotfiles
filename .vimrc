set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/bundle')

Plug 'dense-analysis/ale'
  nmap <silent> <leader>a <Plug>(ale_next_wrap)

  " Disabling highlighting
  let g:ale_set_highlights = 0

  " Only run linting when saving the file
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_enter = 0

Plug 'sirver/ultisnips'
  let g:UltiSnipsExpandTrigger="<ENTER>"
  let g:UltiSnipsJumpForwardTrigger="<C-J>"
  let g:UltiSnipsJumpBackwardTrigger="<C-K>"

  let g:UltiSnipsEnableSnipMate = 0
  let g:UltiSnipsSnippetDirectories=[ $HOME . "/.vim/snippets" ]

Plug 'Valloric/YouCompleteMe'

Plug 'itchyny/lightline.vim'

Plug 'sonph/onehalf', {'rtp': 'vim/'}
  let g:lightline = {
      \ 'colorscheme': 'onehalfdark',
      \ }

  func! _setup_colorscheme()
    set background="dark"
    colorscheme onehalfdark
  endfunc!

Plug 'scrooloose/nerdcommenter'
  let g:NERDSpaceDelims = 1

Plug 'scrooloose/nerdtree'
  let g:NERDTreeWinPos = "right"
  let NERDTreeShowHidden=1
  let g:NERDTreeWinSize=35
  let NERDTreeQuitOnOpen=1

  map <leader>nn :NERDTreeToggle<cr>
  map <leader>nb :NERDTreeFromBookmark<Space>
  map <leader>nf :NERDTreeFind<cr>

Plug 'junegunn/goyo.vim'
  let g:goyo_width=100
  let g:goyo_margin_top = 2
  let g:goyo_margin_bottom = 2
  nnoremap <silent> <leader>z :Goyo<cr>

call plug#end()

" :binds
let mapleader = ","

nnoremap <silent> <Leader>/ :noh<CR>

syntax on
set t_Co=256
filetype plugin on
filetype indent on

set history=500
set autoread        " auto file reload
set noswapfile
set shell=zsh\ -i
set laststatus=2
set number

set list            " show spaces as characters
set lcs=trail:·,tab:→\ "

set hlsearch
set incsearch
set ignorecase
set smartcase

set expandtab
set autoindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set backspace=2
set splitright

set cursorline
set completeopt-=preview
set nowrap

set textwidth=79
set timeoutlen=400
set wildmenu

set clipboard=unnamedplus

set pastetoggle=<F11>

augroup setup_colorscheme
  au!
  au VimEnter * call _setup_colorscheme()
augroup end

" :hooks

" delete trailing whitespaces in any file types
autocmd BufWritePre * :%s/\s\+$//e

