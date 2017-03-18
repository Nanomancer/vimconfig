
" Vundle setup {{{
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

" untried comment plugin
" Plugin 'scrooloose/nerdcommenter'

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
" }}}

" vim setup {{{

" set folds as marker for vimrc
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

" save foldmethod etc with file
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview

" Disable stupid backup and swap files
set nobackup
set nowritebackup
set noswapfile

set wildmenu
set number
set relativenumber
set wrap
set hlsearch
highlight LineNr ctermfg=DarkGrey
set laststatus=2 "always show statusline
set encoding=utf-8 " show unicode glyphs
set t_Co=265 " Explicitly tell vim that the terminal supports 256 colours
set list
set listchars=tab:▸\ ,eol:¬
syntax on
filetype plugin on

" quickly clear search highlight - hit <esc> after search
nnoremap <esc> :noh<return><esc>
" Spelling options - spellcheck only active for .md / markdown file format
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

" }}}

" Leader remaps {{{
let mapleader = ","

"create/remove extra lines above & below
nnoremap <leader>er <Esc>O<Esc>jo<Esc>k
nnoremap <leader>re kddjddk<Esc>

" fast open / reload vimrc
nnoremap <leader>ev :tabnew $MYVIMRC<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>

" enter insert inside quotes/brackets
nnoremap <leader>' i''<Esc>i
nnoremap <leader>" i""<Esc>i
nnoremap <leader>{ i{}<Esc>i
nnoremap <leader>( i()<Esc>i
nnoremap <leader>[ i[]<Esc>i

" Insert date
nnoremap <leader>c :read ! date
" tab navigation
nnoremap <leader>a :tabfirst<CR>
nnoremap <leader>f :tablast<CR>
nnoremap <leader>d :tabnext<CR>
nnoremap <leader>s :tabprev<CR>
nnoremap <leader>n :tabnew<space>

" line below / above
nnoremap <leader>o o<Esc>k
nnoremap <leader>oo O<Esc>j

" insert four spaces
nnoremap <leader><space> i<space><space><space><space>
" }}}

" Remap arrow keys to nothing {{{
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

vno <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
" }}}

" set tab spaces etc {{{
set tabstop=4
set shiftwidth=4
set linebreak
set breakindent
" set expandtab
" }}}

" Window navigation {{{
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" }}}

" load up the nerd tree {{{
autocmd vimenter * NERDTree
map <Leader>t <plug>NERDTreeTabsToggle<CR>

" move nerdtree to the right
let g:NERDTreeWinPos = "right"
" " move to the first buffer
autocmd VimEnter * wincmd p
" }}}

" set syntax for markdown {{{
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
" }}}

" Plugin configuration: {{{
" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='laederon'
" }}}
