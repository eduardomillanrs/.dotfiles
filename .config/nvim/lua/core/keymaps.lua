local map = vim.keymap.set

-- Better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Window resize
map("n", "<A-k>", "<CMD>resize -2<CR>", { desc = "Decrease Window Height" })
map("n", "<A-j>", "<CMD>resize +2<CR>", { desc = "Increase Window Height" })
map("n", "<A-h>", "<CMD>vertical resize -2<CR>", { desc = "Decrease Window Width" })
map("n", "<A-l>", "<CMD>vertical resize +2<CR>", { desc = "Increase Window Width" })

-- Better indenting
map("n", "<", "<<", { noremap = true })
map("n", ">", ">>", { noremap = true })
map("v", "<", "<gv", { noremap = true })
map("v", ">", ">gv", { noremap = true })

-- Better navigation
-- map("n", "bn", "<CMD>bnext<CR>", { desc = "Go to next buffer", noremap = true })
-- map("n", "bp", "<CMD>bprevious<CR>", { desc = "Go to previous buffer", noremap = true })

-- Better buffer's content selection
map("n", "yae", "ggyG", { desc = "Copy all file contents", noremap = true })
map("n", "cae", "ggcG", { desc = "Replace all file contents", noremap = true })
map("n", "dae", "ggdG", { desc = "Delete all file contents", noremap = true })
map("n", "vae", "ggVG", { desc = "Select all file contents", noremap = true })

-- Escape insert mode on terminal
map("t", "<C-\\><Esc>", "<C-\\><C-n>", { desc = "Escape insert mode on terminal", noremap = true })

-- Open netrw in the parent directory
map("n", "-", function () vim.cmd("Ex " .. vim.fn.expand("%:h")) end, { desc = "Open netrw in the parent directory", noremap = true })
