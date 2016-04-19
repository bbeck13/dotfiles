runtime! archlinux.vim
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
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
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'guns/vim-sexp'
Plugin 'wlangstroth/vim-racket'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tikhomirov/vim-glsl'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'kien/ctrlp.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jeetsukumaran/vim-buffergator'
"Plugin 'bling/vim-bufferline'
"Plugin 'Valloric/YouCompleteMe' could be good but supertab does well enough
"Bundle 'edkolev/tmuxline.vim'

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
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:molokai_original = 1
let g:rehash256 = 1
"if (system("ps -aux | grep Xorg"))
"   let g:airline_powerline_fonts = 1
"else
"   let g:airline_powerline_fonts = 0
"endif
"let NERDTreeShowHidden = 1

"airline
set laststatus=2
set history=50

"general stuff
"set relativenumber
set viewoptions=cursor,folds,slash,unix
set tw=80
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
set lazyredraw
set noshowmode
set formatoptions=tcrqn
set wrap linebreak nolist
set showbreak=->
set clipboard=unnamed
set clipboard=unnamedplus
set wildmode=longest,list,full
set wildmenu
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
colorscheme molokai
highlight LineNr ctermfg=grey ctermbg=black
hi Visual term=reverse cterm=reverse guibg=Grey
hi Search term=reverse cterm=reverse guibg=Grey

"remapings
nnoremap <space> :
nnoremap j gj
nnoremap k gk
nnoremap ns :set nospell<cr>
nnoremap ss :set spell<cr>
nnoremap > :bn<cr>
nnoremap < :bp<cr>
nnoremap \p :bp<cr>
nnoremap \<space> :bn<cr>
nnoremap e :e .<cr>
nnoremap <C-n> :NERDTreeToggle<cr>
nnoremap bd :bd<CR>
nnoremap <C-c> :x<CR>
nnoremap \w :w<cr>
nnoremap <C-]> :set colorcolumn=80<cr>
nnoremap <C-[> :set colorcolumn=0<cr><cr>
vnoremap <Space> zf
nnoremap <CR> za
nnoremap <C-i> mzgg=G`z
nnoremap <C-b> :BuffergatorOpen<cr>
nnoremap <C-j> :BuffergatorTabsOpen<cr>
nnoremap \l :b#<cr>

"Functions
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

   " IMPORTANT: Uncomment one of the following lines to force
   " using 256 colors (or 88 colors) if your terminal supports it,
   " but does not automatically use 256 colors by default.
   set t_Co=256
   "set t_Co=88
   if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
            \ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
      " Use the guicolorscheme plugin to makes 256-color or 88-color
      " terminal use GUI colors rather than cterm colors.
      runtime! plugin/guicolorscheme.vim
      "GuiColorScheme molokai
   else
      " For 8-color 16-color terminals or for gvim, just use the
      " regular :colorscheme command.
      "colorscheme molokai
   endif
   if has("autocmd")
      au BufReadPost *.rkt,*.rktl set filetype=racket
      au filetype racket set lisp
      au filetype racket set autoindent
   endif

   "if has("autocmd")
   "   au BufReadPost *.rkt,*.rktl set filetype=racket
   "   au filetype racket set lisp
   "   au filetype racket set autoindent
   "endif
