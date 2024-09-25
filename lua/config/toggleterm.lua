-- toggleterm.lua
require("toggleterm").setup{
	  size = 10,
	  open_mapping = [[<c-\>]],
	  shade_terminals = true,
	  direction = "horizontal",
	  close_on_exit = true,
	  shell = "zsh"
}

vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
