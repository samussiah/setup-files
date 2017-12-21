" don't bother with vi compatibility
  set nocompatible

" enable syntax highlighting
  syntax enable

" plugin management
  execute pathogen#infect()
  syntax on
  filetype plugin indent on

" NERDTree
  autocmd vimenter * NERDTree

  " open NERDTree automatically when vim starts up if no files were specified
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

  " open NERDTree automatically when vim starts up on opening a directory
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

  " close NERDTree when closing file
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " show hidden files
    let NERDTreeShowHidden=1

" editor theme
  set background=dark
  colorscheme solarized
  set guifont=Lucida_Console:h14

" key mappings

  " set <leader> key
    let mapleader=','
      " save
        nmap <leader>w :w<CR>
      " quit
        nmap <leader>q :q<CR>
      " turn off highlighting
        nmap <silent> <leader>n :noh<CR>
      " view open buffers
        nmap <silent> <leader>b :buffers<CR>
      " toggle NERDTree
        nmap <silent> <leader>d :NERDTreeToggle<CR>
      " open _vimrc
        nmap <silent> <leader>ev :e $MYVIMRC<CR>
      " source _vimrc
        nmap <silent> <leader>sv :so $MYVIMRC<CR>
      " change directory to current file
        nmap <silent> <leader>cd :cd %:p:h<CR>

  " exit insert mode
    inoremap jj <esc>

" miscellaneous options
  set autoindent " always set autoindenting on
  set autoread " reload file on change
  set backspace=indent,eol,start " allow backspacing over everything in insert mode
  set clipboard=unnamed " copy/paste to system clipboard
  set copyindent " copy the previous indentation on autoindenting
  set expandtab					 " replace tabs with spaces
  set hidden " hide buffers rather than close them
  set history=1000 " remember more commands and search history
  set hlsearch " highlight search terms
  set ignorecase " ignore case when searching
  set incsearch " show search matches as you type
  set laststatus=2 " always display status line
  set nobackup " no backup file
  set noerrorbells " don't beep
  set noswapfile " no swap file
  set nowrap " don't wrap li                                    nes
  set number " always show line numbers
  set pastetoggle=<F2>
  set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
  set shiftwidth=4 " number of spaces to use for autoindenting
  set showmatch " set show matching parenthesis
  set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise
  set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop
  set tabstop=4 " a tab is four spaces
  set title " change the terminal's title
  set undolevels=1000 " use many muchos levels of undo
  set visualbell " don't beep
