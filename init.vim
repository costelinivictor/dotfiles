" ---------------------------------- Plugins -----------------------------------;
call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'junegunn/fzf.vim'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'terryma/vim-multiple-cursors'
    Plug 'ap/vim-css-color'
    Plug 'mralejandro/vim-phpdoc'
    Plug 'sbdchd/neoformat'
    Plug 'sheerun/vim-polyglot'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'stsewd/fzf-checkout.vim'
    Plug 'tpope/vim-surround'
    Plug 'APZelos/blamer.nvim'
    Plug 'navarasu/onedark.nvim'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'dense-analysis/ale'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'Yggdroot/indentLine'
    Plug 'preservim/nerdcommenter'
    Plug 'jiangmiao/auto-pairs'
    Plug 'honza/vim-snippets'
    Plug 'ryanoasis/vim-devicons'
    Plug 'ncm2/ncm2'
    Plug 'alvan/vim-closetag'
    Plug 'tomasiser/vim-code-dark'
    Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
    Plug 'morhetz/gruvbox'
    Plug 'github/copilot.vim'
    Plug 'pantharshit00/vim-prisma'
    Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install --frozen-lockfile --production',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end()

" ---------------------------------- Key maps -----------------------------------
let mapleader="\<space>"
nmap <leader>q :bd<CR>
nnoremap <leader>; A;<esc>
nnoremap <leader>ft :NERDTreeToggle<CR>
nnoremap <leader>ec :vsplit ~/.config/nvim/init.vim<CR>
nnoremap <leader>sc :source ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :FzfPreviewProjectFilesRpc<CR>
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
nmap <leader>ds :Gdiffsplit<CR>
nmap <leader>kb :bd!<CR>
nmap <leader>nb :tabnew<CR>
nmap <leader>nh :noh<CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>rl :set rnu!<CR>
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>
nnoremap <silent><nowait> <space>p :call CocAction('jumpDefinition', v:false)<CR>
imap kj <Esc>

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

" Document this
nmap <Leader>dt :call PhpDocPasteComment()<CR>
" ---------------------------------- Color scheme -----------------------------------

if has('termguicolors')
  set termguicolors
endif

set t_Co=256
let g:onedark_config = {
    \ 'style': 'darker',
\}

colorscheme onedark

" ---------------------------------- Settings -----------------------------------

syntax on
set hidden
set autoindent
set termguicolors
set mouse=a
set inccommand=split
set tabstop=2
set shiftwidth=2
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
let g:airline_theme='onedark'

" ---------------------------------- Blamer -----------------------------------
let g:blamer_enabled = 1
let g:blamer_delay = 1000
let g:blamer_show_in_visual_modes = 0
highlight Blamer guifg=darkgrey

" ---------------------------------- Ale -----------------------------------
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1

let g:ale_fixers = {
\   'ts': ['prettier'],
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'php': ['prettier'],
\   'html': ['prettier']
\}

" ---------------------------------- NerdTree -----------------------------------

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ---------------------------------- Other -----------------------------------

" close-tag configs
let g:closetag_filenames = '*.html,*.ctp,*.js'

" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

"Transparent bg
"hi Normal ctermbg=none guibg=none

" Ruler
set colorcolumn=80

" Call Prettier on save
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
