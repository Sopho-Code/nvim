-- Basic configurations
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.cursorline = true


-- tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true


vim.opt.wrap = false

-- backup
vim.opt.swapfile = false
vim.opt.backup = false

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true

--colors
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
require'colorizer'.setup()

-- scroll
vim.opt.scrolloff = 5
vim.opt.signcolumn = "auto"

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- mouse event
vim.opt.mousemoveevent = true

-- Colorscheme
require('onedark').load()
