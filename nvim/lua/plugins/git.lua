-- plugins
vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
})

-- options
require("gitsigns").setup({
	current_line_blame = true,
})

-- keymaps
vim.keymap.set("n", "<leader>gm", ":Gitsigns diffthis main<cr>", { silent = true, desc = "Diff against main" })
