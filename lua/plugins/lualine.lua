return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local auto_theme_custom = require("lualine.themes.auto")
		auto_theme_custom.normal.c.bg = "none"
		auto_theme_custom.insert.c.bg = "none"
		auto_theme_custom.visual.c.bg = "none"
		require("lualine").setup({
			options = {
				theme = auto_theme_custom,
				icons_enabled = false,
				component_separators = { left = "│", right = "│" },
				section_separators = { left = "▓▒░", right = "░▒▓" },
			},
		})
	end,
}
