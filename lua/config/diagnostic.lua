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
}

vim.diagnostic.config(diagnostics_config)

-- local namespace_vl = vim.api.nvim_create_namespace("diagnostic_virtual_lines_on_cursor")
-- local namespace_vt = vim.api.nvim_create_namespace("diagnostic_virtual_text_off_cursor")
--
-- vim.api.nvim_create_autocmd("CursorHold", {
-- 	callback = function()
-- 		local buffer = vim.api.nvim_get_current_buf()
-- 		local line = vim.api.nvim_win_get_cursor(0)[1] - 1
--
-- 		local all_diagnostics = table.filter(vim.diagnostic.get(buffer, {}), function(element, _, _)
-- 			return element.end_lnum ~= line
-- 		end)
-- 		local diagnostics = vim.diagnostic.get(buffer, { lnum = line })
--
-- 		vim.diagnostic.hide(namespace_vt, buffer)
-- 		vim.diagnostic.show(namespace_vt, buffer, all_diagnostics, {
-- 			virtual_lines = false,
-- 			virtual_text = true,
-- 		})
-- 		vim.diagnostic.hide(namespace_vl, buffer)
-- 		vim.diagnostic.show(namespace_vl, buffer, diagnostics, {
-- 			virtual_lines = true,
-- 			virtual_text = false,
-- 		})
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter", "TextChanged" }, {
-- 	callback = function()
-- 		local buffer = vim.api.nvim_get_current_buf()
-- 		vim.diagnostic.hide(namespace_vl, buffer)
-- 		vim.diagnostic.hide(namespace_vt, buffer)
-- 	end,
-- })
--
-- -- define a filter with filter iterator
-- table.filter = function(array, filterIterator)
-- 	-- filter result to be returned
-- 	local result = {}
--
-- 	-- iterate over main array
-- 	for key, value in pairs(array) do
-- 		-- call filterIterator
-- 		if filterIterator(value, key, array) then
-- 			-- append the value in filtered result
-- 			table.insert(result, value)
-- 		end
-- 	end
--
-- 	-- return the filtered result
-- 	return result
-- end
