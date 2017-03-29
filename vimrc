
" Vundle setup {{{1
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Plugin 'godlygeek/tabular'

Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'dermusikman/sonicpi.vim'
Plugin 'ervandew/supertab'

" untried comment plugin
Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" 

" vim setup {{{1

" set folds as marker for vimrc {{{2
"
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

" save foldmethod etc with file
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview

" Disable backup and swap files  {{{2
" 
set nobackup
set nowritebackup
set noswapfile

" Display settings {{{2

set wildmenu
set number
set relativenumber
set wrap
set hlsearch
colorscheme alduin
"colorscheme elflord
"highlight LineNr ctermfg=DarkGrey
"highlight LineNr ctermfg=White
set laststatus=2 "always show statusline
set encoding=utf-8 " show unicode glyphs
set t_Co=265 " Explicitly tell vim that the terminal supports 256 colours
set list
set listchars=tab:▸\ ,eol:¬
syntax on
filetype plugin on

" quickly clear search highlight - hit <esc> after search
nnoremap <esc> :noh<return><esc>
"
" Allows buffers to be hidden if modified
set hidden

" Spelling options {{{2
"
" spellcheck only active for .md / markdown file format
"
set spelllang=en_gb
set spellfile=/home/james/A_Sync/vim/spell/en.utf-8.add
hi clear SpellBad
hi clear SpellCap
hi clear SpellRare
hi clear SpellLocal
hi SpellBad cterm=underline
hi SpellCap cterm=underline
hi SpellRare cterm=underline
hi SpellLocal cterm=underline
autocmd BufRead,BufNewFile *.md set spell
set omnifunc=syntaxcomplete#Complete

" Ngrep {{{2

" search through reference directory
"command! -nargs=1 Ngrep vimgrep "<args>" ~/A_Sync/1_OU/Reference/**/*.md
command! -nargs=1 Ngrep vimgrep "<args>" ~/A_Sync/1_OU/**/*.md
"command! -nargs=1 Ngrep vimgrep "<args>" $REF/**/*.md

" Leader remaps {{{1

let mapleader = ","

" Copy & paste commands {{{2
"
" Yank entire buffer to system clipboard: ,ya
nnoremap <leader>ya gg"+yG

" Yank entire buffer to vim clipboard: ,Y
nnoremap <leader>Y ggyG

" Copy to system clipboard using ctrl+a in Visual mode:
vnoremap <C-c> "+y

" Launch Ngrep {{{2
"
nnoremap <leader>] :Ngrep \<

" fast open / reload vimrc {{{2
"
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>eb :edit /home/james/.bashrc<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>

" Enter insert inside quotes/brackets {{{2
nnoremap <leader>' i''<Esc>i
nnoremap <leader>" i""<Esc>i
nnoremap <leader>{ i{}<Esc>i
nnoremap <leader>( i()<Esc>i
nnoremap <leader>[ i[]<Esc>i

" Insert markdown syntax etc. {{{2

" Insert four spaces
nnoremap <leader><space> i<space><space><space><space>

" Encase current line in block code (```)
nnoremap <leader>` <Esc>O<Esc>3i`<esc>jo<Esc>3i`<esc>k0i

" Make heading 1
nnoremap <leader># 0i#<space>

" Make folding heading 2 / level 1 fold: ,#1
nnoremap <leader>#1 0i##<space><esc>$a<space><!--{{{1--><esc>0

" Make folding heading 3 / level 2 fold: ,#2
nnoremap <leader>#2 0i###<space><esc>$a<space><!--{{{2--><esc>0

" Make folding heading 4 / level 3 fold: ,#3
nnoremap <leader>#3 0i####<space><esc>$a<space><!--{{{3--><esc>0

" read default markdown snippet into buffer
nnoremap <leader>md :r ! cat $REF/default.md<cr>ggdd:w<cr>:e<cr>zRggf<space>a
"nnoremap <leader>md:r! cat$REF/default.md<cr>ggdd:w<cr>:e<cr>zRgg:r! echo %:r<cr>

" tab navigation {{{2
"
nnoremap <leader>ta :tabfirst<CR>
nnoremap <leader>tf :tablast<CR>
nnoremap <leader>td :tabnext<CR>
nnoremap <leader>ts :tabprev<CR>
nnoremap <leader>tn :tabnew<space>

" line below / above {{{2
"
nnoremap <leader>o o<Esc>k
nnoremap <leader>oo O<Esc>j

nnoremap <leader>er <Esc>O<Esc>jo<Esc>k
nnoremap <leader>re kddjddk<Esc>

" Mappings to access buffers {{{2
"
" (don't use "\p" because a
" " delay before pressing "p" would accidentally paste).
" " \l       : list buffers
" " \s \d \g : go back/forward/last-used
" " \1 \2 \3 : go to buffer 1/2/3 etc
"
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>s :bp<CR>
nnoremap <Leader>d :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>a :1b<CR>
nnoremap <Leader>f :1b<CR>:bp<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
nnoremap <leader>bq :bp <BAR> bd #<CR>
nnoremap <leader>bn :enew<CR>
" It's useful to show the buffer number in the status line.
" set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" set tab spaces etc {{{1
set tabstop=4
set shiftwidth=4
set linebreak
set breakindent
set expandtab
" 

" Window navigation {{{1
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" 

" load up the nerd tree {{{1
autocmd vimenter * NERDTree
map <Leader>nt <plug>NERDTreeTabsToggle<CR>

" move nerdtree to the right
let g:NERDTreeWinPos = "right"
" " move to the first buffer
autocmd VimEnter * wincmd p
" 

" set syntax for markdown {{{1
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
" 

" set foldmethod as syntax for named filetypes {{{1
autocmd BufNewFile,BufFilePre,BufRead *.java,*.rb,*.py,*.sh,*.html,*.css set foldmethod=syntax
" 
" quick fix items (next/prev): ,n ,p
nnoremap <leader>p :cprevious<Return>
nnoremap <leader>n :cnext<Return>

" Airline and plugin configuration: {{{1
" 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_theme='laederon'
" let g:airline_theme='alduin'
"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1 
"
" Java compiling {{{1
"
autocmd Filetype java set makeprg=javac\ %
"nnoremap <leader>jc :set makeprg=javac\ %<CR>:make<CR>:copen<CR>
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
" nnoremap <leader>jc :make<Return>:copen<Return>
nnoremap <leader>jc :make<Return>:cw<Return>
" run only works if no packages are used?
nnoremap <leader>jr :!java -cp %:p:h %:t:r
" }}}
