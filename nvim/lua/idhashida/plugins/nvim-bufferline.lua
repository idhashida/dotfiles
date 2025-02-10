local config = function()
	require("bufferline").setup({
		options = {
			numbers = "none", -- Показывать или нет номера буферов
			close_command = "bdelete! %d", -- Команда для закрытия буфера
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
					highlight = "Directory",
				},
			},
			show_buffer_close_icons = true,
			show_close_icon = false,
			separator_style = "thin", -- Стиль разделителей
		},
	})
end

return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = config,
}

