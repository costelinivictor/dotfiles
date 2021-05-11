" ---------------------------------- Plugins -----------------------------------
call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'terryma/vim-multiple-cursors'
    Plug 'ap/vim-css-color'
    Plug 'tomasiser/vim-code-dark'
    Plug 'mralejandro/vim-phpdoc'
    Plug 'sainnhe/sonokai'
    Plug 'sbdchd/neoformat'
    Plug 'sheerun/vim-polyglot'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'stsewd/fzf-checkout.vim'
    Plug 'tpope/vim-surround'
    Plug 'APZelos/blamer.nvim'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'dense-analysis/ale'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'Yggdroot/indentLine'
    Plug 'preservim/nerdcommenter'
    Plug 'jiangmiao/auto-pairs'
    Plug 'honza/vim-snippets'
    Plug 'ncm2/ncm2'
    Plug 'alvan/vim-closetag'
call plug#end()

" ---------------------------------- Key maps -----------------------------------
let mapleader="\<space>"
nnoremap <leader>; A;<esc>
nnoremap <leader>ft :NERDTreeToggle<CR>
nnoremap <leader>ec :vsplit ~/.config/nvim/init.vim<CR>
nnoremap <leader>sc :source ~/.config/nvim/init.vim<CR>
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
nnoremap <C-f> :Ag<space>
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <leader>h <C-W>h
nnoremap <leader><S-Tab> :bprev<CR>
nnoremap <leader><Tab> :bnext<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nmap <leader>gs :G<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>kb :bd!<CR>
nmap <leader>nb :tabnew<CR>
nmap <leader>nh :noh<CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>rl :set rnu!<CR>

"Use tab to cycle through suggestions
verbose imap <tab>
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Resize buffer
nnoremap <C-h> :vertical resize -5<cr>
nnoremap <C-j> :resize +5<cr>
nnoremap <C-k> :resize -5<cr>
nnoremap <C-l> :vertical resize +5<cr>

" Document this
nmap <Leader>dt :call PhpDocPasteComment()<CR>

" ---------------------------------- Color scheme -----------------------------------

if has('termguicolors')
  set termguicolors
endif

set t_Co=256
colorscheme codedark 

" ---------------------------------- Settings -----------------------------------

syntax on
set hidden
set autoindent
set termguicolors
set mouse=a
set inccommand=split
set tabstop=4
set shiftwidth=4
set expandtab
set noswapfile
set nowrap
set number
set relativenumber
set laststatus=2
set cursorline
set encoding=UTF-8
set clipboard=unnamedplus

" ---------------------------------- Airline -----------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='codedark'

" ---------------------------------- Blamer -----------------------------------
let g:blamer_enabled = 1
let g:blamer_delay = 1000
let g:blamer_show_in_visual_modes = 0
highlight Blamer guifg=darkgrey

" ---------------------------------- Ale -----------------------------------
"let g:ale_fix_on_save = 1
"let g:ale_linters_explicit = 1

"let g:ale_fixers = {
"\   'javascript': ['prettier'],
"\   'css': ['prettier'],
"\   'php': ['prettier'],
"\   'html': ['prettier']
"\}

" ---------------------------------- Other -----------------------------------

" Close nerdtree if it's the only window:
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" close-tag configs
let g:closetag_filenames = '*.html,*.ctp,*.js'

" Highlight trailing spaces
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
