-- Diagnostic Config
vim.diagnostic.config({
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = "● ",
			[vim.diagnostic.severity.WARN] = "● ",
			[vim.diagnostic.severity.INFO] = "● ",
			[vim.diagnostic.severity.HINT] = "● ",
		},
	} or {},
	virtual_text = false,
	-- virtual_text = {
	-- 	source = "if_many",
	-- 	spacing = 4,
	-- 	format = function(diagnostic)
	-- 		local diagnostic_message = {
	-- 			[vim.diagnostic.severity.ERROR] = diagnostic.message,
	-- 			[vim.diagnostic.severity.WARN] = diagnostic.message,
	-- 			[vim.diagnostic.severity.INFO] = diagnostic.message,
	-- 			[vim.diagnostic.severity.HINT] = diagnostic.message,
	-- 		}
	-- 		return diagnostic_message[diagnostic.severity]
	-- 	end,
	-- },
	virtual_lines = false,
	-- vim.diagnostic.config({ virtual_lines = { only_current_line = true } }),
})

-- local namespace = vim.api.nvim_create_namespace("diagnostic_virtual_lines_on_cursor")
--
-- local function show_virtual_lines_on_cursor()
-- 	local buffer = vim.api.nvim_get_current_buf()
-- 	local line = vim.api.nvim_win_get_cursor(0)[1] - 1
--
-- 	local diagnostics = vim.diagnostic.get(buffer, { lnum = line })
-- 	if #diagnostics <= 1 then
-- 		return
-- 	end
--
-- 	vim.diagnostic.hide(namespace, buffer)
--
-- 	vim.diagnostic.show(namespace, buffer, diagnostics, {
-- 		virtual_lines = true,
-- 		virtual_text = false,
-- 	})
-- end
--
-- vim.api.nvim_create_autocmd("CursorHold", {
-- 	callback = show_virtual_lines_on_cursor,
-- })
--
-- vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter" }, {
-- 	callback = function()
-- 		local buffer = vim.api.nvim_get_current_buf()
-- 		vim.diagnostic.hide(namespace, buffer)
-- 	end,
-- })
