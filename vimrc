" FSCVIM basic set -------------------
set nocompatible " incompatible vi
" set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf-8
" set termencoding=cp936
language messages en_US.UTF-8
" set ruler " Show the ruler Ps. if airline disable, enable this
" set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd " Show partial commands in status line and
set number " Line number on
" set relativenumber " Line relative number
autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
set backspace=indent,eol,start " Backspace for dummies
set cursorline " Highlight current line
set mouse=a " Automatically detect file types
set mousehide " Hide the mouse cursor while typing
set expandtab " Tabs are spaces, not tabs
set tabstop=4 " An indentation every four columns
set softtabstop=4 " Let backspace delete indent
set scrolloff=5 " Minimum lines to keep above and below cursor
" set scrolljump=5 " Lines to scroll when cursor leaves screen
set autoindent " Indent at the same level of the previous line
set smartindent " Indent smart
set showmatch " Show matching brackets/parenthesis
set incsearch "incremental search, search as you type
set hlsearch " Highlight search terms
set ignorecase " Case insensitive search
set smartcase " Case sensitive when uc present
set nowrap " Do not wrap long lines

" With a map leader it's possible to do extra key combinations
let mapleader = " "
let g:mapleader = " "

"strip all trailing whitespace in the current file
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>

" GVIM font----------------------------
if has("gui_running")
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
        set guioptions-=T " hide tool bar
        set guioptions-=m " hide menu bar
        set guioptions-=r " hide right scroll bar
        set guioptions-=l " hide left scroll bar
        set guioptions-=R " hide right scroll bar when window is split vertically
        set guioptions-=L " hide left scroll bar when window is split vertically
endif

syntax enable " syntax highlighting on

" VIM colorschemes----------------------------
" set background=light
set background=dark

" Colorscheme
if $COLORTERM == 'truecolor'
        set termguicolors
        colorscheme s
        hi CursorLine cterm=NONE
else
        set term=xterm
        set t_Co=256
        colorscheme solarized
endif

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
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" Plug 'tpope/vim-git'

" Signify ------------------------------
Plug 'mhinz/vim-signify'
" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)

Plug 'easymotion/vim-easymotion'

" ale   ------------------------------
Plug 'w0rp/ale'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/Auto-Pairs'

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

"function! BuildYCM(info)
"		if a:info.status == 'installed' || a:info.force
"				!./install.py --clang-completer --gocode-completer
"		endif
"endfunction
"Plug 'Valloric/YouCompleteMe', { 'for': ['c', 'cpp'], 'do': function('BuildYCM') }

Plug 'scrooloose/nerdcommenter'
" <leader>cc // 注释
" <leader>cm 只用一组符号注释
" <leader>cA 在行尾添加注释
" <leader>c$ /* 注释 */
" <leader>cs /* 块注释 */
" <leader>cy 注释并复制
" <leader>c<space> 注释/取消注释
" <leader>ca 切换　// 和 /* */
" <leader>cu 取消注释
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = {
                        \ 'javascript': { 'left': '//', 'leftAlt': '/**', 'rightAlt': '*/' },
                        \ 'less': { 'left': '/**', 'right': '*/' }
                        \ }

" Jedi-vim Completion with tab ----------------------------
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"

Plug 'davidhalter/jedi-vim'
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

call plug#end()
