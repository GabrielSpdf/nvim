-- plugins.lua
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- use({
	-- 	"rose-pine/neovim",
	-- 	as = "rose-pine",
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			variant = "main",      -- auto, main, moon, or dawn
	-- 			dark_variant = "main", -- main, moon, or dawn
	-- 			-- dim_inactive_windows = false,
	-- 			-- extend_background_behind_borders = true,
	-- 			bold_vert_split = false,
	-- 			dim_nc_background = false,
	-- 			disable_background = false,
	-- 			disable_float_background = false,
	-- 			disable_italics = false,

	-- 			enable = {
	-- 			  terminal = true,
	-- 			  legacy_highlights = true,
	-- 			  migrations = true,
	-- 			},


	-- 			groups = {
	-- 			  border = "muted",
	-- 			  link = "iris",
	-- 			  panel = "surface",

	-- 			  error = "love",
	-- 			  hint = "iris",
	-- 			  info = "foam",
	-- 			  note = "pine",
	-- 			  todo = "rose",
	-- 			  warn = "gold",

	-- 			  git_add = "foam",
	-- 			  git_change = "rose",
	-- 			  git_delete = "love",
	-- 			  git_dirty = "rose",
	-- 			  git_ignore = "muted",
	-- 			  git_merge = "iris",
	-- 			  git_rename = "pine",
	-- 			  git_stage = "iris",
	-- 			  git_text = "rose",
	-- 			  git_untracked = "subtle",

	-- 			  h1 = "iris",
	-- 			  h2 = "foam",
	-- 			  h3 = "rose",
	-- 			  h4 = "gold",
	-- 			  h5 = "pine",
	-- 			  h6 = "foam",
	-- 			},

	-- 			before_highlight = function(group, highlight, palette)
	-- 			end,
	-- 		  })
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- })
	use 'tpope/vim-surround'
	use 'tpope/vim-fugitive'
	use 'preservim/nerdtree'
	use 'tpope/vim-commentary'
	use 'vim-airline/vim-airline'
	use 'ap/vim-css-color'
	use 'rafi/awesome-vim-colorschemes'
	use 'ryanoasis/vim-devicons'
	use 'preservim/tagbar'
	use 'windwp/nvim-autopairs'
	use 'hrsh7th/nvim-cmp'      
	use 'hrsh7th/cmp-nvim-lsp'   
	use 'hrsh7th/cmp-buffer'     
	use 'hrsh7th/cmp-path'       
	use 'hrsh7th/cmp-cmdline'    
	use 'L3MON4D3/LuaSnip'       
	use 'saadparwaiz1/cmp_luasnip' 
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		requires = { 'nvim-lua/plenary.nvim' }
	}
	use 'nvim-tree/nvim-web-devicons' 
    use {
         'lewis6991/gitsigns.nvim',
         config = function()
             require('gitsigns').setup {
                 signs = {
                     add          = { text = '+' },
                     change       = { text = '│' },
                     delete       = { text = '-' },
                     topdelete    = { text = '‾' },
                     changedelete = { text = '~' },
                 },
                signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
 				numhl = true,
 				on_attach = function(bufnr)
 					local gs = package.loaded.gitsigns
 				
 					local function map(mode, l, r, opts)
 					  opts = opts or {}
 					  opts.silent = opts.silent ~= false
 					  vim.keymap.set(mode, l, r, opts)
 					end

 					map('n', ']c', function()
 					  if vim.wo.diff then return ']c' end
 					  vim.schedule(function() gs.next_hunk() end)
 					  return '<Ignore>'
 					end, {expr=true})

 					map('n', '[c', function()
 					  if vim.wo.diff then return '[c' end
 					  vim.schedule(function() gs.prev_hunk() end)
 					  return '<Ignore>'
 					end, {expr=true})
 				end,
                 current_line_blame_opts = {
                     virt_text = true,
                     virt_text_pos = 'eol',
                     delay = 500,
 					virt_text_prefix = '  ',
                 },
                 watch_gitdir = {
                     interval = 1000,
                     follow_files = true
                 },
                 
                 preview_config = {
                   border = "rounded",
                 }
             }
         end
     }

	use 'romgrk/barbar.nvim'
	use 'neovim/nvim-lspconfig'
	use 'rebelot/kanagawa.nvim'
	use 'marko-cerovac/material.nvim'
	use 'aktersnurra/no-clown-fiesta.nvim'
	use {
		"akinsho/toggleterm.nvim", 
		tag = '*', 
		-- config = function()
	}
   -- use {
   --    "folke/noice.nvim",
   --    requires = {
   --      "MunifTanjim/nui.nvim",
   --    }
   --  }
	-- require("noice").setup({
	   -- lsp = {
		   -- override = {
		   -- ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
		   -- ["vim.lsp.util.stylize_markdown"] = true,
			-- ["cmp.entry.get_documentation"] = true,
		   -- }
	   -- },
	  
	   -- -- you can enable a preset for easier configuration
	   -- presets = {
		   -- bottom_search = true, -- use a classic bottom cmdline for search
		   -- command_palette = true, -- position command palette in the center
		   -- long_message_to_split = true, -- long messages will be sent to a split
	   -- },
	   -- -- set up a pretty border for the popup windows
	   -- popupmenu = {
		   -- backend = "nui",
		   -- border = "rounded",
	   -- },
	-- })
	require'barbar'.setup {
		animation = true,
		auto_hide = false,
		tabpages = true,
		clickable = true,
	}
	vim.cmd("colorscheme material-deep-ocean")
end)
