"--------------------------------------
" file:     ~/.vimrc
" author:   cody diehl
" vim:fenc=utf-8:ft=vim:
"--------------------------------------

" vim instead of vi
set nocompatible

syntax on

" environment
set t_Co=256        " lovely colors
set ttyfast         " prevent lag
set lazyredraw      " prevent unnecessary rendering
set showcmd         " show partial cmd in status
set laststatus=2    " persistant statusbar
set cmdheight=2     " 2 lines for cmd height
set encoding=utf-8  " UTF-8 by default
set termencoding=utf-8 " UTF-8 term encoding
set ffs=unix,dos,mac " unix as standard file type
set hidden          " buffer not closed when abandoned
set history=1000    " set history to 1000 line 2 lines for cmd height
"set gfn=Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11  " set font change
set autoread        " auto read outside file changes
let $LANG='en'      " english
set langmenu=en     " english menu
set spelllang=en_us " english spelling
set dictionary+=/usr/share/dict/words " use standard dict
set spellfile=$HOME/vim/spell/en.utf-8.add
set noerrorbells    " no error ding
set novisualbell    " no blinking indicator
set t_vb=           " visual bell stop
set timeoutlen=200  " delay timeout
set winminheight=0  " window can be 0 lines high
let g:is_posix=1    " POSIX shell scripts
let g:is_bash=1     " bash syntax hilighting
let g:vimsyn_noerror=1 " hack for correct syntax hilighting

" editor
set cursorline      " track position
set showmatch       " show matching brackets
set mat=2           " tenths of sec to blink matches
set clipboard+=unnamed " yank to Xclip
set backspace=indent,eol,start " normal backspace
set virtualedit=onemore " allow cursor to move beyond last char
set number          " show line numbers
set ruler           " always show current position
set ww=b,s,h,l,<,>,[,]  " whichwrap?
set linebreak       " better wrap
set wrap            " wrap lines
set textwidth=500    " lines should not be longer than 500 chars
"set formatoptions+=t " smarter breaks at end of line (hard wrap)
set wildmenu        " enhanced tab-comp
set wildmode=list:longest,full " full compl
let &t_EI .= "\<Esc>[2 q" " cursor shape solid bar
set scrolloff=5     " keep 5 lines below cursor on scroll
set autochdir       " automatically open files directory


" tabs and indentation
set tabstop=2       " tabs appear as n number of columns
set softtabstop=2   " let backspace delete indents
set shiftwidth=2    " n cols for auto indent
set expandtab       " spaces instead of tabs
set autoindent      " auto indent on new lines
set smarttab        " smart tabs... idk?

" search
set hlsearch        " highlight search results
set incsearch       " incremental search
set ignorecase      " case-insensitive search
set smartcase       " search only for uppercase when entered

" listchars
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\
"set list lcs=trail:·,tab:»·

set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)  " a ruler on steroids"

" auto format comment blocks
"set comments=sl:/\*,mb:\*,elx:\*/

" colorscheme settings
colorscheme pencil
set background=dark
hi cursorline ctermbg=237             " hilight bg color
"hi CursorColumn ctermbg=236          " highlight cursor
hi Search ctermbg=LightGreen          " highlight search
hi Comment ctermfg=245 ctermbg=NONE   " comment color
hi Identifier ctermbg=NONE            " identifier color
"hi Normal ctermbg=NONE                " fix colorscehmes in my term
"hi nonText ctermbg=NONE               " again fix bg
"hi ErrorMsg ctermbg=White ctermfg=Red " error color
hi Conceal ctermbg=NONE               " no dot background colors

" enable mouse if available
if has ('mouse')
  set mouse=a
endif

" map leader for extra key combos
" acts as colon so ,w = :w
let mapleader = ","
let g:mapleader = ","

" fast save
nmap <leader>w :w!<cr>

" switch CWD to dir of open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" nifty copy and paste to/from xsel clipboard
vnoremap <silent> <leader>y :w !xsel -i -b<CR>
nnoremap <silent> <leader>y V:w !xsel -i -b<CR>
nnoremap <silent> <leader>p :silent :r !xsel -o -b<CR>

" convienent tab mappings
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" press ,ss to toggle spell check
map <leader>ss :setlocal spell!<cr>

" map autocomplete to ^space
inoremap <Nul> <C-x><C-o>

