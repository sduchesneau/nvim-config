if has('vim_starting')
  " Required:
  set runtimepath+=/home/stepd/.config/nvim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/stepd/.config/nvim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'tomlion/vim-solidity'
NeoBundle 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
NeoBundle 'bitfield/vim-gitgo'
NeoBundle 'dense-analysis/ale'
NeoBundle 'mrk21/yaml-vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'fatih/vim-go'
NeoBundle 'google/vim-jsonnet'
NeoBundle 'sebdah/vim-delve'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'hashivim/vim-terraform'
NeoBundle 'vim-syntastic/syntastic' "for terraform...
NeoBundle 'juliosueiras/vim-terraform-completion'
" NeoBundle 'mileszs/ack.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'wannesm/wmgraphviz.vim'
" NeoBundle 'SirVer/ultisnips'
NeoBundle 'jparise/vim-graphql'
NeoBundle 'prettier/vim-prettier', { 'do': 'yarn install' }
NeoBundle 'nazo/pt.vim'

NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'
NeoBundle 'tomtom/tlib_vim.git'
NeoBundle 'MarcWeber/vim-addon-mw-utils.git'


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Quramy/tsuquyomi' "typescript
NeoBundle 'airblade/vim-gitgutter'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

syntax on
filetype plugin indent on

set laststatus=2
set expandtab
set tabstop=4
set nu
let g:go_fmt_command = "goimports"
filetype plugin on
"set omnifunc=syntaxcomplete#Complete

map <C-u> :only<CR>
map <C-n> :NERDTreeToggle<CR>
"map <C-m> :NERDTreeFind<CR>
map <C-l> :set invnumber<CR>
"map <C-a> :CtrlSFToggle<CR>
map ; :GoInfo<CR>
"map gr :GoReferrers<CR>
map gi :GoImplements<CR>

if executable('pt')
  let g:ackprg = 'pt'
endif

"colorscheme industry
colorscheme elflord

let g:go_def_mode = 'godef'
let g:go_highlight_operators = 1
let g:go_highlight_function_calls = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 0 " méthodes
let g:go_highlight_function_parameters = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']

highlight ExtraWhitespace ctermbg=darkblue guibg=darkblue
match ExtraWhitespace /\s\+$\|\t$/
set listchars=tab:>\ ,trail:-,eol:$,space:·
highlight Normal ctermbg=NONE

let loaded_matchparen = 1
set foldmethod=syntax
set foldlevelstart=20

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|\.git|\.hg|\.svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
tnoremap <Esc> <C-\><C-n>

" wrap long lines in quickfix
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END

let mapleader = " "

let g:WhiplashProjectsDir = "~/repos/"
let g:WhiplashCommandName = "Repo"
let g:WhiplashConfigDir = "~/.config/nvim/whiplash/"

"set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
"let g:airline#extensions#tabline#enabled = 1
set wildmode=longest:full,full " complete tab like bash

let g:airline_powerline_fonts = 1
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
"
"" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''


" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <C-TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

let NERDTreeQuitOnOpen = 0
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
