"din Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/sudeep/.nvim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/sudeep/.nvim')
  call dein#begin('/Users/sudeep/.nvim')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/sudeep/.nvim/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  " provide Nerdree and currently <leader>-t toggle it and  <leader>-f find
  " current file , m on Nerdtree tab is awesome
  call dein#add('scrooloose/nerdtree')
  "A light and configurable statusline/tabline plugin for Vim
  call dein#add('itchyny/lightline.vim')
  " set of usefull mappings from tpope
  call dein#add('tpope/vim-unimpaired')
  "Provide Gbrowse to fugitive
  call dein#add('tpope/vim-rhubarb')
  "jump between hunks ]c and more
  call dein#add('airblade/vim-gitgutter')

  "fzf finder <CTRL-p> <CTRL-n> use vim $(fzf -m) and tab for multiselect
  " ./install --all so the interactive script doesn't block
" you can check the other command line options  in the install file
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
 "this is my snippet engine
  call dein#add('SirVer/ultisnips')
  "this provide the snippets
  call dein#add('honza/vim-snippets')
  call dein#add('juliosueiras/vim-terraform-completion')
  call dein#add('vim-airline/vim-airline')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-dadbod')
  call dein#add('tpope/vim-abolish')
  call dein#add('gcmt/taboo.vim')
  call dein#add('tpope/vim-rails')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('tpope/vim-commentary')
  call dein#add('dense-analysis/ale')
  call dein#add('preservim/nerdtree')
  call dein#add('kassio/neoterm')
  call dein#add('tpope/vim-dispatch')
  call dein#add('vimwiki/vimwiki')
  call dein#add('keith/swift.vim')
  call dein#add('dhruvasagar/vim-table-mode')
  call dein#add('plasticboy/vim-markdown')
  "This would provide support for ctags
  call dein#add('tpope/vim-bundler')
  call dein#add('sjl/vitality.vim')
  call dein#add('elzr/vim-json')
  call dein#add('chrisbra/csv.vim')
  call dein#add('hashivim/vim-terraform')
  " Required:
  call dein#end()
  call dein#save_state()
endif
" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
set rtp+=/usr/local/opt/fzf

set shiftwidth=2
set tabstop=2
set expandtab
hi Search ctermbg=Red
set number
nnoremap <C-p> :<C-u>Rg<CR>
"Set leader
let mapleader=","

nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>f  :NERDTreeFind<CR>

"edit vimrc
nnoremap  <leader>ev :vsplit $MYVIMRC <cr>
"source vimrc
nnoremap <leader>sv :source $MYVIMRC <cr>

" double quote current word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" ' single quote current word
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" visual
vnoremap <leader>" <esc>`<<esc>i"<esc>`>la"<esc>
"
" MAPPING esc
 inoremap jk <esc>

 " move out of terminal mode to normal
 tnoremap <C-Esc> <C-\><C-n>
 "REMAP esc to nop
"inoremap <esc> <NOP>
"
"
"
"
"
"
"
"http://signal0.com/2012/07/24/vim_crosshairs.html

  "hi CursorLine   cterm=NONE ctermbg=235
  "hi CursorColumn cterm=NONE ctermbg=235
  "set cursorline! cursorcolumn!
  "nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
augroup CursorLine
    au!
    hi CursorLine   cterm=NONE ctermbg=238
    hi CursorColumn cterm=NONE ctermbg=235
  " set cursorline! cursorcolumn!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
    au WinLeave * setlocal nocursorline
augroup END

  if exists('$TMUX')
  let &t_SI = "\ePtmux;\e\e[5 q\e\\"
  let &t_EI = "\ePtmux;\e\e[2 q\e\\"
else
  let &t_SI = "\e[5 q"
  let &t_EI = "\e[2 q"
endif

" Change cursor shape between insert and normal mode in iTerm2.app
"if $TERM_PROGRAM =~ "iTerm.app"
"    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
"    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
"endif

"Ale Config
let g:ale_completion_enable = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop'],
\}
let g:ale_linters = {
\ '*': ['rubocop', 'prettier', 'trim_whitespace'],
\ 'javascript': ['eslint'],
\ 'swift': ['swiftlint'],
\ }
highlight ALEWarning ctermbg=227
"highlight ALEWarning ctermbg=none cterm=underline

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
set relativenumber


" This is for snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-tav>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
nnoremap <leader>ue :UltiSnipsEdit<cr>

inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"

nnoremap cp :let @+=expand("%:p")<cr>
nnoremap erc :e $MYVIMRC <cr>

"Language client
" Required for operations modifying multiple buffers like rename.
set hidden


let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Vertical panes seperator and background
set fillchars+=vert:│
hi VertSplit cterm=NONE
" Fuzzy file finder
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" fzf Rg current word Rg current word
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

" fzf popup window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Border color
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo' } }

" Border style (rounded / sharp / horizontal)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo', 'border': 'sharp' } }


