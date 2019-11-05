" Take a look at default vimrc file at
" /usr/share/vim/vim81/defaults.vim
"
"******************************
"
"	Custom
"
"******************************
"
" Map jk to esc
:imap jk <Esc>

" Show numberline
:set nu rnu

" Enable cursor position on mouse click
if has('mouse')
	set mouse=a
endif

" Blink cursor
set guicursor=n:blinkon1

" sudo write with :w!!
cmap w!! w !sudo tee > /dev/null %
