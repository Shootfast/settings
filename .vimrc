" This is to set the terminal to 256 colors "
" (which almost all terminals support) "
set t_Co=256

" Set the colorscheme to something nice "
colorscheme wombat

" Enable to cvim plugin "
filetype plugin on

" Show the commands entered in normal mode "
set showcmd

set tabstop=4
set shiftwidth=4

" Enable tab completion for commands "
set wildmode=longest,list,full
set wildmenu

let NERDTreeQuitOnOpen=1

" Enable window title "
set title

if v:version >= 700
  set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
  let OmniCpp_GlobalScopeSearch   = 1
  let OmniCpp_DisplayMode         = 1
  let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
  let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
  let OmniCpp_ShowAccess          = 1 "show access in pop-up
  let OmniCpp_SelectFirstItem     = 1 "select first item in pop-up
  set completeopt=menuone,menu,longest
endif

function! UpdateTags()
  execute ":silent !ctags -R --languages=C++ --c++-kinds=+p --fields=+iaS --extra=+q ./"
  execute ":redraw!"
endfunction

nnoremap <F4> :call UpdateTags() <CR>
nnoremap <F1> :NERDTreeToggle<CR>
nnoremap <F2> :TagbarToggle<CR>

let g:tagbar_type_cpp = {
\ 'ctagsargs' : '-f - --format=2 --excmd=pattern --extra= --fields=nksaSmt --languages=C++ --c++-kinds=+p --fields=+iaS --extra=+q -I "OCIO_NAMESPACE_ENTER=namespace ocio"'
\}
