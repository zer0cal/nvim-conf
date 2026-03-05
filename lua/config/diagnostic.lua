-- Diagnostic Config
local virtual_text_conf = {
	source = "if_many",
	spacing = 8,
	format = function(diagnostic)
		local diagnostic_message = {
			[vim.diagnostic.severity.ERROR] = diagnostic.message,
			[vim.diagnostic.severity.WARN] = diagnostic.message,
			[vim.diagnostic.severity.INFO] = diagnostic.message,
			[vim.diagnostic.severity.HINT] = diagnostic.message,
		}
		return diagnostic_message[diagnostic.severity]
	end,
}

local diagnostics_config = {
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = true,
	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = "●",
			[vim.diagnostic.severity.WARN] = "●",
			[vim.diagnostic.severity.INFO] = "●",
			[vim.diagnostic.severity.HINT] = "●",
		},
	} or {},
	virtual_text = virtual_text_conf,
	-- virtual_text = true,
}

vim.diagnostic.config(diagnostics_config)

-- It's good practice to namespace custom handlers to avoid collisions
vim.diagnostic.handlers["my/notify"] = {
	show = function(namespace, bufnr, diagnostics, opts)
		-- In our example, the opts table has a "log_level" option
		local level = opts["my/notify"].log_level
		local name = vim.diagnostic.get_namespace(namespace).name
		local msg = string.format("%d diagnostics in buffer %d from %s", #diagnostics, bufnr, name)
		vim.notify(msg, level)
	end,
}

local namespace = vim.api.nvim_create_namespace("diagnostic_virtual_lines_on_cursor")

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		local buffer = vim.api.nvim_get_current_buf()
		local line = vim.api.nvim_win_get_cursor(0)[1] - 1

		local diagnostics = vim.diagnostic.get(buffer, { lnum = line })
		if #diagnostics < 1 then
			return
		end

		vim.diagnostic.hide(namespace, buffer)

		vim.diagnostic.show(namespace, buffer, diagnostics, {
			virtual_lines = true,
			virtual_text = false,
		})
	end,
})

vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter" }, {
	callback = function()
		local buffer = vim.api.nvim_get_current_buf()
		vim.diagnostic.hide(namespace, buffer)
	end,
})
