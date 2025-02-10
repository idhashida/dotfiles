local config = function()
	local lspconfig = require("lspconfig")

	local signs = { Error = "", Warn = "", Hint = "", Info = "" }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local on_attach = function(client, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }

		-- set keybinds
		vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
		vim.keymap.set("n", "<Leader>fd", "<cmd>Lspsaga finder<CR>", opts) -- go to definition
		vim.keymap.set("n", "<Leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- peak definition
		vim.keymap.set("n", "<Leader>gD", "<cmd>Lspsaga goto_definition<CR>", opts) -- go to definition
		vim.keymap.set("n", "<Leader>gS", "<cmd>vsplit | Lspsaga goto_definition<CR>", opts) -- go to definition
		vim.keymap.set("n", "<Leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
		vim.keymap.set("n", "<Leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
		vim.keymap.set("n", "<Leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
		vim.keymap.set("n", "<Leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
		vim.keymap.set("n", "<Leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to prev diagnostic in buffer
		vim.keymap.set("n", "<Leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	end

	-- lua
	lspconfig.lua_ls.setup({
		-- capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	-- golang
	lspconfig.gopls.setup({
		-- capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
				},
				staticcheck = true,
				gofumpt = true,
			},
		},
	})

	local stylua = require("efmls-configs.formatters.stylua")
	local gofumpt = require("efmls-configs.formatters.gofumpt")

	-- configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"go",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { stylua },
				go = { gofumpt },
			},
		},
	})

	-- Format on Save
	local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = lsp_fmt_group,
		callback = function()
			local efm = vim.lsp.get_active_clients({ name = "efm" })

			if vim.tbl_isempty(efm) then
				return
			end

			vim.lsp.buf.format({ name = "efm" })
		end,
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
	},
}
