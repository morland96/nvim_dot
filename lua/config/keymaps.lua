-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby

vim.keymap.set("n", "<Leader>wh", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<Leader>wj", "<C-w>j", { desc = "Go to bottom window" })
vim.keymap.set("n", "<Leader>wk", "<C-w>k", { desc = "Go to top window" })
vim.keymap.set("n", "<Leader>wl", "<C-w>l", { desc = "Go to right window" })

-- Telescope
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<Leader>pp", "<Cmd>Telescope projects<CR>", { desc = "Find Projects" })
vim.keymap.set("n", "<Leader>pf", "<Cmd>Telescope find_files<CR>", { desc = "Find Project Files" })
vim.keymap.set("n", "<Leader>p.", "<Cmd>Telescope file_browser<CR>", { desc = "Browse Project Files" })
vim.keymap.set("n", "<Leader>pg", telescope_builtin.live_grep, { desc = "Grep Project Files" })

vim.keymap.set("n", "<Leader>bb", "<Cmd>Telescope buffers<CR>", { desc = "Find Buffers" })

-- Files
vim.keymap.set("n", "<Leader>fs", "<Cmd>write<CR>", { desc = "Save File" })

-- Jump
vim.keymap.set("n", "<Leader>js", telescope_builtin.treesitter, { desc = "Jump treesitter" })

-- Search
vim.keymap.set("n", "<Leader>ss", telescope_builtin.lsp_document_symbols, { desc = "Search symbols in file" })
vim.keymap.set("n", "<Leader>s.", telescope_builtin.builtin, { desc = "Telescope search" })
vim.keymap.set(
  "n",
  "<Leader>sS",
  telescope_builtin.lsp_dynamic_workspace_symbols,
  { desc = "Search symbols in workspace" }
)

-- Refactor
vim.keymap.set("n", "<Leader>rr", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<Leader>ra", vim.lsp.buf.code_action, { desc = "Code Action" })
