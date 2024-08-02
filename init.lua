-- Configurações gerais
vim.o.number = true
vim.o.relativenumber = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.mouse = 'a'
vim.o.ignorecase = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Inicialização do Packer e configuração dos plugins
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-surround'
    use 'preservim/nerdtree'
    use 'tpope/vim-commentary'
    use 'vim-airline/vim-airline'
    use 'ap/vim-css-color'
    use 'rafi/awesome-vim-colorschemes'
    use 'ryanoasis/vim-devicons'
    use 'tc50cal/vim-terminal'
    use 'terryma/vim-multiple-cursors'
    use 'preservim/tagbar'
    use 'windwp/nvim-autopairs'
    use 'hrsh7th/nvim-cmp'       -- Plugin de autocompletar
    use 'hrsh7th/cmp-nvim-lsp'   -- Fonte de LSP para nvim-cmp
    use 'hrsh7th/cmp-buffer'     -- Fonte de buffer para nvim-cmp
    use 'hrsh7th/cmp-path'       -- Fonte de caminho de arquivos para nvim-cmp
    use 'hrsh7th/cmp-cmdline'    -- Fonte de linha de comando para nvim-cmp
    use 'L3MON4D3/LuaSnip'       -- Suporte a snippets
    use 'saadparwaiz1/cmp_luasnip' -- Fonte de snippets para nvim-cmp
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use 'nvim-tree/nvim-web-devicons' -- Ícones para arquivos
    use 'lewis6991/gitsigns.nvim'     -- Status do Git
    use 'romgrk/barbar.nvim'
    use 'neovim/nvim-lspconfig'
end)

-- Configurações de plugins

-- Configuração do NERDTree
vim.g.NERDTreeDirArrowExpandable = "+"
vim.g.NERDTreeDirArrowCollapsible = "~"

-- Configuração do vim-airline
vim.g.airline_powerline_fonts = 1
vim.g.airline_symbols = {
    branch = '',
    readonly = '',
    linenr = '',
    left_sep = '',
    left_alt_sep = '',
    right_sep = '',
    right_alt_sep = '',
}

-- Configuração do LSP
local lspconfig = require('lspconfig')
lspconfig.pyright.setup{}
lspconfig.clangd.setup{}

-- Configuração do nvim-autopairs
require('nvim-autopairs').setup{}

-- Configuração do nvim-cmp
local cmp = require'cmp'
local luasnip = require'luasnip'

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirmar seleção com Enter
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Integração do nvim-autopairs com nvim-cmp para completar `()`
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

-- Mapeamentos de teclas
vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFocus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTree<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-c>', ':close<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-v>', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true })

-- Mapeamentos de teclas para navegar entre os buffers
vim.api.nvim_set_keymap('n', '<Tab>', ':BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-q>', ':w<CR>:BufferClose<CR>', { noremap = true, silent = true })

-- Configuração do esquema de cores
vim.cmd('colorscheme minimalist')

