call plug#begin('~/.local/share/nvim/plugged')        " Start vim-plug

filetype plugin indent on                             " required
syntax enable                                         " required

" git diff in gutter
Plug 'airblade/vim-gitgutter'

" parentheses matching
Plug 'luochen1990/rainbow'

" easy commenting
Plug 'scrooloose/nerdcommenter'

" git wrapper
Plug 'tpope/vim-fugitive'

" autodetect indent
Plug 'tpope/vim-sleuth'

" auto close and surround
Plug 'tpope/vim-surround'

" status line
Plug 'vim-airline/vim-airline'

" whitespace
Plug 'ntpeters/vim-better-whitespace'

" multi cursor
Plug 'mg979/vim-visual-multi'

" easymotion
Plug 'easymotion/vim-easymotion'

" syntax
Plug 'vim-syntastic/syntastic'

" swift
Plug 'keith/swift.vim'

" rust
Plug 'rust-lang/rust.vim'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" deoplete
if has('nvim')
  Plug 'dense-analysis/ale'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/echodoc.vim'
  Plug 'deoplete-plugins/deoplete-jedi'
endif

""
"" Color
Plug 'mhartington/oceanic-next'

call plug#end()                                       " Initialize plugin

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" lua
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require('config')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Python Provider
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("nvim")
  let g:python_host_prog = $HOME . "/.pyenv/versions/nvim2/bin/python"
  let g:python3_host_prog = $HOME . "/.pyenv/versions/nvim3/bin/python"
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Deoplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 let g:deoplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_linters = { 'python' : ['flake8'] }
let g:ale_fixers = { 'python' : ['yapf', 'isort'] }
let g:ale_python_flake8_executable = $HOME . "/.pyenv/versions/nvim3/bin/flake8"
let g:ale_python_flake8_use_global = 1
let g:ale_python_yapf_executable = $HOME . "/.pyenv/versions/nvim3/bin/yapf"
let g:ale_python_yapf_use_global = 1
let g:ale_python_isort_executable = $HOME . "/.pyenv/versions/nvim3/bin/isort"
let g:ale_python_isort_use_global = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Rust
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:rustfmt_autosave = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Airline Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='oceanicnext'
set noshowmode
set laststatus=2
set timeoutlen=300

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" NERDCommenter Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDSpaceDelims=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Color Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (has("termguicolors"))
  set termguicolors
endif

syntax enable
set background=dark
colorscheme OceanicNext

set colorcolumn=101
hi SignColumn cterm=NONE ctermbg=NONE

set fillchars+=vert:│
hi VertSplit ctermbg=NONE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ttyfast
set ruler
set showcmd
set showmatch
set nowrap

set hlsearch
set incsearch
set ignorecase
set smartcase

set clipboard=unnamed

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Indentation Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autoindent
set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Line Numbering Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set relativenumber
autocmd InsertEnter * :set invrelativenumber
autocmd InsertLeave * :set invrelativenumber
