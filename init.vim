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
NeoBundle 'google/vim-jsonnet'
NeoBundle 'sebdah/vim-delve'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'hashivim/vim-terraform'
NeoBundle 'vim-syntastic/syntastic'
NeoBundle 'juliosueiras/vim-terraform-completion'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'juliosueiras/vim-terraform-completion'
"NeoBundle 'mhartington/oceanic-next'
NeoBundle 'fatih/vim-go'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'zchee/deoplete-go', {'build': {'unix': 'make'}}
NeoBundle 'baverman/vial'
NeoBundle 'baverman/vial-http'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Quramy/tsuquyomi'
NeoBundle 'xuyuanp/nerdtree-git-plugin'
NeoBundle 'airblade/vim-gitgutter'
"NeoBundle 'vim-airline/vim-airline'

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
map gr :GoReferrers<CR>
map gi :GoImplements<CR>

if executable('pt')
  let g:ackprg = 'pt'
endif

"if (has("termguicolors"))
" set termguicolors
"endif

"colorscheme molokai
colorscheme monokai-phoenix
"let g:airline_theme='oceanicnext'

"let g:go_highlight_operators = 1
"let g:go_highlight_function_calls = 1
let g:go_gocode_propose_source = 1
let g:go_def_mode = 'godef'

highlight ExtraWhitespace ctermbg=darkblue guibg=darkblue
match ExtraWhitespace /\s\+$\|\t$/
set listchars=tab:>\ ,trail:-,eol:$,space:·
highlight Normal ctermbg=NONE

let loaded_matchparen = 1
let g:deoplete#enable_at_startup = 1
set foldmethod=syntax
set foldlevelstart=20

"map <C-m> :set invnumber<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|\.git|\.hg|\.svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
tnoremap <Esc> <C-\><C-n>
 let g:jsonnet_fmt_on_save = 1

" wrap long lines in quickfix
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END
