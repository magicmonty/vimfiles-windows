set nocompatible  " Vim (not vi) settings. Set early for side effects.
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

let mapleader=","
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"Personal Settings.
"More to be added soon.

execute pathogen#infect()
filetype plugin indent on
syntax on

"Set the status line options. Make it show more information.
set laststatus=2        " Always show a status line.
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\[POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

"Set Color Scheme and Font Options
colorscheme solarized

" Solarized Theme
let g:solarized_contrast="normal"
let g:solarized_visibility="high"
let g:solarized_hitrail=1
let g:solarized_termtrans=0
set background=dark

if has('gui_running')
  set guifont=Monoid:h9
  set go-=m
  set go-=T
  set go-=r
  let g:solarized_menu=0
endif

"set line no, buffer, search, highlight, autoindent and more.
set number              " Display line numbers.
set numberwidth=4       " Minimum number of columns to show for line numbers.
set hidden              " Keep changed buffers without requiring saves.
set ignorecase          " Ignore case for pattern matches (\C overrides).
set smartcase           " Override 'ignorecase' if pattern contains uppercase.
set nowrapscan          " Don't allow searches to wrap around EOF.
set incsearch           " Do incremental searching.
set hlsearch            " Highlight latest search pattern.

set noshowmatch         " Don't jump to matching characters
set matchpairs=(:),[:],{:},<:>  " Character pairs for use with %, 'showmatch'
set matchtime=1                 " In tenths of seconds, when showmatch is on

set autoindent          " Copy indent from current line for new line.
set nosmartindent       " 'smartindent' breaks right-shifting of # lines.
set ruler               " Always show the cursor position.
set visualbell t_vb=    " Use null visual bell (no beeps or flashes).
set viminfo+=n$VIM/_viminfo
set noerrorbells
set showcmd             " Display incomplete commands.
if has('mouse')
  set mouse=a
end
set nobackup
set history=1000        " Remember this many command lines.
set undolevels=1000
set virtualedit=block   " Allow virtual editing when in Visual Block mode.
set textwidth=0         " Don't auto-wrap lines except for specific filetypes.
set mouse=a             " Enable mouse support if it's available.
set expandtab           " Insert spaces for <Tab> press; use spaces to indent.
set smarttab            " Tab respects 'shiftwidth', 'tabstop', 'softtabstop'.
set tabstop=2           " Set the visible width of tabs.
set softtabstop=2       " Edit as if tabs are 2 characters wide.
set shiftwidth=2        " Number of spaces to use for indent and unindent.
set shiftround          " Round indent to a multiple of 'shiftwidth'.
set whichwrap+=<,>,[,]          " Left/right arrows can move across lines.
set backspace=indent,eol,start  " Backspace over everything in Insert mode.

set wildmenu                    " Use menu for completions
set wildmode=full

set nowrap
set scrolloff=3         " Context lines at top and bottom of display.
set sidescrolloff=5     " Context columns at left and right.
set sidescroll=1        " Number of chars to scroll when scrolling sideways.
set linebreak           " Wrap at 'breakat' char vs display edge if 'wrap' on.
set display=lastline    " Display as much of a window's last line as possible.
set splitright          " Split new vertical windows right of current window.
set splitbelow          " Split new horizontal windows under current window.
set winminheight=0      " Allow windows to shrink to status line.
set winminwidth=0       " Allow windows to shrink to vertical separator.

set nomodeline          " Ignore modelines.
set nojoinspaces        " Don't get fancy with the spaces when joining lines.

set nocursorcolumn      " Don't Highlight current screen column...
set cursorline          " Highlight the current screen line...
set colorcolumn=        " ...or margins (but see toggle_highlights.vim).

set foldcolumn=3        " Number of columns to show at left for folds.
set foldnestmax=3       " Only allow 3 levels of folding.
set foldlevelstart=99   " Start with all folds open.

set shortmess+=I        " Don't show the Vim welcome screen.

set nolist
set listchars =tab:>-           " Start and body of tabs
set listchars+=trail:.          " Trailing spaces
set listchars+=extends:>        " Last column when line extends off right
set listchars+=precedes:<       " First column when line extends off left
set listchars+=eol:$            " End of line


au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set omnifunc=syntaxcomplete#Complete

iabbrev <expr> _lipsum ''
    \ . 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
    \ . 'Praesent hendrerit tempus adipiscing. Nullam vitae nibh ut '
    \ . 'arcu volutpat porta. Ut tristique molestie mollis. In at erat '
    \ . 'a ante molestie molestie. Suspendisse varius arcu nec augue '
    \ . 'condimentum semper. Vestibulum malesuada pulvinar mi, '
    \ . 'fermentum elementum eros adipiscing dignissim. Vestibulum at '
    \ . 'odio risus. Ut ipsum erat, volutpat sed cursus nec, blandit '
    \ . 'ac diam. Integer tincidunt sollicitudin eros, sit amet '
    \ . 'vulputate justo sollicitudin malesuada. Nulla dapibus dictum '
    \ . 'dolor id semper. Phasellus pretium dapibus massa quis auctor. '

iabbrev _epg    magicmonty@pagansoft.de
iabbrev _egm    pagansoft@gmail.com
iabbrev _sig    Bye,<CR>Martin

runtime insert_matching_spaces.vim
runtime map_option_highlighting_keys.vim
runtime win32_mappings.vim
runtime map_line_block_mover_keys.vim

if has("win32")
  set grepprg=internal        " Windows findstr.exe just isn't good enough.

  " Remove the current directory from the backup directory list.
  set backupdir-=.

  " Save backup files in the current user's TEMP directory
  " (that is, whatever the TEMP environment variable is set to).
  set backupdir^=$TEMP

  " Put swap files in TEMP, too.
  set directory=$TEMP\\\\
endif

" Update the swap file every 20 characters. I don't like to lose stuff.
set updatecount=20

" Backspace in Visual mode deletes selection.
"
vnoremap <BS> d

" Control+S saves the current file (if it's been changed).
"
noremap  <C-S>  :update<CR>
vnoremap <C-S>  <C-C>:update<CR>
inoremap <C-S>  <C-O>:update<CR>

" Control+Z is Undo, in Normal and Insert mode.
"
noremap  <C-Z>  u
inoremap <C-Z>  <C-O>u

" F2 inserts the date and time at the cursor.
"
inoremap <F2>   <C-R>=strftime("%c")<CR>
nmap     <F2>   a<F2><Esc>

" Tab/Shift+Tab indent/unindent the highlighted block (and maintain the
" highlight after changing the indentation). Works for both Visual and Select
" modes.
"
vnoremap <Tab>    >gv
vnoremap <S-Tab>  <gv

" Disable paste-on-middle-click.
"
map  <MiddleMouse>    <Nop>
map  <2-MiddleMouse>  <Nop>
map  <3-MiddleMouse>  <Nop>
map  <4-MiddleMouse>  <Nop>
imap <MiddleMouse>    <Nop>
imap <2-MiddleMouse>  <Nop>
imap <3-MiddleMouse>  <Nop>
imap <4-MiddleMouse>  <Nop>

" Control+Hyphen (yes, I know it says underscore) repeats the character above
" the cursor.
"
inoremap <C-_>  <C-Y>

" AutoComplete with C-Space
" "
inoremap <C-space> <C-x><C-o>

" Center the display line after searches. (This makes it *much* easier to see
" the matched line.)
"
" More info: http://www.vim.org/tips/tip.php?tip_id=528
"
nnoremap n   nzz
nnoremap N   Nzz
nnoremap *   *zz
nnoremap #   #zz
nnoremap g*  g*zz
nnoremap g#  g#zz

" Draw lines of dashes or equal signs based on the length of the line
" immediately above.
"
"   k       Move up 1 line
"   yy      Yank whole line
"   p       Put line below current line
"   ^       Move to beginning of line
"   v$      Visually highlight to end of line
"   r-      Replace highlighted portion with dashes / equal signs
"   j       Move down one line
"   a       Return to Insert mode
"
" XXX: Convert this to a function and make the symbol a parameter.
" XXX: Consider making abbreviations/mappings for ---<CR> and ===<CR>
"
inoremap <C-U>- <Esc>kyyp^v$r-ja
inoremap <C-U>= <Esc>kyyp^v$r=ja

" Edit user's vimrc in new tabs.
"
nnoremap ,ev  :tabedit $MYVIMRC<CR>

" Make page-forward and page-backward work in insert mode.
"
inoremap <C-F>  <C-O><C-F>
inoremap <C-B>  <C-O><C-B>

" Make Option+Up/Down work as PageUp and PageDown
"
nnoremap    <M-Up>      <PageUp>
inoremap    <M-Up>      <PageUp>
vnoremap    <M-Up>      <PageUp>
nnoremap    <M-Down>    <PageDown>
inoremap    <M-Down>    <PageDown>
vnoremap    <M-Down>    <PageDown>

" Overload Control+L to clear the search highlight as it's redrawing the screen.
"
nnoremap <C-L>  :nohlsearch<CR><C-L>
inoremap <C-L>  <Esc>:nohlsearch<CR><C-L>a
vnoremap <C-L>  <Esc>:nohlsearch<CR><C-L>gv

" Toggle the NERD Tree window
"
nnoremap ,.  :NERDTreeToggle<CR>

" NERD Tree
"
let NERDChristmasTree=0
let NERDTreeHighlightCursorline=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeWinSize=40
let NERDTreeMouseMode=2 " single click for dirs, double for files
let NERDTreeQuitOnOpen=1 " close NERDTree after opening a file
let NERDTreeDirArrows=0
let NERDTreeChDirMode=2 " let NERDTree change the current dir

let g:plantuml_executable_script='plantuml'
nnoremap <F5> :w<CR> :silent make<CR>
inoremap <F5> <Esc>:w<CR>:silent make<CR>
vnoremap <F5> :<C-U>:w<CR>:silent make<CR>

" OmniSharp
" 
let g:OmniSharp_host = "http://localhost:2000" "This is the default value, setting it isn't actually necessary
let g:OmniSharp_selector_ui = 'ctrlp'  " Use ctrlp.vim

let g:OmniSharp_timeout = 1 "Timeout in seconds to wait for a response from the server
set completeopt=longest,menuone,preview
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
augroup END


set updatetime=500 " this setting controls how long to wait (in ms) before fetching type / symbol information.
set cmdheight=2 " Remove 'Press Enter to continue' message when type information is longer than one line.

nnoremap <leader><space> :OmniSharpGetCodeActions<cr> " Contextual code actions (requires CtrlP or unite.vim)
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr> " Run code actions with text selected in visual mode to extract method
nnoremap <leader>nm :OmniSharpRename<cr> " rename with dialog
nnoremap <F2> :OmniSharpRename<cr>

command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>") " rename without dialog - with cursor on the symbol to rename... ':Rename newname'

nnoremap <leader>rl :OmniSharpReloadSolution<cr> " Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>cf :OmniSharpCodeFormat<cr>

nnoremap <leader>tp :OmniSharpAddToProject<cr> " Load the current .cs file to the nearest project

" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>

nnoremap <leader>th :OmniSharpHighlightTypes<cr> " Add syntax highlighting for types and interfaces

set encoding=utf-8
set fileencoding=utf-8
let g:wakatime_PythonBinary = 'C:/Python27/python.exe'

" avoid the escape key
imap jk <Esc>

" XML
au FileType xml set omnifunc=xmlcomplete#CompleteTags noci
au FileType xml set foldnestmax=10
au FileType xml setlocal foldmethod=syntax
au FileType xml nmap <leader>f :%!xmllint --format -<CR>
au FileType html set omnifunc=htmlcomplete#CompleteTags noci
let g:xml_syntax_folding=1


