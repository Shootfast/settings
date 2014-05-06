set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Bundle 'Valloric/YouCompleteMe'

Bundle 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on

" YCM options "
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_error_symbol = '✘'
let g:ycm_warning_symbol = '‼'

" This is to set the terminal to 256 colors "
" (which almost all terminals support) "
set t_Co=256

" Set the colorscheme to something nice "
colorscheme wombat

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

set smartindent
set noexpandtab
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

" Unmap Ex mode key combination "
:map Q <Nop>

let NERDTreeQuitOnOpen=1

nnoremap <F1> :NERDTreeToggle<CR>
inoremap <F1> <C-O>:NERDTreeToggle<CR>
nnoremap <F12> : :silent !Terminal<CR>
inoremap <F12> <C-O>: :silent !Terminal<CR>

" Make the ctrl left and right arrows move one word at a time
nnoremap <silent> <C-Left> b
nnoremap <silent> <C-Right> w


" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Go to definition "
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Automatically reread .vimrc if we just wrote it "
augroup reload_vimrc
    au!
    au BufWritePost $MYVIMRC so $MYVIMRC
	au FocusGained,TabEnter,WinEnter * so $MYVIMRC
augroup END

