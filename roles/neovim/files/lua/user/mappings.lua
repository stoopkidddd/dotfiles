local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
-- map("n", "<leader>lt", "<cmd>TroubleToggle<CR>", opts)

map("n", "f", "<cmd>HopWord<CR>", opts)
map("n", "F", "<cmd>HopLineStart<CR>", opts)

map('i', '<F2>', '<cmd>lua require("renamer").rename()<cr>', opts)

