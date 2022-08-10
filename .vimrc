"" Plugins
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'guns/xterm-color-table.vim'
Plug 'felixhummel/setcolors.vim'
Plug 'hzchirs/vim-material'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'scrooloose/nerdcommenter'
Plug 'fholgado/minibufexpl.vim'
Plug 'bogado/file-line'
call plug#end()


set background=dark
colorscheme atom

"" General
set showmode            " Hide vim mode text
set number		" Show line numbers
set linebreak		" Break lines at word (requires Wrap lines)
set showbreak=+++ 	" Wrap-broken line prefix
set nowrap              " don't wrap lines that are longer than the terminal width
"set showmatch		" Highlight matching brace
set mouse=a             " Enable mouse for all modes
set ttyfast             " smoother changes 

set hlsearch		" Highlight all search results
set smartcase		" Enable smart-case search
set gdefault		" Always substitute all matches in a line
set ignorecase		" Always case-insensitive
set incsearch		" Searches for strings incrementally
 
set autoindent		" Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set smartindent		" Enable smart-indent
set smarttab		" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab

syntax on 
filetype on
filetype plugin on


"" Advanced
set t_Co=256		" Set Xterm 256 colors
set laststatus=2        " Required for lightline plugin
"set clipboard=unnamedplus " Use system clipboard instead of local one
set ruler		" Show row and column ruler information
set undolevels=1000	" Number of undo levels
set backspace=start,eol,indent	" Backspace behaviour

" Save system clipboard on exit
autocmd VimLeave * call system('echo ' . shellescape(getreg('+')) . 
            \ ' | xclip -selection clipboard')
"" Controls

" Remove search highlight with double escape
"map <silent> <esc><esc> :nohlsearch<CR>
" Center on what we are looking for
nnoremap n nzz
nnoremap N Nzz
nnoremap g# g#zz
" Bind Leader+y to copy into clipboard, same for d
noremap <Leader>y "+y
noremap <Leader>d "+d

"" Colors
highlight LineNr ctermfg=242
highlight NonText ctermfg=19
"" Airline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }


highlight EndOfBuffer ctermfg=black
