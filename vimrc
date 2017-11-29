set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf-8
" set termencoding=cp936
language messages en_US.UTF-8
set nocompatible " incompatible vi
set term=xterm " Tmux color
set t_Co=256
" set ruler " Show the ruler Ps. if airline disable, enable this
" set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd " Show partial commands in status line and
set number " Line number on
set relativenumber " Line relative number
set backspace=indent,eol,start " Backspace for dummies
set cursorline " Highlight current line
set mouse=a " Automatically detect file types
set mousehide " Hide the mouse cursor while typing
set expandtab " Tabs are spaces, not tabs
set tabstop=4 " An indentation every four columns
set softtabstop=4 " Let backspace delete indent
set scrolloff=4 " Minimum lines to keep above and below cursor
set scrolljump=5 " Lines to scroll when cursor leaves screen
set autoindent " Indent at the same level of the previous line
set smartindent " Indent smart
set showmatch " Show matching brackets/parenthesis
set incsearch "incremental search, search as you type
set hlsearch " Highlight search terms
set ignorecase " Case insensitive search
set smartcase " Case sensitive when uc present
set nowrap " Do not wrap long lines

syntax enable " syntax highlighting on

highlight clear SignColumn " SignColumn should match background
highlight clear LineNr " Current line number row will have same background color in relative mode
" highlight clear CursorLineNr " Remove highlight color from current line number

" With a map leader it's possible to do extra key combinations
let mapleader = " "
let g:mapleader = " "

"strip all trailing whitespace in the current file
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>

" GVIM font----------------------------
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
set guioptions-=T " hide tool bar
set guioptions-=m " hide menu bar
set guioptions-=r " hide right scroll bar
set guioptions-=l " hide left scroll bar
set guioptions-=R " hide right scroll bar when window is split vertically
set guioptions-=L " hide left scroll bar when window is split vertically

" VIM colorschemes----------------------------
" set background=light
set background=dark
colorscheme solarized
" colorscheme luna

" PLUGIN CONFIG =============================
" !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if empty(glob('~/.vim/plugged'))
		autocmd VimEnter * PlugUpdate
endif

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align

" Airline--------------------------------
" linebar theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='solarized'
" let g:airline_theme='luna'
let g:airline_powerline_fonts=1

Plug 'tpope/vim-git'

" Signify ------------------------------
Plug 'mhinz/vim-signify'
" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete cterm=bold ctermbg=none ctermfg=167
highlight DiffChange cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd cterm=bold ctermbg=237 ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237 ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237 ctermfg=227

Plug 'easymotion/vim-easymotion'

" ale   ------------------------------
Plug 'w0rp/ale'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" Tagbar -----------------------------
Plug 'majutsushi/tagbar'
" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" CtrlP config ---------------------------
Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
						\ 'dir':  '\v[\/]\.(git|hg|svn)$',
						\ 'file': '\v\.(exe|so|dll)$',
						\ 'link': 'some_bad_symbolic_links',
						\ }
" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading

" NERDTree -----------------------------
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }


" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system

"function! BuildYCM(info)
"		if a:info.status == 'installed' || a:info.force
"				!./install.py --clang-completer --gocode-completer
"		endif
"endfunction
"Plug 'Valloric/YouCompleteMe', { 'for': ['c', 'cpp'], 'do': function('BuildYCM') }

call plug#end()
