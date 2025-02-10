local config = function()
	local theme = require("lualine.themes.nightfox")

	theme.normal.c.bg = nil

	require("lualine").setup({
		options = {
			theme = theme,
			globalstatus = true,
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "NvimTree" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_x = { "encoding", "filetype", "progress" },
			lualine_y = { "" },
			lualine_z = { "location" },
		},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = config,
}

