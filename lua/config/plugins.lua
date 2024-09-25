-- plugins.lua
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "main",      -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				-- dim_inactive_windows = false,
				-- extend_background_behind_borders = true,
				bold_vert_split = false,
				dim_nc_background = false,
				disable_background = false,
				disable_float_background = false,
				disable_italics = false,

				enable = {
				  terminal = true,
				  legacy_highlights = true,
				  migrations = true,
				},


				groups = {
				  border = "muted",
				  link = "iris",
				  panel = "surface",

				  error = "love",
				  hint = "iris",
				  info = "foam",
				  note = "pine",
				  todo = "rose",
				  warn = "gold",

				  git_add = "foam",
				  git_change = "rose",
				  git_delete = "love",
				  git_dirty = "rose",
				  git_ignore = "muted",
				  git_merge = "iris",
				  git_rename = "pine",
				  git_stage = "iris",
				  git_text = "rose",
				  git_untracked = "subtle",

				  h1 = "iris",
				  h2 = "foam",
				  h3 = "rose",
				  h4 = "gold",
				  h5 = "pine",
				  h6 = "foam",
				},

				before_highlight = function(group, highlight, palette)
				end,
			  })
			vim.cmd("colorscheme rose-pine")
		end,
	})
	use 'tpope/vim-surround'
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
	use 'lewis6991/gitsigns.nvim'     
	use 'romgrk/barbar.nvim'
	use 'neovim/nvim-lspconfig'
	use {
		"akinsho/toggleterm.nvim", 
		tag = '*', 
		-- config = function()
	}
end)
