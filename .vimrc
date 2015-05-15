set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" My Plugins
Plugin 'derekwyatt/vim-scala'
Plugin 'kien/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/target*,.idea*

"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mdreves/vim-scaladoc'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'spiroid/vim-ultisnip-scala'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'dkprice/vim-easygrep'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomasr/molokai'

"" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" My Config
filetype plugin on
syntax on
set number
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile
set backspace=indent,eol,start
set tags=./.tags;
set mouse=a
set hlsearch

" Buffers 
" Allow switching buffer without saving
set hidden
" F5 - previous buffer
map <F5> :bp<cr>
vmap <F5> <esc>:bp<cr>
imap <F5> <esc>:bp<cr>
" F6 - next buffer
map <F6> :bn<cr>
vmap <F6> <esc>:bn<cr>
imap <F6> <esc>:bn<cr>

" Moving lines
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" NerdTree
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Colorcheme
colorscheme molokai

" minibufexpl
map <C-w> :MBEbd<CR>

" CtrlP
let g:ctrlp_by_filename=1 

nnoremap <C-b> <esc> :CtrlPBuffer <cr>
inoremap <C-b> <esc> :CtrlPBuffer <cr>
vnoremap <C-b> <esc> :CtrlPBuffer <cr>

" Track the engine.
function! g:UltiSnips_Complete()
        call UltiSnips#ExpandSnippet()
        if g:ulti_expand_res == 0
                if pumvisible()
                        return "\<C-n>"
                else
                        call UltiSnips#JumpForwards()
                        if g:ulti_jump_forwards_res == 0
                                return "\<TAB>"
                        endif
                endif
        endif
        return ""
endfunction
au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

" UltiSnipss cofiguration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"smart indent when entering insert mode with i on empty lines
function! IndentWithI()
	if len(getline('.')) == 0
		return "\"_cc"
	else
		return "i"
	endif
endfunction
nnoremap <expr> i IndentWithI()

" workaround for https://github.com/mdreves/vim-scaladoc/issues/1
fun! OpenScalaDoc( arg  )
  call scaladoc#Search(a:arg)
endf
command! -nargs=+ ScalaDoc call OpenScalaDoc('<f-args>')
autocmd FileType scala nnoremap K :call OpenScalaDoc(expand("<cword>"))<CR>
