"------------------------------------------------------------------------------
" Standard stuff.
"------------------------------------------------------------------------------

set nocompatible        " Disable vi compatibility.
set nobackup            " Do not keep a backup file.
set history=100         " Number of lines of command line history.
set undolevels=200      " Number of undo levels.
set textwidth=0         " Don't wrap words by default.
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set ignorecase          " Case insensitive matching.
set incsearch           " Incremental search.
set noautoindent        " I indent my code myself.
set nocindent           " I indent my code myself.
set scrolloff=5         " Keep a context when scrolling.
set nodigraph             " Required for e.g. German umlauts.
set noerrorbells        " No beeps.
" set nomodeline          " Disable modeline.
set modeline            " Enable modeline.
set esckeys             " Cursor keys in insert mode.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).
set softtabstop=4           " Number of spaces <tab> counts for.
set ttyscroll=0         " Turn off scrolling (this is faster).
set ttyfast             " We have a fast terminal connection.
set hlsearch            " Highlight search matches.
set encoding=utf-8      " Set default encoding to UTF-8.
" set showbreak=+         " Show a '+' if a line is longer than the screen.
" set laststatus=2        " When to show a statusline.
" set autowrite           " Automatically save before :next, :make etc.
set number
set nostartofline       " Do not jump to first character with page commands,
                        " i.e., keep the cursor in the current column.
set viminfo='20,\"50    " Read/write a .viminfo file, don't store more than
                        " 50 lines of registers.

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

