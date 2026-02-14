return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			filters = {
				dotfiles = true,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
		})
	end,
}
