return { -- Collection of various small independent plugins/modules
	{
		"nvim-mini/mini.nvim",
		version = "*",
		config = function()
			require("mini.ai").setup()
			require("mini.align").setup()
			require("mini.surround").setup({
				mappings = {
					add = "sa", -- Add surrounding in Normal and Visual modes
					delete = "sd", -- Delete surrounding
					find = "sf", -- Find surrounding (to the right)
					find_left = "sF", -- Find surrounding (to the left)
					highlight = "sh", -- Highlight surrounding
					replace = "sr", -- Replace surrounding

					suffix_last = "l", -- Suffix to search with "prev" method
					suffix_next = "n", -- Suffix to search with "next" method
				},
			})
			require("mini.cursorword").setup()
			-- require("mini.splitjoin").setup()
			-- require("mini.operators").setup()
			require("mini.extra").setup()
		end,
	},
}
