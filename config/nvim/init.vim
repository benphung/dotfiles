syntax enable           " enable syntax processing
set tabstop=4           " number of visual spaces per TAB
set softtabstop=2       " number of spaces in tab when editing
set shiftwidth=2
set smartindent
set expandtab           " tabs are spaces
set relativenumber 
set number
set showcmd             " show command in bottom bar
" set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

" Search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set smartcase
set ignorecase

set clipboard=unnamed

set mouse=a

" Movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Escape
inoremap kj <esc>
inoremap jk <esc>

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" Install vim-plug if we don't already have it
if empty(glob("~/.vim/autoload/plug.vim"))
    execute 'mkdir -p ~/.vim/plugged'
    execute 'mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install' }
Plug 'scrooloose/nerdtree' " Navigate files in a sidebar
Plug 'bkad/CamelCaseMotion' " CamelCase motions through words
Plug 'vim-scripts/tComment'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'
Plug 'liuchengxu/vista.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-rails'
Plug 'airblade/vim-gitgutter'
Plug 'mtdl9/vim-log-highlighting'
Plug 'dylanaraps/wal.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'

filetype plugin indent on                   " required!
call plug#end()

" fzf
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

colorscheme wal
set t_Co=256

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'wal'

" HTML
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Turn off swap files
set noswapfile
set nobackup
set nowb

" Write read-only files
cmap w!! w !sudo tee % >/dev/null

" NERDTree
let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1

let mapleader=" "

" File
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fs :w<CR>
" nnoremap <leader>ft :NERDTreeToggle<CR>
nnoremap <silent> <expr> <leader>ft g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" Buffer
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bR :e!<CR>
nnoremap <leader>bY ggVG"+YP
nnoremap <leader>bb :Buffers<CR>

" Search
nnoremap <leader>sf :Rg<CR>
nnoremap <leader>sl :Lines<CR>
nnoremap <leader>sbl :BLines<CR>

let g:mkdp_browser = 'safari'

command! PrettyJson %!python -m json.tool

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" Vista
nnoremap <leader>v :Vista!!<CR>

" coc

let g:coc_global_extensions = [
    \ 'coc-solargraph',
    \ 'coc-json',
    \ 'coc-pairs',
    \ 'coc-html',
    \ 'coc-tsserver',
    \ 'coc-css',
    \ 'coc-prettier',
    \ 'coc-eslint',
    \ 'coc-python'
    \ ]

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

