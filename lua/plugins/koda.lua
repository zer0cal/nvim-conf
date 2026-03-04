return {
	"oskarnurm/koda.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("koda").setup({
			transparent = true,
			auto = true,
			colors = {
				operator = "#cecece",
				special = "#ec8013",
				highlight = "#ec8013",
			},
		})
		-- vim.cmd("colorscheme koda")
	end,
}
