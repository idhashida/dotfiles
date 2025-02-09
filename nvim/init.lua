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

local opts = {
  defaults = {
    lazy = true
  },
  install = {
    colorscheme = {"gruvbox"}
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
      "zipPlugin"
    }
  },
  change_detection = {
    notify = true
  },
}

require("lazy").setup("idhashida.plugins", opts)



local opt = vim.opt

-- Mappings ------------------------------------------------------------------
require("idhashida.mappings")

-- Settings ------------------------------------------------------------------
opt.mouse:append("a")
opt.spell = false
opt.wrap = false
opt.hidden = true
opt.errorbells = false
opt.encoding = 'utf-8'
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

-- theme ---------------------------------------------------------------------
opt.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- tab settings --------------------------------------------------------------
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.cindent = true

-- split settings ------------------------------------------------------------
opt.splitbelow = true
opt.splitright = true

-- bufferline ----------------------------------------------------------------
require("bufferline").setup {
    options = {
        numbers = "none", -- Показывать или нет номера буферов
        close_command = "bdelete! %d", -- Команда для закрытия буфера
        right_mouse_command = "bdelete! %d", -- Закрытие буфера правой кнопкой
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        diagnostics = "nvim_lsp", -- Включить LSP диагностику
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = true,
            },
        },
        show_buffer_close_icons = true,
        show_close_icon = false,
        separator_style = "slant", -- Стиль разделителей
    },
}
