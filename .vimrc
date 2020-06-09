set nocompatible              " be iMproved, required
filetype off                  " required

" Help windows find ~/.vim
if has('win32') || has('win64')
	set guifont=Consolas:h10
	set runtimepath+=~/.vim
	set runtimepath+=~/.vim/after
endif

filetype plugin indent on    " required
syntax on

let g:CSApprox_verbose_level = 0

" Set the colorscheme to something nice "
let g:molokai_original = 1
colorscheme molokai

" Enable window title "
set title

" Show the commands entered in normal mode "
set showcmd

" Show the cursor position "
set ruler

" Highlight all search matches "
set hlsearch

" Stop comments from continuing onto the next line "
set formatoptions-=ro

set autoindent
set nosmartindent
set noet
set tabstop=4
set shiftwidth=4

" Use smart case sensitive searching "
set ignorecase
set smartcase

" Enable tab completion for commands "
set wildmode=longest,list,full
set wildmenu

" Set and show whitespace characters "
set listchars=eol:$,tab:»\ ,trail:.,extends:>,precedes:<,nbsp:.

" Ensure backspace always works as expected "
set backspace=2

" Stop tilde backup files from being created in the current dir
set backupdir=~/.vim/backup//

" Disable swap file creation
set noswapfile

" Make linespace 2 to stop disappearing underscores
set linespace=2

" Relative line numbers
set number
set relativenumber

" Unmap Ex mode key combination "
:map Q <Nop>

" Make the ctrl left and right arrows move one word at a time
nnoremap <silent> <C-Left> b
nnoremap <silent> <C-Right> w


" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

function! SetupPython()
    " Here, you can have the final say on what is set.  So
    " fixup any settings you don't like.
    set noet
    set softtabstop=4
    set tabstop=4
    set shiftwidth=4
    set expandtab
endfunction
command! -bar SetupPython call SetupPython()

function! GuiTabLabel()
  return exists('t:mytablabel') ? t:mytablabel : ''
endfunction
:set guitablabel=%{GuiTabLabel()}
:set go+=e

"inoremap <Up> <NOP>
"inoremap <Down> <NOP>
"inoremap <Left> <NOP>
"inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Enable all python syntax highlighting
let g:python_highlight_all = 1
" Disable concel mode in json plugin
let g:vim_json_syntax_conceal = 0

" Set yaml syntax highlighting on ocio configs
autocmd  BufNewFile,BufRead *.ocio set syntax=yaml

inoremap jk <Esc>
