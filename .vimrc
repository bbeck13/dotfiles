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
Plugin 'Chiel92/vim-autoformat'
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'lervag/vimtex'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'Shougo/unite.vim'
"Plugin 'Rip-Rip/clang_complete'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mbbill/undotree'
Plugin 'bbchung/clighter'
Plugin 'reedes/vim-pencil'
Plugin 'mileszs/ack.vim'
Plugin 'majutsushi/tagbar'
Plugin 'craigemery/vim-autotag'
Bundle 'dracula/vim'

filetype plugin indent on

"You complete me
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
"autoformat
let g:formatdef_c_style='"astyle --mode=c --suffix=none --style=java --indent=spaces=3"'
let g:formatters_c = ['c_style']
let g:formatdef_cpp_style='"clang-format -style=Chromium"'
let g:formatters_cpp = ['cpp_style']


"fuzzy finding text in buffer
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file,file/new,buffer,file_rec,line', 'matchers', 'matcher_fuzzy')
nnoremap <leader>d :<C-u>Unite -buffer-name=search -start-insert line<cr>

"markdown preview
let vim_markdown_preview_browser='firefox'
let vim_markdown_preview_hotkey='\m'

"clighter
let g:clighter_autostart = 1

"syntastic
let g:syntastic_enable_racket_racket_checker = 1

"airline
set laststatus=2
set history=50

"general stuff
set viewoptions=cursor,folds,slash,unix
let g:skipview_files = ['*\.vim']
set number
set backspace=indent,eol,start
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
set autochdir
set splitbelow
set splitright
set showbreak=->
set clipboard=unnamed
set wildmode=longest,list,full
set wildmenu
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:ctrlp_cmd = 'CtrlPTag'

"remapings
nnoremap <space> :
nnoremap j gj
nnoremap k gk
"buffer navigation
nnoremap <C-b> :BuffergatorOpen<cr>
nnoremap > :bn<cr>
nnoremap < :bp<cr>
nnoremap bd :bd<CR>
nnoremap <C-n> :NERDTreeToggle<cr>
nnoremap <C-c> :qall<CR>
nnoremap <C-x> :x<CR>
nnoremap <S-q> :q!<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>z :w<cr>
"show column
nnoremap <leader>9 :set colorcolumn=85<cr>
nnoremap <leader>0 :set colorcolumn=0<cr><cr>
"make fold
vnoremap <Space> zf
"open fold
nnoremap <CR> za
"lAtEx
nnoremap <leader>v :LLPStartPreview<cr>
nnoremap <leader>f :Autoformat<cr>
nnoremap <silent> ns :setlocal spell!<cr>
nnoremap <silent> <S-s> :w<cr>
nnoremap <silent> ss :Autoformat<cr>:w<cr>
nnoremap <leader>l :b#<cr>
nnoremap <leader>r :source ~/.vimrc<cr>
"nice split movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <leader>w :vsplit<cr>
nnoremap <silent> <leader>e :split<cr>
nnoremap <silent> <leader>z :edit<cr>
"Visualize undo-tree
nnoremap <S-U> :UndotreeToggle<cr>
"refactor
nmap <silent> <Leader>c :call clighter#Rename()<CR>
"tag bar
nmap <silent><leader>y :TagbarToggle<CR>
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent><C-F> :CtrlP<cr>

"Functions
if has("autocmd")
   au BufNewFile,BufReadPre /media/*,/mnt/*,/Volumes/* set directory=~/tmp,/var/tmp,/tmp
   au BufReadPost *.rkt,*.rktl set filetype=racket
   au filetype racket set lisp
   au filetype racket set autoindent
   au filetype tex set tw=90
   au filetype text set tw=90
   au filetype cpp set shiftwidth=2
   au filetype cpp set softtabstop=2
   "augroup pencil
      "autocmd!
      "autocmd FileType markdown,mkd call pencil#init()
      "autocmd FileType text         call pencil#init()
   "augroup END
endif

"colors
let g:molokai_original = 1
let g:rehash256 = 1
set t_Co=256
highlight LineNr ctermfg=grey ctermbg=black
hi Visual term=reverse cterm=reverse guibg=Grey
hi Search term=reverse cterm=reverse guibg=Grey
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
   GuiColorScheme molokai
else
   " For 8-color 16-color terminals or for gvim, just use the
   " regular :colorscheme command.
   colorscheme molokai
endif
