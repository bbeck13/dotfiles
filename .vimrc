runtime! archlinux.vim
set nocompatible               " be iMproved
filetype off                   " required!

"Bundles / plugins
call vundle#rc()

Bundle 'Raimondi/delimitMate'
Bundle 'bling/vim-airline'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'scrooloose/syntastic'
Bundle 'tomasr/molokai'
Bundle 'davidhalter/jedi-vim'
Bundle 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/restore_view.vim'
Plugin 'ervandew/supertab'
"Plugin 'Valloric/YouCompleteMe' could be good but supertab does well enough
"Bundle 'edkolev/tmuxline.vim'
"Bundle 'bling/vim-bufferline'

filetype plugin indent on

"syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"minibuf
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

"airline
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:molokai_original = 1
let g:rehash256 = 1
"let NERDTreeShowHidden = 1

"airline shit
set laststatus=2
set history=50

"general stuff
"set relativenumber
set viewoptions=cursor,folds,slash,unix
let g:skipview_files = ['*\.vim']
set number
syntax enable
set expandtab
autocmd FileType make setlocal noexpandtab
set shiftwidth=3
set softtabstop=3
set showcmd
set spell spelllang=en_us
setlocal spell spelllang=en_us
set ai
set si
set undofile
set clipboard=unnamed
set clipboard=unnamedplus
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
"colorscheme solarized
colorscheme molokai
highlight LineNr ctermfg=grey ctermbg=darkgrey
highlight LineNr ctermfg=grey
hi Visual term=reverse cterm=reverse guibg=Grey
hi Search term=reverse cterm=reverse guibg=Grey
"set background=transparent

"remapings
nnoremap <space> :
nnoremap j gj
nnoremap k gk
nnoremap nn :bn<cr>
nnoremap np :bp<cr>
nnoremap nb :badd .<cr>
nnoremap bd :bd<CR>
nnoremap <C-c> :x<CR>
nnoremap <S-w> :w<cr>
vnoremap <Space> zf
nnoremap <CR> za

"remember cursor position
if has("autocmd")
   augroup redhat
   autocmd!
   autocmd BufRead *.txt set tw=78
   autocmd BufReadPost *
   \ if line("'\"") > 0 && line ("'\"") <= line("$") |
   \   exe "normal! g'\"" |
   \ endif
   autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
endif
