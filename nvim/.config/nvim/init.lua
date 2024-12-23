vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.wo.wrap = false
vim.g.mapleader = " "
-- vim.opt.encoding="utf-8"
vim.api.nvim_set_option("clipboard","unnamed")

require("config.lazy")
require("config.line_numbers")
require("config.lsp")
require("config.cmp")

local keymap = vim.api.nvim_set_keymap

-- basic mappings 
keymap('n', "<leader>oo", ":only<CR>", {})
keymap('n', "<leader>/", ":noh<CR>", {})

keymap('n', "<leader>h", ":wincmd h<CR>", {})
keymap('n', "<leader>j", ":wincmd j<CR>", {})
keymap('n', "<leader>k", ":wincmd k<CR>", {})
keymap('n', "<leader>l", ":wincmd l<CR>", {})
keymap('n', "gb", "<C-O>", {})

-- Telescope mappings
keymap('n', "<leader>ff", ":Telescope find_files<CR>", {})
keymap('n', "<leader>fg", ":Telescope live_grep<CR>", {})
keymap('n', "<leader>fh", ":Telescope help_tags<CR>", {})

-- keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "-", function()
  vim.cmd("vsplit")
  require("oil").open()
end)
