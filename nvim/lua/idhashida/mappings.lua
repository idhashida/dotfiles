local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Buffers -------------------------------------------------------------------
map("n", "<Leader>j", "<C-w>j", opts) -- Вниз
map("n", "<Leader>k", "<C-w>k", opts) -- Вверх
map("n", "<Leader>l", "<C-w>l", opts) -- Вправо
map("n", "<Leader>h", "<C-w>h", opts) -- Влево

-- Window Management ---------------------------------------------------------
map("n", "<Leader>sv", ":vsplit<CR>", opts) -- split vertically
map("n", "<Leader>sh", ":split<CR>", opts) -- split horizontally

-- Indenting -----------------------------------------------------------------
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- nvim-tree -----------------------------------------------------------------
map("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- bufferline ----------------------------------------------------------------
map("n", "<Leader>bp", ":BufferLinePick<CR>", opts)       -- Выбрать буфер
map("n", "<Leader>bn", ":BufferLineCycleNext<CR>", opts)  -- Следующий буфер
map("n", "<Leader>bb", ":BufferLineCyclePrev<CR>", opts)  -- Предыдущий буфер
