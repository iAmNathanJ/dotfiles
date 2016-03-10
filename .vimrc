" A minimal vimrc for new vim users to start with.
"
" Referenced here: http://www.benorenstein.com/blog/your-first-vimrc-should-be-nearly-empty/


" Original Author:	 Bram Moolenaar <Bram@vim.org>
" Made more minimal by:  Ben Orenstein
" Last change:	         2012 Jan 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"
"  If you don't understand a setting in here, just type ':h setting'.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Turn on ruler
set ruler

" Set status bar
set laststatus=2

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Turn on numbering and relative numbering
set number
set relativenumber
set numberwidth=5

" Set indentation style
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent

" Set splitting
set splitright
set splitbelow

" Switch syntax highlighting on
syntax on
colorscheme sierra

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Pathogen
execute pathogen#infect()

" Mappings
map <C-n> :NERDTreeToggle<CR>

