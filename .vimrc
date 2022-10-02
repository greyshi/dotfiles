" Make Vim more useful
set nocompatible
" Set colorscheme
set termguicolors
let g:dracula_colorterm = 0
let g:dracula_italic = 0
packadd! dracula
syntax enable
colorscheme dracula
"colorscheme evening
" Show matching brackets.
set showmatch
" Enable auto indent
set autoindent
" Enable smart tabs
set smarttab
" Do smart case matching
set smartcase
" Use the OS clipboard by default on versions compiled with +clipboard
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol

if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Expand <Tab>s with spaces; death to tabs!
set expandtab
" Spaces for each step of auto or regular indent
set shiftwidth=4
" Set virtual tab stop compat for 8-wide tabs
set softtabstop=4
" Round indents to multiple of shiftwidth
set shiftround
" Make tabs as wide as two spaces
set tabstop=4
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
"set visualbell
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root ,W
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif

"Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Works with Intellij IdeaVim
nnoremap <Space> :nohlsearch<CR>


" Automatically set paste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Clear search highlighting on space or enter
nnoremap <CR> :noh<CR><CR>

nnoremap <D-v> "+p
