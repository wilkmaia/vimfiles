-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = ','
vim.g.maplocalleader = '\\'

local DEFAULT_TAB_SIZE = 2
vim.opt.tabstop = DEFAULT_TAB_SIZE
vim.opt.softtabstop = DEFAULT_TAB_SIZE
vim.opt.shiftwidth = DEFAULT_TAB_SIZE
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

-- vim.opt.hlsearch = false -- Not sure how I feel about this
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

vim.opt.updatetime = 50

vim.opt.colorcolumn = '120'

vim.opt.cdpath = {
  '.',
  vim.fn.expand('~/.config/nvim'),
  vim.fn.expand('~/.config/nvim/lua/wim')
}
