"----
" Startup
" -----

" Clear all autocommands
autocmd!

" Start with filetype off for plugin loading
filetype off

let s:use_ctrlp = 1
let s:use_unite = 0
let s:use_neobundle = 1

if s:use_neobundle
  if has('vim_starting')
    " Required for NeoBundle
    if has('win32')
      set runtimepath +=~/vimfiles/bundle/neobundle.vim/
    else
      set runtimepath +=~/.vim/bundle/neobundle.vim/
    endif
  endif

  " Required for NeoBundle
  if has('win32')
    call neobundle#begin(expand('~/vimfiles/bundle/'))
  else
    call neobundle#begin(expand('~/.vim/bundle/'))
  endif

  " Let NeoBundle manage NeoBundle
  NeoBundleFetch 'Shougo/neobundle.vim'

  " My bundles:

  " Default install from github
  "   Other windows make: 'windows': '"C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\bin\nmake.exe" make_msvc32.mak',
  NeoBundle 'Shougo/vimproc.vim', {
        \ 'build' : {
        \     'windows' : 'tools\\update-dll-mingw',
        \     'cygwin' : 'make -f make_cygwin.mak',
        \     'mac' : 'make',
        \     'linux' : 'make',
        \     'unix' : 'gmake',
        \    },
        \ }

  " Colors
  NeoBundle 'twerth/ir_black'
  NeoBundle 'vim-scripts/moria'
  NeoBundle 'vim-scripts/Color-Sampler-Pack'
  NeoBundle 'vim-scripts/ScrollColors'
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'tomasr/molokai'
  NeoBundle 'nanotech/jellybeans.vim'
  NeoBundle 'NLKNguyen/papercolor-theme'
  NeoBundle 'lilydjwg/colorizer' " Highlights hex codes with their colors

  " Code searching
  " NeoBundle 'mileszs/ack.vim'
  NeoBundle 'rking/ag.vim'

  " Buffer management
  NeoBundle 'vim-scripts/BufOnly.vim'

  " Searching for stuff
  if s:use_ctrlp
    NeoBundle 'kien/ctrlp.vim'
  endif

  if s:use_unite
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/neomru.vim'
  endif

  " File management
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'Xuyuanp/nerdtree-git-plugin' " Show git marks in nerdtree
  NeoBundle 'low-ghost/nerdtree-fugitive' " Adds git menu to nerdtree
  " Forces nerdtree to open with each tab
  " NeoBundle 'jistr/vim-nerdtree-tabs.git'
  NeoBundle 'kopischke/vim-fetch' " Enable vim to open with line numbers appended

  " Auto parentheses
  "   NOTE: This breaks the dot command
  NeoBundle 'Raimondi/delimitmate'

  " Improved Undo functionality
  NeoBundle 'sjl/gundo.vim'

  " Snippets
  NeoBundle 'SirVer/ultisnips'

  " Language specific
  NeoBundle 'elzr/vim-json'
  NeoBundle 'groenewege/vim-less'
  NeoBundle 'tmux-plugins/vim-tmux'
  NeoBundle 'pearofducks/ansible-vim'
  NeoBundle 'docker/docker', { 'rtp': '/contrib/syntax/vim' }
  NeoBundle 'nginx/nginx',   { 'rtp': '/contrib/vim' }

  " JS/React/CoffeeScript

  " What Peter P. suggested, TODO: Summaries
  NeoBundle 'pangloss/vim-javascript'
  NeoBundle 'mxw/vim-jsx'
  NeoBundle 'othree/yajs.vim'
  NeoBundle 'git@github.com:othree/es.next.syntax.vim'
  NeoBundle 'othree/javascript-libraries-syntax.vim'
  NeoBundle 'othree/html5.vim'
  NeoBundle 'jason0x43/vim-js-indent'
  NeoBundle 'mtscout6/vim-cjsx'

  " What I had:
  " NeoBundle 'kchmck/vim-coffee-script'
  " NeoBundle 'mtscout6/vim-cjsx'
  " othree/javascript-libraries-syntax.vim would be good if I got into it
  " NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
  " NeoBundleLazy 'maksimr/vim-jsbeautify', {'autoload':{'filetypes':['javascript']}}
  " NeoBundle 'jsx/jsx.vim'

  " Status bar
  NeoBundle 'vim-airline/vim-airline'
  NeoBundle 'vim-airline/vim-airline-themes'
  NeoBundle 'ntpeters/vim-airline-colornum' " Highlight the current line number with the color of the current mode

  " Easier file movement
  NeoBundle 'Lokaltog/vim-easymotion'
  " Look into https://github.com/justinmk/vim-sneak as an alternative

  " tpope  rocks
  NeoBundle 'tpope/vim-commentary'
  NeoBundle 'tpope/vim-abolish'

  " Surrounding shit
  "   Given
  "       "Hello world!"
  "   press
  "       cs"'
  "   to change to
  "       'Hello world!'
  NeoBundle 'tpope/vim-surround'

  " If I ever do a lot of json stuff, apparently this is **must** have.
  " https://github.com/tpope/vim-jdaddy
  " NeoBundle 'tpope/vim-jdaddy'

  " Ruby stuff
  NeoBundle 'tpope/vim-rails'
  NeoBundle 'tpope/vim-bundler' " Works with vim-rails and vim-rake for bundler goodness
  NeoBundle 'tpope/vim-rake' " vim-rails (with vim-projectionist) for non rails projects
  NeoBundle 'tpope/vim-projectionist' " Project management for navigation n such
  NeoBundle 'tpope/vim-endwise' " Add matching 'end's for blocks
  NeoBundle 'vim-ruby/vim-ruby' " Ruby support stuff

  " Git!
  NeoBundle 'tpope/vim-fugitive' " Awesome git wrapper
  NeoBundle 'tpope/vim-git' " Git runtime files
  NeoBundle 'airblade/vim-gitgutter'

  " Syntax
  NeoBundle 'scrooloose/syntastic' " Easy syntax messages
  NeoBundle 'dbakker/vim-lint' " Linting for vim and vimL files.

  " Improved searches
  NeoBundle 'inside/vim-search-pulse' " Pulse after searches
  NeoBundle 'haya14busa/incsearch.vim' " Show all matches as typed, auto nohl

  "Multiple Curosrs!
  " NeoBundle 'terryma/vim-multiple-cursors'
  NeoBundle 'kana/vim-niceblock' " make |v_b_I| and |v_b_A| available in all visual modes

  " Better Text Objects
  NeoBundle 'wellle/targets.vim'

  " Better Markdown
  NeoBundle 'shime/vim-livedown'
  NeoBundle 'tpope/vim-markdown'

  " Better Buffer management
  NeoBundle 'mhinz/vim-sayonara'

  " Allow . to repeat things more often. Enables plugins (like gitgutter) and I can
  "   map it myself
  NeoBundle 'tpope/vim-repeat' " Wrap stuff for . command

  " Rename a buffer and on disk
  NeoBundle 'danro/rename.vim'

  " Go!
  NeoBundle 'fatih/vim-go'

  " Considering!
  " https://github.com/chrisbra/vim-diff-enhanced " Improved diff's using histogram and patience algorithms
  " https://github.com/thoughtbot/vim-rspec " Sweet rspec integration
  " NeoBundle 'yegappan/mru' " :MRU Most Recently Used files
  " NeoBundle 'dougnukem/vim-swap-lines' " Swap two lines


  " No longer using:
  " This is almost entirely handled by `rubocop --auto-correct` for ruby files
  " NeoBundle 'godlygeek/tabular' " Easy Alignment!

  call neobundle#end()

  " If there are uninstalled bundles found on startup,
  " this will conveniently prompt you to install them.
  NeoBundleCheck

  if !has('vim_starting')
    " Call on_source hook when reloading .vimrc
    call neobundle#call_hook('on_source')
  endif