" space bar un-highlights search
:noremap <silent> <Space> :silent noh<Bar>echo<CR>

" write with root priveledge to handle perm-denied
command W w !sudo tee % > /dev/null

" sane indentation on pastes
set pastetoggle=<F2>

" source vimrc while in vim
map <leader>r :so $MYVIMRC<cr>
" autosource vimrc on save
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

" source rmbackground.vim
map <leader>b :so ~/.vim/autoload/rmbackground.vim<CR>

" keep cursor centered
:nnoremap j jzz
:nnoremap k kzz

" treat wrapped/long lines as line breaks when moving
map j gj
map k gk

map K <C-u>   " ^K scroll up
map J <C-d>   " ^J scroll down
map L W       " ^L back by word
map H B       " ^H forward by word

imap jk <ESC><ESC>  " use jk to exit insert 
imap kj <ESC><ESC>  " same as above for kj
imap jj <ESC><ESC>  " even faster

nnoremap <leader><space> a
imap <leader><space> <Esc>

nnoremap < << " a little faster block unindent
nnoremap > >> " a little faster block indent

" like C & D make Y yank to end of line
nnoremap Y y$

" fix honest/lazy mistakes
nnoremap ; :
cmap WQ wq
cmap wQ wq
cmap Q q

" parenthesis/brackets
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

" split to lines when between delimiters
" useful with delimitmate plugin
imap <C-c> <CR><ESC>0

" return to last edit position when open file {
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Remember info about open buffers on close
set viminfo^=%
" }

" sublime text style space dots {
hi conceal ctermfg=250 ctermbg=NONE
setl conceallevel=2 concealcursor=nc
autocmd InsertEnter,InsertLeave,BufReadPost * :syn match WhiteSpace / / containedin=ALL conceal cchar=·
" }

" alternative backup attempt {
set backup
set backupdir=~/.vim/vimbackup,/tmp
set directory=~/.vim/tmp
" }

" persistent undo history attempt {
set undofile " save undo's even after file close
set undodir=~/.vim/vimundo,/tmp " where to save undo hist
set undolevels=1000 " how many undo's to save
set undoreload=1000 " number of lines to save for undo
" }

" cursorline {
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
" }

" stop auto comment insertion {
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set formatoptions-=cro
" }

" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" vundle user config
Plugin 'kien/tabman.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'godlygeek/csapprox'
Plugin 'morhetz/gruvbox'
Plugin 'sickill/vim-monokai'
Plugin 'tomasr/molokai'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'kien/ctrlp.vim'
Plugin 'zeis/vim-kolor'
Plugin 'vim-scripts/peaksea'
Plugin 'sjl/badwolf'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'shinchu/lightline-gruvbox.vim'
Plugin 'Keithbsmiley/tmux.vim'
Plugin 'tarruda/YouCompleteMe'

" Plugin 'millermedeiros/vim-statline'

" end of plugins end vundle
call vundle#end()

" file type detection and language dependent indent
" at bottom reqested by vundle... grr
if has("autocmd")
  filetype plugin on
  filetype indent on
endif

" ------- plugin related ---------
" nerdtree
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 15
let NERDTreeWinPos = "right"
let NERDTreeMouseMode = 2
let NERDTreeStatusLine = '-1'
let NERDChristmasTree = 1
let NERDTreeMinimalUI = 0
let NERDTreeIgnore=['\.png$', '\.jpg$', '\.gif$', '\.tmp$', '\.swp$']

" gundo
nnoremap <leader>g :GundoToggle<CR>
let g:gundo_width = 35

" statline
hi StatusLine ctermfg=15 ctermbg=245
"hi StatusLineNC guifg=#808080 guibg=#000000 ctermfg=8 ctermbg=0

" minibufexpl settings
map <Leader>e :MBEOpen<CR>
map <Leader>c :MBEClose<CR>
map <Leader>t :MBEToggle<CR>
map <Leader>f :MBEFocus<CR>
" automatically open MBE
let g:miniBufExplorerAutoStart = 1
let g:miniBufExplBuffersNeeded = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplShowBufNumbers = 0
hi MBENormal ctermfg=243
hi MBEChanged ctermfg=211
hi MBEVisibleNormal ctermfg=31
hi MBEVisibleActiveNormal ctermfg=61
hi MBEVisibleActiveChanged ctermfg=97

" lightline
let g:lightline = {}
let g:lightline_theme = "pencil"
