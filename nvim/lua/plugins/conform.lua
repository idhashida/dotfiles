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
		json = { "prettierd" },
		sql = { "sql_formatter" },
	},
	formatters = {
		sql_formatter = {
			prepend_args = { "--language", "postgresql" },
		},
		prettierd = {
			condition = function(_, ctx)
				return vim.fs.root(ctx.filename, { "biome.json" }) == nil
			end,
		},
	},
})
