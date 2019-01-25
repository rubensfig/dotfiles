set nocompatible              " be iMproved, required
filetype off                  " required

set guifont=FreeMono\ 12

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
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'Valloric/YouCompleteMe'
Plugin 'chiedo/vim-sort-blocks-by'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-latex/vim-latex'
Plugin 'junegunn/fzf.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/a.vim'
Plugin 'saltstack/salt-vim'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'vim-scripts/TagHighlight'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'airblade/vim-gitgutter'
Plugin 'jremmen/vim-ripgrep'
Plugin 'w0rp/ale'

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
" set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup fedora
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

set number

filetype plugin on

" shortcuts
map <F4> :bd <CR>
map <F5> :ls <CR>
map <F10> :tabn <CR>
map <S-F10> :tabp <CR>

" copy
vmap <C-Space> "ap
nmap <C-Space> "aP
imap <C-Space> <C-o>"ap
nmap <C-c> "ayiw

" paste
vmap <C-p> "+y
nmap <C-p> "+p
imap <C-p> <Esc>"ppa

" source current
map <C-s> :w <CR>
map <C-l> :! ls <CR>

map <C-o> :NERDTreeToggle<CR>
colorscheme desert

" A bindings
map <C-e> :A <CR>
nmap <C-e> :A <CR>
vmap <C-e> :A <CR>

nnoremap K kJ
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

" let g:ycm_global_ycm_extra_conf = '/home/rubinhus/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = ''
let g:mkdp_auto_start = 0
let g:mkdp_auto_open = 0
nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode

autocmd Filetype cpp map <C-x> : make -j4 <CR>

inoremap {<cr> {<cr>}<ESC>kA<CR>
inoremap { {}<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap < <><ESC>i

map <Leader>t :vert :term<CR>
nnoremap <Leader>q" ciw""<Esc>P
nnoremap <Leader>q' ciw''<Esc>P
nnoremap <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P


nnoremap <leader>s :CtrlPTag<cr>
nnoremap <silent> <Leader>b :TagbarToggle<CR>

nnoremap <silent> <Leader>g :! ctags -R .<CR>
"
" Buffers - explore/next/previous: Alt-F11, F11, Shift-F11.
nnoremap <silent> <M-F11> :BufExplorerVerticalSplit<CR>
nnoremap <silent> <F11> :bn<CR>
nnoremap <silent> <S-F11> :bp<CR>

" Folds
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

map <C-f> :Rg 
let b:ale_linters = ['pyflakes', 'flake8', 'pylint', 'clang-tidy']
