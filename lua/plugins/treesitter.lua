return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	branch = "main",
	config = function()
		local ts = require("nvim-treesitter")

		-- Wait at most 30 seconds to finish installation.
		-- ts.install(
		-- 	{
		-- 		"lua",
		-- 		"vim",
		-- 		"vimdoc",
		-- 		"query",
		-- 		"markdown",
		-- 		"markdown_inline",
		-- 		"json",
		-- 		"yaml",
		-- 	},
		-- 	-- Do not print summary, as this will run at startup always, all the time.
		-- 	{ summary = false }
		-- ):wait(30000)

		---@type fun(args: vim.api.keyset.create_autocmd.callback_args): boolean?
		local install_parser_and_enable_features = function(event)
			local lang = event.match

			-- Try to start the parser install for the language.
			local ok, task = pcall(ts.install, { lang }, { summary = false })
			if not ok then
				return
			end

			-- Wait for the installation to finish (up to 10 seconds).
			task:wait(10000)

			-- Enable syntax highlighting for the buffer
			ok, _ = pcall(vim.treesitter.start, event.buf, lang)
			if not ok then
				return
			end

			-- Enable other features as needed.

			-- Enable indentation based on treesitter for the buffer.
			-- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

			-- Enable folding based on treesitter for the buffer.
			-- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		end

		-- Install missing parsers on file open.
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("ui.treesitter", { clear = true }),
			pattern = { "*" },
			callback = install_parser_and_enable_features,
		})

		-- require("nvim-treesitter").setup({
		-- 	highlight = {
		-- 		enable = true,
		-- 		additional_vim_regex_highlighting = { "ruby" },
		-- 	},
		-- 	indent = { enable = true, disable = { "ruby" } },
		-- 	incremental_selection = {
		-- 		enable = true,
		-- 		keymaps = {
		-- 			init_selection = "mnn", -- set to `false` to disable one of the mappings
		-- 			node_incremental = "mrn",
		-- 			scope_incremental = "mrc",
		-- 			node_decremental = "mrm",
		-- 		},
		-- 	},
		-- })
	end,
}
