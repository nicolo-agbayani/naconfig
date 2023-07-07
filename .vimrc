" vimrc
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2022 May 18 
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
	set undodir=~/.vim/undo
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
"
" I've taken from several sources, and did my own stuff.  I started here:
" 	URL: http://vim.wikia.com/wiki/Example_vimrc
"
"

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

	" Set 'nocompatible' to ward off unexpected things that your distro might
	" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

	" Attempt to determine the type of a file based on its name and possibly its
	" contents. Use this to allow intelligent auto-indenting for each filetype,
	" and for plugins that are filetype specific.
	" KS 8/15 I didn't like this.  See a Python file
"filetype indent plugin on

	" Enable syntax highlighting
syntax on

noremap	<Left> :echo "Use 'h'"<CR>
inoremap	<Left> <C-o>:echo "Use 'h'"<CR>
noremap	<Right> :echo "Use 'l'"<CR>
inoremap	<Right> <C-o>:echo "Use 'l'"<CR>
noremap	<Down> :echo "Use 'j'"<CR>
inoremap	<Down> <C-o>:echo "Use 'j'"<CR>
noremap	<Up> :echo "Use 'k'"<CR>
inoremap	<Up> <C-o>:echo "Use 'k'"<CR>
noremap	<PageDown> :echo "Use 'ctrl-F'"<CR>
inoremap	<PageDown> <C-o>:echo "Use 'ctrl-F'"<CR>
noremap	<PageUp> :echo "Use 'ctrl-B'"<CR>
inoremap	<PageUp> <C-o>:echo "Use 'ctrl-B'"<CR>


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

	" One of the most important options to activate. Allows you to switch from an
	" unsaved buffer without saving it first. Also allows you to keep an undo
	" history for multiple files. Vim will complain if you try to quit without
	" saving, and swap files will keep you safe if your computer crashes.
set hidden

	" Note that not everyone likes working this way (with the hidden option).  
	" Alternatives include using tabs or split windows instead of re-using the same
	" window for multiple buffers, and/or:

	" Instead of failing a command because of unsaved changes, instead raise a
	" dialogue asking if you wish to save changed files.
" set confirm
" set autowriteall

	" Better command-line completion
set wildmenu

	" Show partial commands in the last line of the screen
set showcmd

	" Modelines have historically been a source of security vulnerabilities. As
	" such, it may be a good idea to disable them and use the securemodelines
	" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

	" Use case insensitive search
"set ignorecase
	" except when using capital letters
"set smartcase

	" search as you type
"set incsearch
	" highlight searches
"set hlsearch


	" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=eol,start,indent
" set bs=2 "same as above

	" Stop certain movements from always going to the first character of a line.
	" While this behaviour deviates from that of Vi, it does what most users
	" coming from other editors would expect.
set nostartofline

	" Display the cursor position on the last line of the screen or in the status
	" line of a window
set ruler

	" Always display the status line, even if only one window is displayed
"set laststatus=2

	" Use visual bell instead of beeping when doing something wrong
" set visualbell
" set t_vb=

	" Disable bell
set belloff=all

	" Enable use of the mouse for all modes
set mouse=

	" Set the command window height to 2 lines, to avoid many cases of having to
	" "press <Enter> to continue"
"set cmdheight=2

	" Display line numbers on the left
"set number

	" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

	" Use <F2> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F2>

	" automatically save/load fold state
":au BufWinLeave * mkview
":au! BufWinEnter * silent loadview

	" Uncomment if you use a dark background
set background=dark
set showmode
set showmatch
set tw=120	" textwidth
set ffs=unix	" fileformats
set wildmode=longest,list
set colorcolumn=121

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

	" Indentation settings for using hard tabs for indent. Display tabs as
	" two characters wide.
set tabstop=4
set shiftwidth=4
	" Round indent to multiples of shiftwidth  (sr)
set shiftround
	" When opening a new line and no filetype-specific indenting is enabled,
	" keep the same indent as the line you're currently on. Useful for
	" READMEs, etc.
set autoindent
set smartindent

	" The following do not modify the buffer,
	" only its appearance
set wrap
set lbr  " linebreak
set showbreak=+

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

	" Map Y to act like D and C, rather than yy
map Y y$

	" also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L>

	" to avoid hitting "help" rather than escape
map <F1> <Esc>
imap <F1> <Esc>

	" Show tabs, newlines, etc
map <F3> :set invlist<CR>

	" \m to make
map <Leader>m :up<CR>q:?^!make<CR><CR>

	" move among buffers with CTRL
nnoremap <C-H> :bp<CR>
tmap <C-H> <C-W>:bp<CR>
nnoremap <C-J> 4j
nnoremap <C-K> 4k
nnoremap <C-L> :bn<CR>
tmap <C-L> <C-W>:bn<CR>

	" bd does not remove window
command Bd bp|bd #

"------------------------------------------------------------
" vim-airline options {{{1
"
" options for the vim-airline plugin

let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'

"------------------------------------------------------------
" color scheme options {{{1
"
" colors

syntax enable
colorscheme monokai
hi Normal guibg=NONE ctermbg=NONE
set termguicolors

"------------------------------------------------------------
" backup options {{{1
"
" set backup directory

set backupdir=~/.vim/backup
set dir=~/.vim/backup


"------------------------------------------------------------
" syntax highlighting options {{{1
"
" adjust syntax highlighting

unlet c_comment_strings