endif

" Forget being compatible with good ol' vi
set nocompatible

" Get that filetype stuff happening
filetype on

" Syntax and indent by filetype
filetype plugin on
filetype indent on
filetype plugin indent on

" Turn on that syntax highlighting
syntax on

" Restore cursor position from last time you editted the file
augroup line_return
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \       execute 'normal! g`"zvzz' |
        \ endif
augroup END


" -----
" Vim Preferences
" -----

" Allow dirtied buffers to be hidden
set hidden

" Show what you are typing as a command
set showcmd

" Keep some stuff in the history
set history=10000

" Save undo's after file closes
set undofile

" Use lots of undo levels
set undolevels=1000

" Number of lines to save for undo
set undoreload=10000

" Save undo's after file closes
"set undofile
" Set where to save undo histories
" Fancy undo file location. The trailing '//' makes a unique path by using the
" full path of the original file.
set undodir=~/vimfiles/tmp/undo//
set backupdir=~/vimfiles/tmp/backup// " Backups
set directory=~/vimfiles/tmp/swap//   " Swap Files
set backup                        " Enable backups
set noswapfile                    " No More Collisions!

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

" Show filename in titlebar of window
set title

" Don't set the title to something weird when we're saving/closing
set titleold=

" Always reload buffer when external changes detected
set autoread

" Last window always has a statusline
set laststatus=2

" Only care about base 10 digits, not octal or hex
set nrformats=

" Various characters are "wider" than normal fixed width characters, but the
" default setting of ambiwidth (single) squeezes them into "normal" width,
" which sucks.  Setting it to double makes it awesome.
" -- From derekwyatt
set ambiwidth=double


" -----
" Window/Buffers/Tabs
" -----

" Only apply to .txt files...
augroup HelpInVerticalRightSplit
  autocmd!
  autocmd BufEnter  *.txt   call HelpInVSplit()
augroup END

"Only apply to help files...
function! HelpInVSplit()
  if &buftype == 'help'
    "Convert the help window to right-side veritcal split
    execute "normal \<C-W>L"
  endif
endfunction

" left and right are for switching buffers
noremap <right> :bn<return>
noremap <left> :bp<return>

" ctrl + tab and ctrl + shift + tab too, like firefox/chrome/iterm
noremap <C-Tab> :bn<return>
noremap <C-S-Tab> :bp<return>



