" *********** Features ***********
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
"runtime! debian.vim

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
"set term=ansi " required when keyboard arrow keys don't work, but it breaks
"vim

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype plugin indent on


" ***** Basic behavior **************

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set wildmenu    " Better command-line completion

" Searching options
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set hlsearch    " highlight search

" ***** Buffer options
"set autowrite		" Automatically save before commands like :next and :make
"set autowriteall
set hidden		" Hide buffers when they are abandoned

"set mouse=a		" Enable mouse usage (all modes)


" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
set smartindent   " even better autoindent (e.g. add indent after '{')

" Stop certain movements from always going to the first character of a line.
"set nostartofline

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Quickly time out on keycodes, but never time out on mappings
"set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

"set autoread           " autoreload the file in Vim if it has been changed outside of Vim

" ******* Visuals **************

" Enable syntax highlighting
syntax on

set number! relativenumber!
highlight CursorLineNr term=bold cterm=NONE ctermfg=220
" grey37 = 59
highlight LineNr ctermfg=59
highlight Visual ctermfg=White ctermbg=blue
set scrolloff=10
set cursorline         " highlight current line
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=236
highlight Search ctermfg=White ctermbg=magenta

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark
highlight Comment ctermfg=242

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
"set cmdheight=2

" put colorscheme files in ~/.vim/colors/
"colorscheme murphy      " good colorschemes: murphy, slate, molokai, badwolf, solarized

" ******** Keymaps **************
imap jk <Esc>
"sudo write
cmap w!! w !sudo tee > /dev/null %

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
noremap x "_x
noremap X "_X
map = <C-a>
map - <C-x>

" map end-of-line change in iterm for ^; -> esc+} (^[})
map <esc>} $
imap <esc>} <esc>$a

noremap 0 ^
noremap ^ 0

noremap <C-h> ^

inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
inoremap <C-b> <esc>bi
inoremap <C-e> <esc>ea
inoremap <C-w> <esc>wwi

" new tab
noremap te :tabedit<CR>

" split window
noremap ss :split<CR><C-w>w
noremap sv :vsplit<CR><C-w>w
" move window
noremap <Space> <C-w>w
noremap s <C-w>
" resize window
noremap s<left> <C-w><
noremap s<right> <C-w>>
noremap s<up> <C-w>+
noremap s<down> <C-w>-


 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
"nnoremap <C-L> :nohl<CR><C-L>
"" turn off search highlighting with <CR> (carriage-return)
nnoremap <CR> :nohlsearch<CR><CR>


" *********** Tab behavior ********
"------------------------------------------------------------
" Indentation options
 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4
