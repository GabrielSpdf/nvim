-- options.lua
vim.o.number = true
vim.o.relativenumber = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.mouse = 'a'
vim.o.ignorecase = true
vim.o.termguicolors = true
vim.opt.termguicolors = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- vim.opt.laststatus = 0

vim.g.NERDTreeDirArrowExpandable = "+"
vim.g.NERDTreeDirArrowCollapsible = "~"

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
