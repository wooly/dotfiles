call plug#begin('~/.vim/plugged')

" Language / syntax support.
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'dsawardekar/portkey' | Plug 'dsawardekar/ember.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'kchmck/vim-coffee-script'
Plug 'fatih/vim-go'
Plug 'groenewege/vim-less'
Plug 'elzr/vim-json'
Plug 'noprompt/vim-yardoc'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'ap/vim-css-color'
Plug 'ynkdir/vim-vimlparser' | Plug 'syngan/vim-vimlint'
Plug 'mutewinter/tomdoc.vim'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'apeschel/vim-syntax-syslog-ng'
Plug 'klen/python-mode'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'janko-m/vim-test'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'henrik/rename.vim'
Plug 'benekastah/neomake'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'epilande/vim-react-snippets'
Plug 'Valloric/YouCompleteMe'
Plug 'dyng/auto_mkdir'
Plug 'chriskempson/base16-vim'

call plug#end()

source ~/.vim/core.vim
source ~/.vim/plugins.vim
source ~/.vim/mappings.vim

" Strip Trailing Whitespace
function! StripTrailingWhitespace()
    if !&binary && &modifiable && &filetype != 'diff'
        let l:winview = winsaveview()
        %s/\s\+$//e
        let @/=''
        call winrestview(l:winview)
    endif
endfunction
nnoremap <leader>W :call StripTrailingWhitespace()<CR>

command! W  :w                                " Seriously, it's not like :W is bound
command! Wa :wa
command! WA :wa
