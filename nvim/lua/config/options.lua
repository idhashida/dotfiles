require("vim._core.ui2").enable({})

vim.g.mapleader = " " -- space leader key

-- Basic Settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.sidescroll = 8
vim.o.wrap = false
vim.o.cmdheight = 0
vim.o.spelllang = "en"

-- Visual settings
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.showmatch = true
vim.o.matchtime = 2
vim.o.completeopt = "menu,menuone,noselect,preview"
vim.o.laststatus = 3
vim.o.pumheight = 10
vim.o.pumblend = 10
vim.o.winblend = 0
vim.o.conceallevel = 0
vim.o.concealcursor = ""
vim.o.synmaxcol = 300
vim.o.winborder = "rounded"
vim.o.showmode = false
vim.o.list = true
vim.diagnostic.config({
	virtual_text = false,
	underline = true,
})

-- File handling
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.updatetime = 200
vim.o.timeoutlen = 500
vim.o.ttimeoutlen = 0
vim.o.autoread = true
vim.o.autowrite = false
vim.opt.diffopt:append("vertical")
vim.opt.diffopt:append("algorithm:patience")
vim.opt.diffopt:append("linematch:60")

-- Set undo directory and ensure it exists
local undodir = "~/.local/share/nvim/undodir"
vim.opt.undodir = vim.fn.expand(undodir)
local undodir_path = vim.fn.expand(undodir)
if vim.fn.isdirectory(undodir_path) == 0 then
	vim.fn.mkdir(undodir_path, "p")
end

-- Search settings
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = false

-- Indentation & Tabbing
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.cindent = true
vim.o.breakindent = true
vim.o.grepprg = "rg --vimgrep"
vim.o.grepformat = "%f:%l:%c:%m"

-- Behavior settings
vim.o.encoding = "UTF-8"
vim.o.hidden = true
vim.o.errorbells = false
vim.o.backspace = "indent,eol,start"
vim.o.autochdir = false
vim.opt.iskeyword:append("-")
vim.opt.isfname:append("@-@")
vim.opt.path:append("**")
vim.o.selection = "inclusive"
vim.o.mouse = ""
vim.o.modifiable = true
vim.o.wildmenu = true
vim.o.wildmode = "longest:full,full"
vim.opt.wildignorecase = true

-- Folding Settings
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevel = 99

-- Split Behavior
vim.o.splitbelow = true
vim.o.splitright = true
