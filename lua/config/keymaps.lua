vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- open explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')

-- show errors and stuff
vim.keymap.set("n", "<leader>l", vim.diagnostic.open_float)
