return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "simple",
			-- transparent_bg = true,
			options = {
				show_source = {
					enabled = true,
					if_many = true,
				},
				multilines = {
					enabled = true,
					always_show = true,
				},
			},
		})
		vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
	end,
}
