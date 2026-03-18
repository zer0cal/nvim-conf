return {
	"oskarnurm/koda.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("koda").setup({
			transparent = true,
			auto = true,
			styles = {
				functions = { bold = true },
				keywords = { bold = false },
				comments = { italic = true },

				-- 	strings = {},
				-- 	constants = {}, -- includes numbers, booleans
			},
			colors = {
				const = "#d9ba73",
				-- keyword = "#ffffff",
				-- emphasis = "#71ade7",
				-- func = "#71ade7",
				string = "#95cb82",
				char = "#cc8bc9",
			},
		})
		-- vim.cmd("colorscheme koda")
	end,
}
