-- loading lazy.nvim
require("config.lazy")

vim.cmd("colorscheme kanagawa")

-- setting keybidings
vim.g.mapleader = ' '
require('config.keymaps')

require('config.nvim-lspconfig')
require('config.editor')
require('config.indent-blankline')

vim.opt.clipboard = "unnamedplus"

require('config.nvim-cmp')
require('config.nvim-dap')

require('config.toggleterm')
