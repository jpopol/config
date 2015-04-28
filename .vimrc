set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'derekwyatt/vim-scala'
Plugin 'mdreves/vim-scaladoc'
Plugin 'spiroid/vim-ultisnip-scala'
Plugin 'tomasr/molokai'
Plugin 'kien/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/target*,.idea*

Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'fholgado/minibufexpl.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" Plugin setting
"" NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map  :NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>

"" Molokai
syntax on
colorscheme molokai
set background=dark
let g:molokai_original = 1

"" minibufexpl
map  :MBEbd

"" autocompletion
let g:neocomplcache_enable_at_startup = 1

"" tags
set tags=./.tags;

"" Scaladoc
""nnoremap  :call ScalaDoc(expand("<cword>"))
nnoremap <C-v> :call ScalaDoc(expand("<cword>"))<CR>

"" CtrlP
let g:ctrlp_by_filename=1 

" General settings
set mouse=a
set backspace=2
set title
set nobackup
set nowb
set noswapfile
set expandtab
set number
