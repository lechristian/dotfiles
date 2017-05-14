call plug#begin('~/.local/share/nvim/plugged')        " Start vim-plug

filetype plugin indent on                             " required
syntax enable                                         " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" git diff in gutter
Plug 'airblade/vim-gitgutter'

" tmux navigation within vim
Plug 'christoomey/vim-tmux-navigator'

" parentheses matching
Plug 'luochen1990/rainbow'

" easy motion
Plug 'easymotion/vim-easymotion'

" easy commenting
Plug 'scrooloose/nerdcommenter'

" syntax checking
Plug 'vim-syntastic/syntastic'

" language pack
Plug 'sheerun/vim-polyglot'

" multi cursor
Plug 'terryma/vim-multiple-cursors'

" git wrapper
Plug 'tpope/vim-fugitive'

" autodetect indent
Plug 'tpope/vim-sleuth'

" auto close and surround
Plug 'tpope/vim-surround'

" autocomplete/deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" deoplete python
Plug 'zchee/deoplete-jedi'

" deoplete javascript
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" auto match html tags
Plug 'Valloric/MatchTagAlways'

" status line
Plug 'vim-airline/vim-airline'

" whitespace
Plug 'ntpeters/vim-better-whitespace'

""
"" Color
Plug 'mhartington/oceanic-next'

call plug#end()                                       " Initialize plugin

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" nvim python settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_host_prog = '/Users/christian/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/christian/.pyenv/versions/neovim3/bin/python'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Color Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Deoplete Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"" tern/javascript
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Airline Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='oceanicnext'
set noshowmode
set laststatus=2
set timeoutlen=300

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Indentation Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autoindent
set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Line Numbering Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set relativenumber
autocmd InsertEnter * :set invrelativenumber
autocmd InsertLeave * :set invrelativenumber

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" NERDCommenter Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDSpaceDelims=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" NERDTree Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>n :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Better Whitespace Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter * EnableStripWhitespaceOnSave

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Python Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Remappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Multicursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-n>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"" Esc to jk
imap jk <Esc>

