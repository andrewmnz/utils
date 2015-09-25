"------------------------------------------------------------------------------
" Standard stuff.
"------------------------------------------------------------------------------

set nocompatible        " Disable vi compatibility.
filetype off		" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'

" Plugin 'scrooloose/syntastic'
" Plugin 'plasticboy/vim-markdown'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'sjl/gundo.vim'
" Plugin 'tmhedberg/matchit'
Plugin 'scrooloose/nerdtree'
" Plugin 'Command-T'
Plugin 'delimitMate.vim'
" Plugin 'pyflakes'
Plugin 'SuperTab'
Plugin 'docunext/closetag.vim'
" Plugin 'tpope/vim-surround'
" Plugin 'Lokaltog/powerline'

" All of your Plugins must be added before the following line
call vundle#end()	" required
filetype plugin indent on " required

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" make vertical movement within wrapped lines easier
noremap j gj
noremap k gk

" Map shift-k to k
nmap K k
vmap K k

" searching and patterns (search with /<pattern>)
set ignorecase " search is case insensitive
set smartcase  " search case sensitive if caps on
set incsearch  " show best match so far
set hlsearch   " highlight matches to the search

" display
set lazyredraw     " do not repaint when scripts are running
set scrolloff=3    " keep 3 lines below and above the cursor when scrolling
set ruler          " show line numbers and column the cursor is on in status bar
set number         " show line numbering
set foldlevelstart=99

" coding
set history=1000           " 1000 Lines of history
filetype indent on         " enable filetype indent
filetype plugin on         " enable filetype plugins
filetype plugin indent on  " let filetype plugins indent for me
syntax enable              " turn on syntax highlighting

" don't tab complete these types of files
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.pyo,*.swp

" Set default options
set expandtab  " expand tab characters to spaces
set autoindent " use auto-indentation
set smarttab   " indent based on context
set nowrap     " default to no text wrap
set linebreak  " make text-wrapping nicer
set enc=utf-8  " set default encoding to utf-8
set undolevels=200      " Number of undo levels.
set textwidth=0         " Don't wrap words by default.
set nowrapscan		" Turn off wrapping for string searches
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set esckeys             " Cursor keys in insert mode.
" set softtabstop=4           " Number of spaces <tab> counts for.
set viminfo='20,\"50    " Read/write a .viminfo file, don't store more than
                        " 50 lines of registers.

" Smart indenting
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Stop smartindent from unindenting python comments
autocmd BufRead *.py inoremap # X<c-h>#<space>

" Set backup files to a single directory
set backupdir=~/.vim//,.
set directory=~/.vim//,.


" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start
set backspace=2        " backspace over anything

" Tell vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
set listchars=tab:>-,trail:·,eol:$

" Path/file expansion in colon-mode.
set wildmode=list:longest
set wildchar=<TAB>


" Enable syntax-highlighting.
if has("syntax")
  syntax on
endif

" Use brighter colors if your xterm has a dark background.
if &term =~ "xterm"
  set background=dark
  colorscheme solarized
endif

"------------------------------------------------------------------------------
" File-type specific settings.
"------------------------------------------------------------------------------

if has("autocmd")

  " Enabled file type detection and file-type specific plugins.
  " filetype plugin on indent
  filetype plugin on

  " Drupal *.module and *.engine files.
  augroup module
    autocmd BufRead                     *.module,*.engine set filetype=php
  augroup END

  " Python code.
  augroup python
    autocmd BufReadPre,FileReadPre      *.py set tabstop=4
    autocmd BufReadPre,FileReadPre      *.py set expandtab
    autocmd BufReadPre,FileReadPre      *.py set shiftwidth=4
  augroup END

  " HTML files.
  augroup html
    autocmd BufReadPre,FileReadPre      *.html,*.htm,*.HTML,*.HTM set tabstop=2
    autocmd BufReadPre,FileReadPre      *.html,*.htm,*.HTML,*.HTM set expandtab
    autocmd BufReadPre,FileReadPre      *.html,*.htm,*.HTML,*.HTM set shiftwidth=2
    autocmd BufReadPre,FileReadPre      *.html,*.htm,*.HTML,*.HTM set softtabstop=2
    autocmd BufReadPre,FileReadPre      *.html,*.htm,*.HTML,*.HTM set wrap 
    autocmd BufReadPre,FileReadPre      *.html,*.htm,*.HTML,*.HTM set dictionary+=/home/ubuntu/.vim/dict/django-templates.txt
  augroup END

  " Ruby code.
  augroup ruby
    autocmd BufReadPre,FileReadPre      *.rb set tabstop=2
    autocmd BufReadPre,FileReadPre      *.rb set expandtab
  augroup END

  " PHP code.
  augroup php
    autocmd BufReadPre,FileReadPre      *.php set tabstop=4
    autocmd BufReadPre,FileReadPre      *.php set expandtab
  augroup END

  " Java code.
  augroup java
    autocmd BufReadPre,FileReadPre      *.java set tabstop=4
    autocmd BufReadPre,FileReadPre      *.java set expandtab
  augroup END

  " ANT build.xml files.
  augroup xml
    autocmd BufReadPre,FileReadPre      build.xml set tabstop=4
  augroup END

  " (J)Flex files.
  augroup lex
    " autocmd BufRead,BufNewFile          *.flex,*.jflex set filetype=lex
    autocmd BufRead,BufNewFile          *.flex,*.jflex set filetype=jflex
  augroup END 

  " (Nu)SMV files.
  augroup smv
    autocmd BufRead,BufNewFile          *.smv set filetype=smv 
  augroup END
