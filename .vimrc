call plug#begin()
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
	Plug 'preservim/nerdtree'
	Plug 'airblade/vim-gitgutter'
	Plug 'hail2u/vim-css3-syntax'
	Plug 'mattn/emmet-vim'
	Plug 'pangloss/vim-javascript'
	Plug 'leafgarland/typescript-vim'
	Plug 'sainnhe/gruvbox-material'
	Plug 'groenewege/vim-less'
	Plug 'vim-airline/vim-airline'
	Plug 'stephpy/vim-yaml'
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'dense-analysis/ale'
  Plug 'neoclide/coc-css'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
call plug#end()

" Set encoding to utf-8
scriptencoding utf-8
set encoding=utf-8

" Normal mouse selection and scroll
set mouse=a

" The maximum width of the <Tab> character
set tabstop=2
" The size of the indent
set shiftwidth=2
" Replace tabs with spaces
set expandtab

" Line numbers to the left
set number

" Enable vim syntax colors
syntax on

" Make backspace work great
set backspace=indent,eol,start

" Vertical line for 120 symbols
set colorcolumn=120
" Setup detection plugin and indent on
filetype plugin indent on
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=1
" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300
" Duration of the timeouts for command-pending commands (such as <leader>...)
set timeoutlen=1000
" Duration of the timeouts for key codes (esc, left, right etc)
set ttimeoutlen=0
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Ruler
set ruler
" Autoread. Load file on it was changed from the global
set autoread
" This option controls the behavior when switching between buffers.
set switchbuf=useopen,usetab
" this has to do something with the buffer
set re=1

map <F2> :NERDTreeToggle<CR>

colors gruvbox-material

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-:CocConfigspace> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Get word group for word under cursor
function! SyntaxItem()
  return synIDattr(synID(line("."), col("."), 1), "name")
endfunction
" Display current syntax group under the cursor
nnoremap <localleader>si :echo SyntaxItem()<CR>

" Emmet enable in html/css/jsx/tsx only
"let g:user_emmet_install_global = 0
"autocmd FileType html,css,jsx,tsx EmmetInstall

" Leader key remap to ,
let g:user_emmet_leader_key=','

let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': "\"",
\  },
\  'typescript.tsx': {
\    'extends': 'tsx'
\  }
\}

" ale
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'typescript': ['eslint'],
\ 'json': []
\ }
let g:ale_fixers = {
\ 'javascript': ['prettier'],
\ 'javascript.jsx': ['prettier'],
\ 'json': ['prettier'],
\ 'typescript': ['prettier'],
\ 'typescript.tsx': ['prettier'],
\ 'typescriptreact': ['prettier'],
\ 'css': ['prettier'],
\ 'less': ['prettier'],
\ 'scss': ['prettier'],
\ 'markdown': ['remove_trailing_lines', 'trim_whitespace']
\ }
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_set_highlights = 0
let g:ale_typescript_tslint_use_global = 0
let g:ale_typescript_eslint_use_global = 0
let g:ale_typescript_eslint_options = '--cache'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '>>'

" Vim-javascript
let g:javascript_enable_domhtmlcss=1

" coc-css
" for SCSS
autocmd FileType css,scss setl iskeyword+=@-@