" -----
" TABS and Whitespace
" -----

" Spaces are better than a tab character
set expandtab
set smarttab

" Who wants an 8 character tab?  Not me!
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Set the cursor at the same indent as line above
set autoindent

" Try to be smart about indenting (c-style)
set smartindent

" Use existing indents for new indents
set copyindent

" Save as much indent structure as possible
set preserveindent

" Always round indents to multiple of shiftwidth
set shiftround

" Only one space when using "join" commands
set nojoinspaces

augroup VisualEffects
  au!
  " Remove any trailing whitespace that is in the file
  autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

  " Save when losing focus
  " NOTE: This doesn't work as well as it should. It's a cool idea though.
  "autocmd FocusLost * :wa
  " Same thing, haven't tried this version though
  "autocmd FocusLost * :silent! wall

  " Resize splits when the window is resized
  autocmd VimResized * exe "normal! \<c-w>="
augroup END

" Fix indents when linewrap is on
set breakindent


" -----
" Column length!
" -----

if exists('+colorcolumn')
  set colorcolumn=80
else
  " If we don't support colorcolumn, then highlight the characters past column 80
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endif


" -----
" File Specific Display stuff like tabs
" -----

augroup JavaScriptFiles
  au!

  " Fold by indentation in CoffeeScript
  autocmd BufNewFile,BufRead *.coffee setlocal foldmethod=indent nofoldenable

  " Detect .es6 files
  autocmd BufNewFile,BufRead *.es6 setlocal filetype=javascript.jsx
augroup END

augroup XmlFiles
  au!

  let g:xml_syntax_folding=1
  au FileType xml setlocal foldmethod=syntax
augroup END

augroup RSpecFiles
  au!
  " rails-vim doesn't correctly assign buffer types for all of the files, manually do some of it
  autocmd BufNewFile,BufRead *_spec.rb syntax keyword rubyRailsTestMethod describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let expect it to be eq
augroup END

augroup RubyFiles
  au!

  " vim-ruby screws up my formatting options
  "   We don't want to continue comments when pressing o/O
  autocmd Filetype ruby setlocal formatoptions-=o
  "   Don't continue comments after pressing <Enter> in insert either
  autocmd Filetype ruby setlocal formatoptions-=r
augroup END

augroup VimFiles
  au!

  " Vim's built in file type stuff doesn't like to respect my settings!
  "   Don't auto wrap test
  autocmd Filetype vim setlocal textwidth=0
  "   We don't want to continue comments when pressing o/O
  autocmd Filetype vim setlocal formatoptions-=o
  "   Don't continue comments after pressing <Enter> in insert either
  autocmd Filetype vim setlocal formatoptions-=r
augroup END

augroup GitFiles
  au!

  " Highlight the point at which the message is too long
  autocmd Filetype gitcommit setlocal colorcolumn=51
  " Correctly wrap body message lines, at 72 characters
  autocmd Filetype gitcommit setlocal textwidth=72

  " Comment string to comment instead of removing files
  autocmd Filetype gitconfig setlocal commentstring=#%s
augroup END

" -----
" Typing Behaviors
" -----

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
  set spl=en spell
  set nospell
endif

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
"set wildmenu
set wildmode=list:longest,full

" File types to ignore for wildmode
" Note #0: These are from :help ctrlp
" Note #1: the `*/` in front of each directory glob is required.
" Note #2: |wildignore| influences the result of |expand()|, |globpath()| and
" |glob()| which many plugins use to find stuff on the system (e.g. VCS related
" plugins look for .git/, .hg/,... some other plugins look for external *.exe
" tools on Windows). So be a little mindful of what you put in your |wildignore|.
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.gitignore,*.sln,.hg            " Version Control, tpope says don't ignore .git
" set wildignore+=*.gitignore,*.sln,.hg,.git     " Version Control
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " Compiled objects
set wildignore+=*.DS_Store                       " OSX Sucks
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png   " Binary images
set wildignore+=*/.bundle/*                      " Ruby bundle stuff

" Set the forward slash to be the slash of note.  Backslashes suck
" Matters only on Windows
set shellslash

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Hide the mouse pointer while typing
set mousehide

" This is the timeout used while waiting for user input on a
" multi-keyed macro or while just sitting and waiting for another
" key to be pressed measured in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait
"      period between the "," key and the "d" key.  If the
"      "d" key isn't pressed before the timeout expires,
"      one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
"
" The idea here is that if you have two commands, say ",dv" and
" ",d" that it will take 'timeoutlen' milliseconds to recognize
" that you're going for ",d" instead of ",dv"
"
" In general you should endeavour to avoid that type of
" situation because waiting 'timeoutlen' milliseconds is
" like an eternity.
set timeoutlen=500
" Use a different length for key-codes
set ttimeoutlen=50

" Escape from insert mode faster
augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=500
augroup END

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" Don't continue comments when pushing o/O
set formatoptions-=o

" Don't continue comments when pressing <Enter>
set formatoptions-=r

" Don't let anything wrap my lines unless I choose to
set formatoptions-=t " Don't automatically wrap
set textwidth=0 " If we were to auto wrap, or something added fo+=t then still don't
set wrapmargin=0 " Similar to textwidth but relative to terminal width

" When it makes sense, remove comment leader when joining lines
set formatoptions+=j

" Use the system clipboard for yanking
set clipboard=unnamed


" -----
" Completion
" :help ins-completion
"   CTRL-Y: Stop completion and accept currently selected entry
"   CTRL-E: Stop completion and return to originally typed text
"   See: :help popupmenu-keys
" More options:
"   pumheight
" Highlight options:
" Pmenu      normal item  |hl-Pmenu|
" PmenuSel   selected item  |hl-PmenuSel|
" PmenuSbar  scrollbar  |hl-PmenuSbar|
" PmenuThumb thumb of the scrollbar  |hl-PmenuThumb|
"
" Look into:
"   let g:rubycomplete_buffer_loading = 1
"   let g:rubycomplete_classes_in_global = 1
" -----

" Use a popup menu to show possible completions one there is one or more matches
"   and show extra information about the currently selected completion
set completeopt=menuone,preview



" -----
" Movement
" -----
" Don't move cursor to start of line when using certain movement commands like
" "<c-d>" or "gg"
set nostartofline

" Don't include _ as a character for movements like 'w', 'b', 'e', '*', etc.
" Defaults are: iskeyword=@,48-57,_,192-255
" This screws up syntax highlighting and stuff
" set iskeyword-=_


" -----
" Searching
" -----

" Incrementally match the search.
set incsearch

" Set the search scan to wrap around the file
set wrapscan

" Ignore case for searching
set ignorecase

" BUT use case if upper case letter is used
set smartcase

" Different characters take on different meanings in search
"   . is any character
"   $ matches end-of-line
"   and a few others. See :help magic
set magic

" ignore all whitespace and sync when searching
"set diffopt=filler,iwhite

" Visual Mode */# from Scrooloose
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>


