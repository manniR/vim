call pathogen#infect()
call pathogen#helptags()  

"set guifont=Inconsolata:h20
set guifont=UbuntuMono-Regular:h22
"set nocompatible
filetype on
filetype plugin indent on 
syntax on

colo vydark

set tabstop=3
set shiftwidth=3
set number
set wildmode=list:longest
set smartindent
set autoindent
set fileencoding=utf8
set encoding=utf-8
set linespace=6
set splitbelow
set backspace=indent,eol,start
set ts=2 sts=2 sw=2 expandtab
set linebreak
set scrolloff=1
set hlsearch
set foldenable
"set wrap
set nowrap

" use php html javascript snippets in one file
"au BufRead,BufNewFile *.php set ft=php.html.javascript
"au BufRead,BufNewFile *.html set ft=php.html.javascript
"au BufRead,BufNewFile *.css set ft=css
"au BufRead,BufNewFile *.javascript set ft=php.html.javascript


"Shortcut for editing my vimrc file
nmap ,ev :tabedit $MYVIMRC<cr>

map <leader> <Plug>(easymotion-prefix)

imap ,e <esc>

let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.

imap yy <C-y>,

"go to item under cursor
nnoremap ü <C-]>
nnoremap Ü <C-O>

nmap <space> :

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
"split line at cursor Ctlr+c
"imap <C-c> <CR><Esc>O

"clear search pattern
":command C let @/=""

"hide scrollbars
set guioptions-=r "scrollbar right
set guioptions-=L "scrollbar left

"navigate autocomplete popup list with j+k key
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

function! InsertTabWrapper()
      let col = col(".") - 1
      if !col || getline(".")[col - 1] !~ '\k'
        return "\<tab>"
      else
        return "\<c-n>"
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <D-Space> <c-n>
"inoremap <s-tab> <c-p>
imap <c-j> <Plug>snipMateNextOrTrigger
smap <c-j> <Plug>snipMateNextOrTrigger



nmap <D-d> <ESC>yyp

"Source .vimrc on saving
if has("autocmd")
autocmd bufwritepost .vimrc source $MYVIMRC
endif
if exists('*HexHighlight()')
  map <C-h> :call HexHighlight()<Return>
endif

map ,b bv/[A-Z]<cr>h

"Nerdtree
map <C-n>, :NERDTreeToggle<CR>

