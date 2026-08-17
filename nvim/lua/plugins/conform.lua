-- plugins
vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

-- options
require("conform").setup({
	format_on_save = {
		timeout_ms = 8000,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports", "gofmt" },
	},
})