" -----
" GUI Settings
" -----

" Make command line one lines high
set cmdheight=1

" Don't update the display while executing macros
set lazyredraw

" Don't show mode, airline does that
set noshowmode

" Show the line number on the bar
set ruler

" Line Numbers please!
set number

" No error bells please
set noerrorbells
set visualbell

" set visual bell OFF
set t_vb=
au GUIEnter * set visualbell t_vb=

" Sets the default size of gvim on open
set lines=50 columns=90

" Set the possible encodings
set fileencodings=ucs-bom,utf-8,latin1

" Set encoding
set encoding=utf-8

" Show tabs
set listchars=tab:▸\

" Session Detection fun
function! InConEmuSession()
  return has('win32') && !has('gui_running') && !empty($CONEMUBUILD)
endfunction

function! InTmuxSession()
  return $TMUX != ''
endfunction

function! InItermSession()
  " This would work with other programs, Apple_Terminal for one
  return $TERM_PROGRAM =~ "iTerm"
endfunction

function! HasColorscheme(name)
  let pat = 'colors/'.a:name.'.vim'
  return !empty(globpath(&rtp, pat))
endfunction

" Colors!
if has('gui_running')
  set background=dark

  if HasColorscheme('PaperColor')
    colorscheme PaperColor
    let g:airline_theme='PaperColorRecharged'
  else
    colorscheme inkpot
    let g:airline_theme='luna'
  endif
  " Remove the gui from GVim
  :set guioptions-=m " Remove menu bar
  :set guioptions-=T " Remove the toolbar
  :set guioptions-=r " Remove the right-hand scroll bar
  :set guioptions-=L " Remove the left-hand scroll bar...bar[]

  " Windows Specific stuff
  if has('win32')
    " Set vim to be maximized on opening
    au GUIEnter * simalt ~x
    " Set the default font to Consolas (Which is what Visual Studio uses)
    set guifont=Consolas:h12:cANSI
  else
    " Set the default font to Source Code Pro (with escaped spaces) which I
    " use everywhere!
    " set guifont=Source\ Code\ Pro\ for\ Powerline:h12
    set guifont=Source\ Code\ Pro:h12 " Not using the powerline symbols for now
  endif
