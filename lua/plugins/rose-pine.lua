return {
	"rose-pine/neovim",
	priority = 1000,
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("rose-pine").setup({
			styles = {
				bold = true,
				italic = false,
				transparency = true,
			},
		})
		vim.cmd.colorscheme("rose-pine")
	end,
}
