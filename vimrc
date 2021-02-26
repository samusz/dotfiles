"" from https://github.com/joereddington/dotvimdirectory/blob/master/vimrc at firt, modified then on
call plug#begin('~/.vim/bundle')
Plug 'JuliaEditorSupport/julia-vim'
Plug 'dpelle/vim-Grammalecte'
set nocompatible "doens't try and do what VI does
filetype on
filetype plugin on
syntax on
set lines=35 columns=90 "check these for full screen
set backspace=indent,eol,start "make backspace work properly per https://vi.stackexchange.com/a/2163/8792
set number

set hidden
set thesaurus=~/.vim/mthesaur.txt
set dictionary=~/.vim/roget13a.txt
set history=500
set hlsearch "highlight search
set showmatch "When a bracket is inserted, breifly jump to the matching one.
set ignorecase smartcase  "setting up search
set spell "Add spell checking
hi clear SpellBad "clear the highlighing for badly spelled words
hi SpellBad cterm=underline "set the highlighintg for badly spelt words
let g:CommandTMaxFiles=300000

"My subsitutions
inoremap jk <esc>
inoremap fd <esc>
inoremap <caps-lock> <esc>
set t_BE=
"set t_BE= is there to stop the "[200" issue
" For log files
iabbrev lnn <C-R>=strftime('## %d/%m/%y %H:%M')<C-M>
map lnu :s/\(^.\{12}\d\d:\d\d\).*,/\1 to =strftime('%H:%M'),/g
iabbrev SAS <C-R>=strftime('- %d/%m/%y smallest next step: ')<C-M>
map _ a̶jk<space>

set wildmenu

"From the paste and copy image vim plugin
autocmd FileType markdown nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'


"Macros recorded
let @q = 'A date:date	jk0j'

"Notes for system setup:
"defaults write com.apple.screencapture location /Users/joereddingtonfileless/Downloads/ is how you change the screenshot directory.
"

" from [200~https://vi.stackexchange.com/a/14297/8792[201~
if expand('%:t') == 'todo.txt'
  set nowrap
endif
if expand('%:t') == 'eqt.todo.txt'
  set nowrap
endif

" It would be good to wrap the autocommands in groups as per
" http://learnvimscriptthehardway.stevelosh.com/chapters/14.html

"from
"https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
"These should improve autocomplete
"The first step to "improve" the menu behavior is to execute this command:
"
set completeopt=longest,menuone
"
"The above command will change the 'completeopt' option so that Vim's popup
"menu doesn't select the first completion item, but rather just inserts the
"longest common text of all matches; and the menu will come up even if there's
"only one match. (The longest setting is responsible for the former effect and
"the menuone is responsible for the latter.)
"
"The next enhancement is the following mapping:
"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
"The above mapping will change the behavior of the <Enter> key when the popup
"menu is visible. In that case the Enter key will simply select the
"highlighted menu item, just as <C-Y> does.
"
"These two mappings further improve the completion popup menu:
"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"In the above mappings, the first will make <C-N> work the way it normally
"does; however, when the menu appears, the <Down> key will be simulated. What
"this accomplishes is it keeps a menu item always highlighted. This way you
"can keep typing characters to narrow the matches, and the nearest match will
"be selected so that you can hit Enter at any time to insert it. In the above
"mappings, the second one is a little more exotic: it simulates <C-X><C-O> to
"bring up the omni completion menu, then it simulates <C-N><C-P> to remove the
"longest common text, and finally it simulates <Down> again to keep a match
"highlighted.

"strikeout"

"NOw Joe's own bit of autocomplete
"set complete=.,w,b,u,t,i,k

"To make the watcher work
"autocmd BufWritePost log.md !echo "target=$(date +\%s)" > ~/flow.joereddington.com/todo.txt/submodules/watcher/lastwrite.js


"Showcommand
"set showcmd
