-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

----------------------------------------------------------------------------------------------------
-- Packages
----------------------------------------------------------------------------------------------------
require("config.lazy")

----------------------------------------------------------------------------------------------------
-- Colors
----------------------------------------------------------------------------------------------------
vim.opt.termguicolors = true
vim.opt.background = "dark"

require("onedark").load()

----------------------------------------------------------------------------------------------------
-- General Settings
----------------------------------------------------------------------------------------------------
vim.opt.ttyfast = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.wrap = false

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "101"

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

----------------------------------------------------------------------------------------------------
-- Indentation Settings
----------------------------------------------------------------------------------------------------
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.backspace = "indent,eol,start"

----------------------------------------------------------------------------------------------------
-- Line Number Settings
----------------------------------------------------------------------------------------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.opt.number = true
		vim.opt.relativenumber = false
	end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.opt.number = true
		vim.opt.relativenumber = true
	end,
})

----------------------------------------------------------------------------------------------------
-- Gitsigns
----------------------------------------------------------------------------------------------------
require("gitsigns").setup()

----------------------------------------------------------------------------------------------------
-- Whitespace
------------------------------------------------------------------------------------------------
local whitespace = {
	ignored_filetypes = {
		"blink-cmp-documentation",
		"blink-cmp-menu",
		"dashboard",
		"fzf",
		"fzflua-backdrop",
		"help",
		"lazy",
		"neo-tree",
		"nofile",
		"noice",
		"snacks_dashboard",
		"snacks_layout_box",
		"snacks_notif",
		"snacks_picker_list",
		"snacks_picker_preview",
		"Trouble",
	},

	nohighlight = function()
		vim.cmd("match")
	end,

	highlight = function()
		vim.cmd([[
			highlight ExtraWhitespace guibg=#E55561
			match ExtraWhitespace /\s\+$/
			autocmd InsertEnter *.* match ExtraWhitespace /\s\+\%#\@<!$/
			autocmd InsertLeave *.* match ExtraWhitespace /\s\+$/
		]])
	end,
}

local function whitespace_filetype()
	if vim.tbl_contains(whitespace.ignored_filetypes, vim.bo.filetype) then
		whitespace.nohighlight()
	else
		-- vim.notify("filetype", vim.log.levels.INFO)
		-- vim.notify(vim.bo.filetype, vim.log.levels.INFO)
		whitespace.highlight()
	end
end

local function whitespace_buf_enter()
	if
		vim.tbl_contains(whitespace.ignored_filetypes, vim.bo.filetype)
		or (vim.bo.buftype == "terminal")
		or (vim.bo.buftype == "" and vim.bo.filetype == "")
	then
		whitespace.nohighlight()
	else
		-- vim.notify("buf", vim.log.levels.INFO)
		-- vim.notify(vim.bo.filetype, vim.log.levels.INFO)
		-- vim.notify(vim.bo.buftype, vim.log.levels.INFO)
		whitespace.highlight()
	end
end

local function whitespace_nohighlight()
	whitespace.nohighlight()
end

vim.api.nvim_create_augroup("whitespace_nvim", { clear = true })
vim.api.nvim_create_autocmd("FileType", { group = "whitespace_nvim", pattern = "*", callback = whitespace_filetype })
vim.api.nvim_create_autocmd("BufEnter", { group = "whitespace_nvim", pattern = "*", callback = whitespace_buf_enter })
vim.api.nvim_create_autocmd("TermOpen", { group = "whitespace_nvim", pattern = "*", callback = whitespace_nohighlight })

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("trim_whitespaces", { clear = true }),
	desc = "Trim trailing white spaces",
	pattern = "*",
	callback = function()
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "<buffer>",
			-- Trim trailing whitespaces
			callback = function()
				-- Save cursor position to restore later
				local curpos = vim.api.nvim_win_get_cursor(0)
				-- Search and replace trailing whitespaces
				vim.cmd([[keeppatterns %s/\s\+$//e]])
				vim.api.nvim_win_set_cursor(0, curpos)
			end,
		})
	end,
})

----------------------------------------------------------------------------------------------------
-- Lualine
----------------------------------------------------------------------------------------------------
require("lualine").setup({})

----------------------------------------------------------------------------------------------------
-- Hop
----------------------------------------------------------------------------------------------------
local hop = require("hop")
vim.keymap.set("n", "<leader>s", function()
	hop.hint_char1()
end, { remap = true })
vim.keymap.set("n", "<leader>w", function()
	hop.hint_words()
end, { remap = true })
vim.keymap.set("n", "<leader>l", function()
	hop.hint_lines_skip_whitespace()
end, { remap = true })