else
  set term=xterm
  set t_Co=256
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
  set background=dark
  if HasColorscheme('jellybeans')
    colorscheme jellybeans
    let g:airline_theme='jellybeans'
  else
    colorscheme inkpot
    let g:airline_theme='luna'
  endif


  " ConEmu specific
  " if InConEmuSession()
  " endif

  " Enable cursor switching in different modes
  "   Source: http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
  "   Source: http://vim.wikia.com/wiki/Configuring_the_cursor
  "   Source: https://gist.github.com/andyfowler/1195581
  if InTmuxSession()
    " TODO: This should have enter exit features as well
    " http://ass.kameli.org/cursor_tricks.html is nice as well
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    " t_SI is cursor when entering insert mode
    " t_SR is cursor when entering replace mode
    " t_EI is cursor after exiting insert or replace mode

    " Cursor shape option 1:
    "   Works with iTerm2
    " block "\<Esc>]50;CursorShape=0\x7"
    " vertical bar "\<Esc>]50;CursorShape=1\x7"
    " underline "\<Esc>]50;CursorShape=2\x7"

    " Cursor shape option 2:
    "   Works with VTE compatible terminals. (iTerm2 works)
    " "\<ESC>[{num} q" where num:
    " 1 or 0 -> blinking block
    " 2 -> solid underline
    " 3 -> blinking underline
    " 4 -> solid block
    " 5 -> blinking vertical bar
    " 6 -> solid vertical bar
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"


    augroup CorrectCursor
      au!
      " Set the cursor to solid vertical block on enter
      au VimEnter * silent !echo -ne "\033[2 q"
      " Set the cursor back to solid vertical bar on exit
      au VimLeave * !echo -ne "\033[6 q"
    augroup END
  endif
endif

" Long lines make syntax highlighting slow
set synmaxcol=2048

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

" Keep some columns visible when horizontally scrolling
set sidescroll=1
set sidescroll=8

" Set off the other paren by FLASHING
highlight MatchParen ctermbg=4

set showmatch mat=6 " show matching parens for 600ms

" Shows report when any ammount of lines are changed (read always)
set report=0

" 'a' = Shorten messages, 'oO' = overwrite read/write messages (required for vim-fetch),
" 'tT' = truncate messages that are too long, and 'I' = skip the Vim :intro
set shortmess=aoOtTI

" Open new split panes to the right and bottom, feels a lot more natural
set splitbelow
set splitright

" Using the mouse in the terminal
if has('mouse')
  set mouse=a
  if has('mouse_sgr') || v:version > 703 ||
        \ v:version == 703 && has('patch632')
    " Ideal mouse setting, backwards compatible with xterm and xterm2
    set ttymouse=sgr
  else
    " Fallback
    set ttymouse=xterm2
  endif
endif


" -----
" Visual Mode Better
" -----

" Switch Visual and Visual-Block
nnoremap v <c-v>
nnoremap <c-v> v
vnoremap v <c-v>
vnoremap <c-v> v

"Reselect after indent so it can easily be repeated
vnoremap < <gv
vnoremap > >gv

" Make BS/DEL work as expected in vusal modes (i.e. delete the selected text)
vmap <BS> x

" Make vaa select the entire file
vmap aa VGo1G

" Visual block beyond the characters in the line, ie virtually
set virtualedit=block

" -----
" Custom Functions
" -----

" Sets the arglist to contain each of the files referenced by the quickfix list
"   Source: http://vimcasts.org/episodes/project-wide-find-and-replace/
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction


" -----
" Plugin settings
" -----

" Disable vim-json conceal settings
let g:vim_json_syntax_conceal = 0

" Prevent vim.jsx from setting up keymaps
let g:jsx_no_default_key_mappings = 1

" Let JSX run in normal JS files
let g:jsx_ext_required = 0

" Set the easy motion leader key to be - so it's activated with -
map - <Plug>(easymotion-prefix)

" Using easy motion show all the places where two characters appear, both fwds
" and bwds
map <SPACE> <Plug>(easymotion-s2)

" If <BS> is already mapped then delimitmate won't remap it
inoremap <BS> <BS>


" -----
" Blockle function
" -----

function! ConvertDoEndToBrackets()
  let char = getline('.')[col('.')-1]
  let w = expand('<cword>')

  if w=='end'
    norm %

  elseif char == 'o'
    echo "char == 'o', norm! h"
    norm! h
  endif
  let do_pos = getpos('.')
  let begin_num = line('.')
  norm %
  let try_again = 25
  while try_again && expand('<cword>') !=# 'end'
    let try_again = try_again - 1
    norm %
  endwhile
  echo "after try_again cword is"
  echo expand('<cword>')

  let lines = (line('.')-begin_num+1)

  norm ciw}
  call setpos('.', do_pos)
  norm de

  let line = getline(begin_num)
  let before_do_str = strpart(line, 0, do_pos[2] - 1)
  let after_do_str  = strpart(line, do_pos[2] - 1)

  call setline(begin_num, before_do_str . "{" . after_do_str)

  if lines == 3
    norm! JJ
    " Remove extraneous spaces
    " if search('  \+', 'c', begin_num) | :.s/\([^ ]\)  \+/\1 /g | endif
    call setpos('.', do_pos)
  endif
endfunction


" ----- Bindings
augroup blockle
  autocmd!
  autocmd FileType ruby nnoremap <silent> <buffer> <Leader>bld :call blocked#BracketsToDoEnd()<CR>
  autocmd FileType ruby nnoremap <silent> <buffer> <Leader>blf :call blocked#DoEndToBrackets()<CR>
augroup END

" -----
" Splitjoin settings
" -----
" No curly braces after splitting or joining in Option hashes
" let g:splitjoin_ruby_curly_braces = 0

" Don't leave arguments hanging
" let g:splitjoin_ruby_hanging_args = 0


" -----
" NERDTree customization
" -----
" Source: https://github.com/jistr/vim-nerdtree-tabs
" Source: https://github.com/mhinz/vim-sayonara
" Source: https://github.com/scrooloose/nerdtree

" Close NERDTree after openning a file
let NERDTreeQuitOnOpen=1

" Show hidden files by default
let NERDTreeShowHidden=1

