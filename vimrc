set nocompatible                    " be iMproved, required
set autoindent                      " Copy indent from current line for new line.
set nosmartindent                   " 'smartindent' breaks right-shifting of # lines.

" Set the hidden chars
set listchars=tab:▸\ ,eol:¬
set hidden                          " Keep changed buffers without requiring saves.
set ruler                           " Always show the cursor position.
set showcmd                         " Display incomplete commands.
set number                          " Display line numbers.
set numberwidth=4                   " Minimum number of columns to show for line numbers.
set laststatus=2                    " Always show a status line.
set visualbell t_vb=                " Use null visual bell (no beeps or flashes).
set history=10000                   " Default history is too too small.
set scrolloff=3                     " Context lines at top and bottom of display.
set sidescrolloff=5                 " Context columns at left and right.
set sidescroll=1                    " Number of chars to scroll when scrolling sideways.
set backspace=indent,eol,start      " Backspace over everything in Insert mode

" Tab Key Related
set expandtab                       " Insert spaces for <Tab> press; use spaces to indent.
set smarttab                        " Tab respects 'shiftwidth', 'tabstop', 'softtabstop'.
set tabstop=2                       " Set the visible width of tabs.
set softtabstop=2                   " Edit as if tabs are 2 characters wide.
set shiftwidth=2                    " Number of spaces to use for indent and unindent.
set shiftround                      " Round indent to a multiple of 'shiftwidth'.

" Search Related
set incsearch                       " Do incremental searching.
set hlsearch                        " Highlight latest search pattern.
set ignorecase                      " Ignore case for pattern matches (\C overrides).
set smartcase                       " Override 'ignorecase' if pattern contains uppercase.
set nocursorline                    " Don't highlight the current screen line...
set nocursorcolumn                  " ...or screen column...
set virtualedit=block               " Virtual edit when in visual block mode
set wildmenu                        " Use menu when autocompleting
set wildmode=longest,full           " Use bash style for first tab, then wildmenu for double

" Buffer related configs
set hidden                          " allow hidden buffers
set splitright                      " open vsp to the right
set splitbelow                      " open sp to the below
set iskeyword+=-
set iskeyword+=/
set tags=./tags,tags;$HOME          " Walk up from current directory to the $HOME looking for tag files

" Enable mouse support if it's available.
if has('mouse')
set mouse=a
endif

" get syntax trace stack for vim debugging purposes
nmap <leader>p :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let g:syntastic_js_checkers = ['jshint']

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'
Plugin 'pangloss/vim-javascript'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
set omnifunc=syntaxcomplete#Complete
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
:imap jk <ESC> 
