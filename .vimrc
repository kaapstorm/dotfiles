" excerpt from esorgel's .vimrc

" Settings
" ========

" Show trailing whitespace
set list listchars=tab:»·,trail:·

if has('mouse')
    set mouse=a
endif

set number                 " show line numbers
set ignorecase
set smartcase              " Make searches case-sensitive iff search is mixed case
set autoread               " Read any changes on disk if not altered in vim

" Indent well
set backspace=indent,eol,start

" Tab options
set expandtab              " Always uses spaces instead of tabs
set softtabstop=4          " Insert 4 spaces when tab is pressed
set shiftwidth=4           " An indent is 4 spaces
set smarttab               " Indent instead of tab at start of line
set shiftround             " Round spaces to nearest shiftwidth multiple
set nojoinspaces           " Don't convert spaces to tabs
set tabstop=4              " A tab is 4 spaces

set textwidth=72           " Use gq / gw to wrap
set colorcolumn=80,115
