vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<A-j>", "dd$p")
vim.keymap.set("n", "<A-k>", "kdd$pk")

vim.keymap.set("n", "<S-Up>",    ":resize -1<CR>")
vim.keymap.set("n", "<S-Down>",  ":resize +1<CR>") vim.keymap.set("n", "<S-Left>",  "<C-w><")
vim.keymap.set("n", "<S-Right>", "<C-w>>")

vim.keymap.set({"n", "v"}, "<C-j>", "5j");
vim.keymap.set({"n", "v"}, "<C-k>", "5k");
vim.keymap.set({"n", "v"}, "<C-l>", "5l");
vim.keymap.set({"n", "v"}, "<C-h>", "5h");

vim.keymap.set({"n", "v"}, "<leader>h", "^");
vim.keymap.set({"n", "v"}, "<leader>l", "$");

--Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--ClangFormat
vim.api.nvim_set_keymap("n", "<A-I>", ":ClangFormat<CR>", { noremap = true, silent = true })

--Airline Buffer
vim.api.nvim_set_keymap("n", "<C-n>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-p>", ":bprevious<CR>", { noremap = true, silent = true })

-- build 
vim.keymap.set({"i", "n", "v"}, "<F7>",
    "<cmd>!cmake --build ./build --config Debug --target all -j 6 --<CR>",
    {silent = true, noremap = true, buffer = bufnr})

-- smooth scroll
--vim.cmd[[
--nnoremap <unique> <C-D> <cmd>call smoothie#do("\<C-D>") <CR>
--vnoremap <unique> <C-D> <cmd>call smoothie#do("\<C-D>") <CR>
--]]

-- terminal
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<Esc>", "<C-`>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>t", ":ToggleTerm size=10<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>T", ":ToggleTerm size=40<CR>", {noremap = true, silent = true})
