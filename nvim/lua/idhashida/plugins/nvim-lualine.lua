local config = function()
  -- local palette = require("gruvbox.palette").load("carbonfox")
	local theme = require("lualine.themes.gruvbox")
	theme.normal.b.bg = nil

	require("lualine").setup({
    options = {
        theme = theme,
        globalstatus = true,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_x = { "encoding", "fileformat", "filetype", "progress" },
        lualine_y = { "" },
        lualine_z = { "location" },
      },
      tabline = {},
    })
  end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = config,
}