endif

"------------------------------------------------------------------------------
" Abbreviations.
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" Key Mappings.
"------------------------------------------------------------------------------
nmap ,nt :NERDTreeToggle<CR>
nnoremap ,lcd :lcd %:p:h<CR>:pwd<CR>
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" On save, set file format to unix always
autocmd BufWrite * set fileformat=unix

" Set tabstop for 4
map ,s :set tabstop=4\|set softtabstop=4\|set shiftwidth=4<cr>

" Set tabstop for 2
map ,a :set tabstop=2\|set softtabstop=2\|set shiftwidth=2<cr>

" Convert html tags to lowercase
nmap ,z :%s/<\/\?\zs\(\a\+\)\ze[ >]/\L\1/g<cr>

" Remove trailing whitespace from file
nmap <silent> ,f :%s/\s\+$//ge<cr>

" Toggle paste mode
nmap ,p :set invpaste paste?<cr>

" Open a new tabe in the explorer window
nmap ,t :tabe\|:Ex<cr>

" Delete DOS carriage returns
nmap <silent> ,m :%s/\r//g<cr>

" Toggle line-wrapping
nmap ,w :set wrap!<cr>

" Toggle line numbers
nmap ,n :set number!<cr>

" Change the working directory to the current file always
autocmd BufEnter,BufWritePost * lcd %:p:h

" <C-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Hide pyc files in file explorer (:help netrw_list_hide)
let g:netrw_list_hide= ".*\.pyc$,*\.pyo$,.*\.swp$"

" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" Escape html tags
function HtmlEscape()
  silent s/&/\&amp;/ge
  silent s/</\&lt;/ge
  silent s/>/\&gt;/ge
  silent s/"/\&quot;/ge
endfunction

map <silent> ,h :call HtmlEscape()<CR>

" Escape Django brackets
function DjangoEscape()
  silent s/{/\&#123;/ge
  silent s/}/\&#125;/ge
endfunction

map <silent> ,d :call DjangoEscape()<CR>

" Make paste just work
" https://github.com/ConradIrwin/vim-bracketed-paste/blob/master/plugin/bracketed-paste.vim
if &term =~ "xterm.*" || &term =~ "screen*"
  function! WrapForTmux(s)
    if !exists('$TMUX')
      return a:s
    endif

    let tmux_start = "\<Esc>Ptmux;"
    let tmux_end = "\<Esc>\\"

    return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
  endfunction

  let &t_SI .= WrapForTmux("\<Esc>[?2004h")
  let &t_EI .= WrapForTmux("\<Esc>[?2004l")

  function! XTermPasteBegin(ret)
    set pastetoggle=<f29>
    set paste
    return a:ret
  endfunction

  execute "set <f28>=\<Esc>[200~"
  execute "set <f29>=\<Esc>[201~"
  map <expr> <f28> XTermPasteBegin("i")
  imap <expr> <f28> XTermPasteBegin("")
  vmap <expr> <f28> XTermPasteBegin("c")
  cmap <f28> <nop>
  cmap <f29> <nop>
endif

"------------------------------------------------------------------------------
" Other.
"------------------------------------------------------------------------------
" automatically change window's cwd to file's dir
" set autochdir
"
"
" autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
" autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim
