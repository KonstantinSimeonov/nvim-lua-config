local mapkey = vim.keymap

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Directory Navigatio}n
mapkey.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })

-- Indenting
mapkey.set("v", "<", "<gv")
mapkey.set("v", ">", ">gv")

vim.keymap.set("n", "x", '"_x') -- delete single character without copying into register