" Hide helper text at the top
let NERDTreeMinimalUI=1

" Cascae open while selected directory has only one child thats a directory
let NERDTreeCascadeOpenSingleChildDir=1

" Automatically remove a buffer when a file is deleted or renamed
let NERDTreeAutoDeleteBuffer=1

augroup NERDTreeCustomization
  autocmd!

  " Open NERDTree if vim is openned without a file specificed
  " Note: I don't think I like this behavior
  " autocmd StdinReadPre * let s:std_in=1
  " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

  " Close NERDTree
  " This should happen:
  "   When I ZZ the window and only the NERDTree window is left
  autocmd BufEnter * call CloseIfNERDTreeIsPrimary()
augroup END

function! CloseIfNERDTreeIsPrimary()
  if winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()
    q
  endif
endfunction


" -----
" Plugin: Airline
" -----

" Automatically displays all buffers when theres only one tab open
" TODO: investigate airline-tabline for more options
let g:airline#extensions#tabline#enabled = 1

" Enable syntastic integration
let g:airline#extensions#syntastic#enabled = 1

" TODO: investigate airline-hunks (and mhinz/vim-signify + tomtom/quickfixsigns_vim)
" TODO: investigate airline-ctrlp for show_adjacent_modes
" TODO: investigate airline-wordcount

" Ensure symbols dictionary exists
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Set custom symbols
" TODO: Doesn't work in terminal vim
let g:airline_left_sep = '►'
let g:airline_right_sep = '◄' " Does work in terminal...?

" Set up status line
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_section_y=' [%n] '
let g:airline_section_z='%3p%% : %3l/%-3L :%4c '
let g:airline#extensions#default#layout = [
      \ [ 'a', 'c' ],
      \ [ 'x', 'y', 'z', 'warning' ]
      \ ]

" Disable paste detection
let g:airline_detect_paste=1

" Enable the cursorline coloring
:set cursorline
hi clear CursorLine


" -----
" Plugin: Ctrl-p
" -----

if s:use_ctrlp
  " Ignore stuff
  let g:ctrlp_custom_ignore = {
        \ 'dir': '\v[\/](\.git|\.hg|\.svn|_site|vimfiles)$',
        \ }

  " Don't ignore hidden files
  let g:ctrlp_show_hidden = 1

  " Don't follow symbolic links
  let g:ctrlp_follow_symlinks = 0

  " Where to do ctrlp caching
  let g:ctrlp_cache_dir = $HOME.'/vimfiles/tmp/ctrlp/cache'

  " Always jump to open buffers
  let g:ctrlp_switch_buffer = 'ETVH'

  " Working directory as such:
  "   1. Try find a vcs (.git, .gh, .svn) root to use
  "   2. Is the working directory of the owning shell an ancestor of the
  "       current file? Use that.
  "   3. Use directory of the current file
  let g:ctrlp_working_path_mode = 'ra'

endif


" -----
" Plugin: Unite
" -----
if s:use_unite
  " Tons of good shit at https://github.com/bling/dotvim/blob/master/vimrc#L563
  " Look at http://mouki.io/2013/08/15/Vim-CtrlP-behaviour-with-Unite.html


  " Quickfix source:
  " https://github.com/osyo-manga/unite-quickfix

  " Tag source:
  " https://github.com/tsukkee/unite-tag

  " -- Supposed Ctrl-P replacement from https://gist.github.com/meatcar/5667617
  " nnoremap <leader>t :<C-u>Unite file_mru file_rec/async:! -start-insert -buffer-name=files<CR>
  " nnoremap <leader>cd :<C-u>Unite directory_mru directory -start-insert -buffer-name=cd -default-action=cd<CR>

  " -- Source: https://reinteractive.net/posts/166-awesome-vim-plugins
  " Search recently edited files
  nnoremap <silent> <Leader>m :Unite -buffer-name=recent -winheight=10 file_mru<cr>

  " Search open buffers
  nnoremap <Leader>b :Unite -buffer-name=buffers -winheight=10 buffer<cr>

  " Search application
  nnoremap <Leader>f :Unite grep:.<cr>

  " File searching just like Ctrl-P
  if exists(':Unite')
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#filters#sorter_default#use(['sorter_rank'])
    call unite#custom#source('file_rec/async','sorters','sorter_rank')
  endif
  " replacing unite with ctrl-p
  if !s:use_unite
    nnoremap <silent> <C-p> :Unite -start-insert -buffer-name=files -winheight=10 file_rec/async<cr>
  endif

endif


" -----
" Plugin: Syntastic
" -----
" Default settings sill
" if exists(':SyntasticStatuslineFlag')
"   " TODO: I don't think this is required, airline does stuff without it
"   set statusline+=%#warningmsg#
"   set statusline+=%{SyntasticStatuslineFlag()}
"   set statusline+=%*
" endif

" Always put errors into the location list
" let g:syntastic_always_populate_loc_list = 1
" Open the location list when errors are found
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Don't use any checkers for python, too slow
let g:syntastic_python_checkers = []

" Use 'yamllint' for yaml files
"   Further Info: http://yamllint.readthedocs.io/en/latest/
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_yaml_yamllint_args = '-c ' . shellescape($HOME . '/.yamllint')

