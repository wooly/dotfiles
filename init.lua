local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rhubarb'
Plug 'dsawardekar/portkey'
Plug 'elzr/vim-json'
Plug 'noprompt/vim-yardoc'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'ap/vim-css-color'
Plug 'ynkdir/vim-vimlparser'
Plug 'syngan/vim-vimlint'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'apeschel/vim-syntax-syslog-ng'
Plug('prettier/vim-prettier', {['do'] = vim.fn['yarn install']})
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install'] })
Plug 'junegunn/fzf.vim'
Plug 'vim-test/vim-test'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'henrik/rename.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dyng/auto_mkdir'
Plug 'chriskempson/base16-vim'
Plug 'jxnblk/vim-mdx-js'
Plug('fatih/vim-go', {['do'] = vim.fn[':GoUpdateBinaries'] })
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

vim.call('plug#end')

vim.cmd('source ~/.vim/core.vim')
vim.cmd('source ~/.vim/plugins.vim')
vim.cmd('source ~/.vim/mappings.vim')

vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Wa', 'wa', {})
vim.api.nvim_create_user_command('WA', 'wa', {})
