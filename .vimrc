syntax on
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Vundle plugins
"Plugin 'vim-ruby/vim-ruby'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Raimondi/delimitMate'
Plugin 'airblade/vim-gitgutter'
Plugin 'alvan/vim-closetag'
Plugin 'derekwyatt/vim-scala'
Plugin 'elixir-lang/vim-elixir'
Plugin 'elzr/vim-json'
Plugin 'ervandew/supertab'
Plugin 'gmarik/Vundle.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'mattn/gist-vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mxw/vim-jsx'
Plugin 'nvie/vim-flake8'
Plugin 'othree/yajs.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tmhedberg/SimpylFold'
Plugin 'toyamarinyon/vim-swift'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'vim-scripts/indentpython.vim'

call vundle#end()
filetype plugin indent on

set nobackup
set nowritebackup
set noswapfile
set ruler
let &t_Co=256
colorscheme Tomorrow-Night-Eighties
set nocursorline

"" Rainbow Parentheses
let g:rbpt_colorpairs = [
    \ ['black',       'SeaGreen3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

"Clojure
"
autocmd BufRead,BufNewFile *.clj* RainbowParenthesesActivate
autocmd BufRead,BufNewFile *.clj* RainbowParenthesesLoadRound
autocmd BufRead,BufNewFile *.clj* RainbowParenthesesLoadSquare
autocmd FileType clojure let b:delimitMate_quotes = "\""
nnoremap <C-e> :Eval<CR>

"Turn off default parentheses matching
:let loaded_matchparen = 1

set guifont=Monaco:h12

set tabstop=2
set shiftwidth=2
set expandtab
set nu
set smartindent

map <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store$', '\.vim$', '\.swp$']

command -complete=command -nargs=+ Vertical vertical <args> | vertical resize 116

:nnoremap ; :

"easier mode switching when navigating
imap jj <esc>
imap kk <esc>
imap hh <esc>

"python formatting
" au BufNewFile,BufRead *.py
autocmd BufRead,BufNewFile *.py setl ts=4 sts=4 sw=4
autocmd BufRead,BufNewFile *.py set autoindent
autocmd BufRead,BufNewFile *.py set expandtab

"javascript formatting
autocmd BufRead,BufNewFile *.js setl ts=2 sts=2 sw=2
autocmd BufRead,BufNewFile *.js set autoindent
autocmd BufRead,BufNewFile *.js set expandtab

"    \ set tabstop=4
""   \ set softtabstop=4
""    \ set shiftwidth=4
""    \ set textwidth=99
""    \ set expandtab
""    \ set autoindent
""    \ set fileformat=unix

let python_highlight_all=1

"web programming formatting
autocmd BufRead,BufNewFile *.html,*.css setl ts=2 sts=2 sw=2
au FileType html let b:delimitMate_matchpairs = "(:),[:],{:}"
let g:closetag_filenames = "*.html,*.js,*.jsx"

" Use ag whenever grep is called, because its so fast
set grepprg=ag\ --nogroup\ --nocolor
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

"" Super Awesome Search!
command -nargs=+ -complete=file -bar Get silent! grep! -w <args>|cwindow|redraw!

" Display extra whitespace
set list listchars=tab:»·,trail:·
hi SpecialKey ctermfg=white

" Remove trailing whitespace on save
autocmd BufWritePre *.* :%s/\s\+$//e

" Attempt to convert old ruby hash syntax to new syntax on save
"autocmd BufWritePre *.rb silent! :%s/:\(\w\+\)\(\s*=>\s*\)/\1: /gc

"split settings
set splitright
set splitbelow

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"Nerd Tree
nmap <Leader>nt :NERDTreeToggle<CR>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