" Use the rbenv ruby instead of system (outdated) ruby
let g:syntastic_ruby_mri_exec = '/usr/local/var/rbenv/shims/ruby'


" -----
" Plugin: vim-rails
" -----
" we want:
"   components/vendors/style_crest/lib/style_crest/shipping.rb
"   to map to alternate at:
"   spec/components/vendors/style_crest/lib/shipping.rb
let g:rails_projections = {
      \ "components/*.rb": {
      \   "test": "spec/components/{}_spec.rb",
      \ },
      \ "spec/components/*_spec.rb": {
      \   "test": "components/{}.rb"}}


" -----
" Plugin: nerdtree-git-plugin
" -----
" Change the indicators
let g:NERDTreeIndicatorMap = {
      \ "Modified"  : "~",
      \ "Staged"    : "☈",
      \ "Untracked" : "♦",
      \ "Renamed"   : "⁕",
      \ "Unmerged"  : "⥮",
      \ "Deleted"   : "␡",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✓",
      \ "Unknown"   : "?"
      \ }


" -----
" Plugin: vim-surround
" -----
" Enable automatic re-indenting by Vim, = command style
let g:surround_indent = 1

" Don't automatically create insert mode mappings, I'll do that myself if
"   needed
let g:surround_no_insert_mappings = 1


" -----
" Plugin: vim-search-pulse
" -----
" Only pulse on matched pattern, not the line
let g:vim_search_pulse_mode = 'pattern'

" Don't create mappings on |n| and |N|, we'll do it ourselves
let g:vim_search_pulse_disable_auto_mappings = 1

let g:vim_search_pulse_color_list = ["#F92672", "#A6E22E", "#AE81FF"]
let g:vim_search_pulse_duration = 400

augroup SearchPulseOnEnter
  au!

  " Pulses the first match after hitting the enter key
  autocmd User IncSearchExecute :call search_pulse#Pulse()
augroup END


" -----
" Plugin: incsearch.vim
" -----
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Automatically turn off hlsearch after cursor move
set hlsearch
let g:incsearch#auto_nohlsearch = 1

" We could use |n| in other mappings, this is a drop in replacement so don't noremap it
" Include the <Plug>Pulse to call vim-search-pulse as well
map n  <Plug>(incsearch-nohl-n)<Plug>Pulse
map N  <Plug>(incsearch-nohl-N)<Plug>Pulse
map *  <Plug>(incsearch-nohl-*)<Plug>Pulse
map #  <Plug>(incsearch-nohl-#)<Plug>Pulse
map g* <Plug>(incsearch-nohl-g*)<Plug>Pulse
map g# <Plug>(incsearch-nohl-g#)<Plug>Pulse

augroup NoHlOnInsert
  au!

  " Exit hlsearch when entering insert as well
  autocmd InsertEnter * :set nohlsearch

  " Reenable it so that future searchs do hlsearch
  autocmd InsertLeave * :set hlsearch
augroup END

" Tell incsearch that we're using 'magic' search
let g:incsearch#magic = '\m'

" Highlight matched pattern separately with forward matches and backward matches
let g:incsearch#separate_highlight = 1


" -----
" Plugin: vim-go
" -----
let g:go_fmt_command = "goimports"


" -----
" Plugin: vim-livedown
" -----
" To setup:
"   npm install -g livedown

" Should the markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0

" Should the browser window pop-up upon previewing
let g:livedown_open = 1

" Port to run Livedown on
let g:livedown_port = 3030


" -----
" Plugin: vim-markdown
" -----
" Enable syntax highlighting for fenced code blocks
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'shell=sh', 'css', 'sass', 'less'
      \ 'zsh=sh', 'ruby', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript']


" -----
" Plugin: vim-gitgutter
" -----
" Extra commandline arguments for git diff
let g:gitgutter_diff_args = '-w'

nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk


" -----
"  Key Maps
" -----

" Set the leader key
let mapleader = ","

" Potentially unused keys:
" "\ <space> <bs> Z Q R S X _ !"
" also " - (my leader), H, L, <CR>"
" Keys waiting for a second key could also be used to start a mapping:
" "f t d c g z v y m ' [ ]"


" -----
" General Key Maps
" -----

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
if has("mac")
  nnoremap <silent>∆ :set paste<CR>m`o<Esc>``:set nopaste<CR>j
  nnoremap <silent>˚ :set paste<CR>m`O<Esc>``:set nopaste<CR>k
else
  nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>j
  nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>k
endif

" cd to the directory containing the file in th buffer
nnoremap <Leader>cd :lcd %:h

" Make the directory that contains the file in the current buffer.
" This is useful when you edit a file in a directory that doesn't
" (yet) exist
nnoremap <Leader>md :!mkdir -p %:p:h

" Yank all
nnoremap <Leader>a :%y+<CR>

" Quickly edit/reload the vimrc file
nnoremap <silent> <Leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <Leader>sv :so $MYVIMRC<CR>

" Maximize window
" Note: Only works on windows
nnoremap <silent> <leader>mm :simalt ~x<CR>

