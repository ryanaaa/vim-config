set number

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" BEGIN: Vundle configure 
"" https://github.com/VundleVim/Vundle.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible            " be iMproved, required
filetype off                " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'

Plugin 'oplatek/Conque-Shell'
Plugin 'plasticboy/vim-markdown'
Plugin 'pernatiy/taglist.vim'
Plugin 'nvie/vim-flake8'
Plugin 'elzr/vim-json'

call vundle#end()           " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" END: Vundle configure 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set filetype stuff to on
filetype on
filetype indent on
filetype plugin on
syntax on

" tabstop noexpandtab shiftwidth softtabstop
set ts=4
set et 
set sw=4
set sts=4

" fileencoding
set fileencodings=utf-8,gb18030,gbk,gb2312,cp936

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Status Line 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DerekFugitiveStatusLine()
  let status = fugitive#statusline()
  let trimmed = substitute(status, '\[Git(\(.*\))\]', '\1', '')
  let trimmed = substitute(trimmed, '\(\w\)\w\+[_/]\ze', '\1/', '')
  let trimmed = substitute(trimmed, '/[^_]*\zs_.*', '', '')
  if len(trimmed) == 0
    return ""
  else
    return '(' . trimmed[0:10] . ')'
  endif
endfunction
"set statusline+=%f\ %l\:%c
set stl=%f\ %m\ %r%{DerekFugitiveStatusLine()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Shortcut Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <leader>1 :e#1<CR>
map <leader>2 :e#2<CR>
map <leader>3 :e#3<CR>
map <leader>4 :e#4<CR>

" set clipboard=unnamed
" map <F2> :.w !pbcopy<CR><CR>
" map <F3> :r !pbpaste<CR>
map <F2> gg"+yG
map <F3> "+p
nmap cp :let @+ = expand("%")<CR>
nmap cap :let @+ = expand("%:p")<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" spelling mistakes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
abbr Include include


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Below is the settings of plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-----------------------------------------------------------------------------
" NerdTree
"-----------------------------------------------------------------------------
map <F7> :NERDTreeToggle<CR>
imap <F7> <ESC>:NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '\.forexampleanother', '__pycache__']
" let NERDTreeCascadeOpenSingleChildDir=0

"-----------------------------------------------------------------------------
" taglist
"-----------------------------------------------------------------------------
" 按F8按钮，在窗口的左侧出现taglist的窗口,像vc的左侧的workpace
nnoremap <silent> <F8> :TlistToggle<CR><CR>
" 只显示当前文件的tags
let Tlist_Show_One_File=1
" 如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Exit_OnlyWindow=1 
" 在右侧窗口中显示
let Tlist_Use_Right_Window=1
" 自动折叠
let Tlist_File_Fold_Auto_Close=1

"-----------------------------------------------------------------------------
" Fugitive
"-----------------------------------------------------------------------------
" Thanks to Drew Neil
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \  noremap <buffer> .. :edit %:h<cr> |
  \ endif
autocmd BufReadPost fugitive://* set bufhidden=delete

nmap ,gs :Gstatus<cr>
nmap ,ge :Gedit<cr>
nmap ,gw :Gwrite<cr>
nmap ,gr :Gread<cr>

"-----------------------------------------------------------------------------
" vim-markdown
"-----------------------------------------------------------------------------
let g:vim_markdown_folding_disabled = 1

"-----------------------------------------------------------------------------
" ctags
"-----------------------------------------------------------------------------
map <leader><F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"-----------------------------------------------------------------------------
" csope
"-----------------------------------------------------------------------------
"set cscopequickfix=s-,c-,d-,i-,t-,e-
" 0 or s: Find this C symbol
" 1 or g: Find this definition
" 2 or d: Find functions called by this function
" 3 or c: Find functions calling this function
" 4 or t: Find this text string
" 6 or e: Find this egrep pattern
" 7 or f: Find this file
" 8 or i: Find files #including this file
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"-----------------------------------------------------------------------------
" MiniBufExpl
"-----------------------------------------------------------------------------
"let g:miniBufExplorerAutoStart=0
"let g:miniBufExplMapWindowNavVim=1
"let g:miniBufExplMapWindowNavArrows=1
"let g:miniBufExplMapCTabSwitchBufs=1
"let g:miniBufExplModSelTarget=1 
"let g:miniBufExplMoreThanOne=0 
"let g:miniBufExplBuffersNeeded=0
"nmap <leader>bda :bd <C-a> <CR>

"-----------------------------------------------------------------------------
" Flake8
"-----------------------------------------------------------------------------
autocmd FileType python map <buffer> <F4> :call Flake8()<CR>

"-----------------------------------------------------------------------------
" vim-json
"-----------------------------------------------------------------------------
let vim_json_syntax_conceal=0

"set exrc
"set secure

set noswapfile

if filereadable(glob(".lvimrc")) 
    source .lvimrc
endif


"-----------------------------------------------------------------------------
" Highlight Scheme
"-----------------------------------------------------------------------------
" hi StatusLine ctermbg=LightGray
" hi StatusLineNC ctermbg=LightGray
" hi VertSplit ctermbg=LightGray
