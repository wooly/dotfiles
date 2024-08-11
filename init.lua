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
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

vim.call('plug#end')

vim.cmd('source ~/.vim/core.vim')
vim.cmd('source ~/.vim/plugins.vim')
vim.cmd('source ~/.vim/mappings.vim')

vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Wa', 'wa', {})
vim.api.nvim_create_user_command('WA', 'wa', {})

require("mason").setup()

local cmp = require('cmp')
local luasnip = require('luasnip')
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = { completeopt = 'menu,menuone,noinsert' },

  -- For an understanding of why these mappings were
  -- chosen, you will need to read `:help ins-completion`
  --
  -- No, but seriously. Please read `:help ins-completion`, it is really good!
  mapping = cmp.mapping.preset.insert {
    -- Select the [n]ext item
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Select the [p]revious item
    ['<C-p>'] = cmp.mapping.select_prev_item(),

    -- Accept ([y]es) the completion.
    --  This will auto-import if your LSP supports it.
    --  This will expand snippets if the LSP sent a snippet.
    ['<C-y>'] = cmp.mapping.confirm { select = true },

    -- Manually trigger a completion from nvim-cmp.
    --  Generally you don't need this, because nvim-cmp will display
    --  completions whenever it has completion options available.
    ['<C-Space>'] = cmp.mapping.complete {},

    -- Think of <c-l> as moving to the right of your snippet expansion.
    --  So if you have a snippet that's like:
    --  function $name($args)
    --    $body
    --  end
    --
    -- <c-l> will move you to the right of each of the expansion locations.
    -- <c-h> is similar, except moving you backwards.
    ['<C-l>'] = cmp.mapping(function()
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { 'i', 's' }),
  ['<C-h>'] = cmp.mapping(function()
    if luasnip.locally_jumpable(-1) then
      luasnip.jump(-1)
    end
  end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  },
}


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local mason_lspconfig = require("mason-lspconfig")
local servers = {
  ruby_lsp = {},
}

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

-- mason_lspconfig.setup_handlers {
--   function(server_name)
--     require("lspconfig")[server_name].setup {
--       capabilities = capabilities,
--       on_attach = on_attach,
--       settings = servers[server_name],
--       filetypes = (servers[server_name] or {}).filetypes,
--     }
--   end
-- }