"Highlight whitespaces
nnoremap <silent> <leader>hws :set list listchars=tab:>.,trail:.,extends:#,nbsp:.<CR>
nnoremap <silent> <Leader>nhws :set nolist<CR>

" Close all buffers except current
nnoremap <silent> <Leader>bo :BufOnly<CR>

" Close the current buffer, preserving the window
nnoremap <silent> <Leader>bd :call BetterBufferDelete()<CR>

function! BetterBufferDelete()
  if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1 && winnr("$") == 2
    execute "bdelete" bufnr("%")
    quit
  else
    execute "Sayonara!"
  endif
endfunction

" Fix ^M line endings
nnoremap <silent> <Leader>le :s%/\r/\r/g<CR>

" Insert a single character and go back to command mode
noremap S i<Space><Esc>r

" Xml formatting!
autocmd FileType xml noremap <buffer> <c-e><c-f> :silent %!xmllint % --format --recover<CR>

" Easier vertical splitting with '|'
nnoremap <silent> <Bar> :vsplit<CR>

" Easier horizontal splitting with '_'
nnoremap <silent> _ :split<CR>

" Set the buffer to <Scratch>
" TODO: Consider setting this by default when we just open vim with no file specified
nnoremap <silent> <Leader>s :setlocal buftype=nofile<CR>


" -----
" Macro Key Maps
" -----

" Insert a binding.pry
nnoremap <Leader>pr orequire 'pry'; binding.pry<Esc>


" -----
" Syntax Highlighting Utility Kemaps
" -----

" Return highlight group under cursor, if trans is zero it returns the "effective" group
function! SyntaxItem(trans)
  return synIDattr(synID(line("."), col("."), a:trans), "name")
endfunction

nnoremap <Leader>sg :echo "Syntax Group:" SyntaxItem(1)<CR>
nnoremap <Leader>sh :echo "Syntax Group(trans=0):" SyntaxItem(0)<CR>

" -----
" Nop Key maps
" -----
" I keep pressing shift-k accidentally and it runs shell commands, ignore it instead
nnoremap <s-k> <Nop>


" -----
" Override Default Behavior Key Maps
" -----

" Switch ; and :, so ; acts as the command leader
noremap ; :
noremap : ;

" Keep the mental mapping going and use ; as : for
"   ommand-line window too. See `:help cmdline-window`
nnoremap q; q:

" Deleting single character shouldn't squash the paste buffer
nnoremap <silent> x "_x
vnoremap <silent> x "_x

" Pasting in insert shouldn't squash the paste buffer
" TODO: Fix this
" vnoremap <silent> p "_xp

" -----
" Insert Mode Key Maps
" -----

" ctrl-'forward' jump to end of line
imap <c-f> <c-O>$
" ctrl-'back' jump to start of line
imap <c-b> <c-O>^


" -----
" Gundo Key Maps
" -----

" Mapping for Gundo
nnoremap <Leader>gu :GundoToggle<CR>

" Shut visualizer when a state is selected
let g:gundo_close_on_revert=1

" Move the layout to the right
let g:gundo_right=1


" -----
" JsBeautify Key Maps
" -----

" JsBeautify
map <c-e><c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer> <c-e><c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-e><c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-e><c-f> :call CSSBeautify()<cr>
" for less
autocmd FileType less noremap <buffer> <c-e><c-f> :call CSSBeautify()<cr>
" for json!
autocmd FileType json noremap <buffer> <c-e><c-f> :%!python -m json.tool<cr>
" do it by range in visual mode
autocmd FileType javascript vnoremap <buffer> <c-e><c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-e><c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-e><c-f> :call RangeCSSBeautify()<cr>


" -----
" UltiSnips Key Maps and Settings
" -----

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Custom snippets directory
" When you specifiy only one directory then UltiSnips will not search
" the runtimepath, which is faster. It will search for Snipmate snippets on
" the runtimepath though.
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" Don't load snipmate snippets.
let g:UltiSnipsEnableSnipMate=0


" -----
" NERDTree Key Maps
" -----
nnoremap <leader>nt :NERDTreeToggle<CR>


" -----
" vim-livedown (for Markdown) Key Maps
" -----
augroup LivedownMarkdownKeyMaps
  au!

  autocmd FileType markdown nnoremap <Leader>ld :LivedownPreview<CR>
  autocmd FileType markdown nnoremap <Leader>lk :LivedownKill<CR>
augroup END


" -----
" EasyMotion Key Maps
" -----
"  From: http://www.robati.com/vim/2014/11/03/vimrc.html
" " EasyMotion
" let g:EasyMotion_do_mapping = 0       " Disable default mappings
" nmap s <Plug>(easymotion-bd-w)
" nmap t <Plug>(easymotion-t2)
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)
" map <Leader>l <Plug>(easymotion-lineforward)
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" map <Leader>h <Plug>(easymotion-linebackward)
" let g:EasyMotion_startofline = 0      " keep cursor column when JK motion
" let g:EasyMotion_smartcase = 1        " type `l` and match `l`&`L`
" let g:EasyMotion_use_smartsign_us = 1 " type `3` and match `3`&`#`
