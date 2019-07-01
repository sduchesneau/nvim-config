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
"NeoBundle 'wincent/command-t' "needs ruby
NeoBundle 'arkwright/vim-whiplash.git' "old crappy project
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
NeoBundle 'mileszs/ack.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'leafgarland/typescript-vim'

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

command Jsnf %!jsonnet fmt -
let mapleader = " "

let g:WhiplashProjectsDir = "~/repos/"
let g:WhiplashCommandName = "Repo"
let g:WhiplashConfigDir = "~/.config/nvim/whiplash/"

"set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
"let g:airline#extensions#tabline#enabled = 1
set wildmode=longest:full,full " complete tab like bash
