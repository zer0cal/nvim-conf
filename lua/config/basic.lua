vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = "a"

vim.o.showmode = false
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = "yes"

vim.o.updatetime = 150

vim.o.timeoutlen = 300

-- Toggle whitespace characters.
vim.o.list = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.keymap.set("n", "<leader>tl", function()
	vim.o.list = not vim.o.list
end, { desc = "Toggle whitespace characters" })

vim.o.inccommand = "split"

vim.o.splitright = true
vim.o.splitbelow = true

-- vim.o.cursorline = true

vim.o.scrolloff = 10

vim.o.confirm = true

vim.o.expandtab = true

vim.o.autoindent = true
-- vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- netrw file explorer config
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.netrw_liststyle = 3

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
