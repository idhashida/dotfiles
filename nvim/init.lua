-- Globals ------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Lazy ----------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Mappings ------------------------------------------------------------------
require("idhashida.mappings")

local opts = {
	defaults = {
		lazy = true,
	},
	install = {
		colorscheme = { "nightfox" },
	},
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
	},
	change_detection = {
		notify = false,
	},
}

require("lazy").setup("idhashida.plugins", opts)

local opt = vim.opt

-- Settings ------------------------------------------------------------------
opt.mouse:append("a")
opt.spell = false
opt.wrap = false
opt.hidden = true
opt.errorbells = false
opt.encoding = "utf-8"
opt.clipboard:append("unnamedplus")
opt.swapfile = false
opt.history = 5000
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.termguicolors = true
opt.colorcolumn = "80"
opt.updatetime = 100
opt.laststatus = 2
opt.lazyredraw = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.modifiable = true

-- Appearance ----------------------------------------------------------------
opt.number = true
opt.cursorline = true
opt.scrolloff = 5
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.completeopt = "menuone,noinsert,noselect"

-- search settings -----------------------------------------------------------
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- tab settings --------------------------------------------------------------
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.cindent = true

-- split settings ------------------------------------------------------------
opt.splitbelow = true
opt.splitright = true
