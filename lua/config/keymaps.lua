-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby

local map = vim.keymap.set
local nx = { "n", "x" }

if vim.g.vscode then
  -- Makes vscode happy
  map("n", "<Space>", "<Cmd>call VSCodeNotify('whichkey.show')<CR>", { silent = true })
  map("x", "<Space>", "<Cmd>call VSCodeNotify('whichkey.show')<CR>", { silent = true })

  -- Better Navigation
  map({ "n", "x" }, "<C-h>", "<Cmd>call VSCodeNotify('workbench.action.navigateLeft')<CR>")
  map({ "n", "x" }, "<C-j>", "<Cmd>call VSCodeNotify('workbench.action.navigateDown')<CR>")
  map({ "n", "x" }, "<C-k>", "<Cmd>call VSCodeNotify('workbench.action.navigateUp')<CR>")
  map({ "n", "x" }, "<C-l>", "<Cmd>call VSCodeNotify('workbench.action.navigateRight')<CR>")
  -- Project
  map("n", "<Leader>pp", "<Cmd>call VSCodeNotify('workbench.action.files.openFolder')<CR>")
end

map("n", "<Leader>wh", "<C-w>h", { desc = "Go to left window" })
map("n", "<Leader>wj", "<C-w>j", { desc = "Go to bottom window" })
map("n", "<Leader>wk", "<C-w>k", { desc = "Go to top window" })
map("n", "<Leader>wl", "<C-w>l", { desc = "Go to right window" })

if vim.g.vscode then
else
  -- Telescope
  local telescope_builtin = require("telescope.builtin")
  map("n", "<Leader>pp", "<Cmd>Telescope projects<CR>", { desc = "Find Projects" })
  map("n", "<Leader>pf", "<Cmd>Telescope find_files<CR>", { desc = "Find Project Files" })
  map("n", "<Leader>p.", "<Cmd>Telescope file_browser<CR>", { desc = "Browse Project Files" })
  map("n", "<Leader>pg", telescope_builtin.live_grep, { desc = "Grep Project Files" })

  map("n", "<Leader>bb", "<Cmd>Telescope buffers<CR>", { desc = "Find Buffers" })
  -- Files
  map("n", "<Leader>fs", "<Cmd>write<CR>", { desc = "Save File" })

  -- Jump
  map("n", "<Leader>js", telescope_builtin.treesitter, { desc = "Jump treesitter" })

  -- Search
  map("n", "<Leader>ss", telescope_builtin.lsp_document_symbols, { desc = "Search symbols in file" })
  map("n", "<Leader>s.", telescope_builtin.builtin, { desc = "Telescope search" })
  map("n", "<Leader>sS", telescope_builtin.lsp_dynamic_workspace_symbols, { desc = "Search symbols in workspace" })

  -- Goto
  map("n", "<Leader>ci", telescope_builtin.lsp_implementations, { desc = "Goto Implementation" })

  -- Bookmarks
  local bm = require("telescope").extensions.vim_bookmarks
  map(nx, "<Leader><enter>", bm.all, { desc = "List Bookmarks" })
  map(nx, "<Leader>mm", "<Cmd>BookmarkToggle<CR>", { desc = "Toggle Bookmark" })
  map(nx, "<Leader>mi", "<Cmd>BookmarkAnnotate<CR>", { desc = "Toggle Bookmark" })
  map(nx, "<Leader>mn", "<Cmd>BookmarkNext<CR>", { desc = "Next Bookmark" })
  map(nx, "<Leader>mp", "<Cmd>BookmarkPrev<CR>", { desc = "Previous Bookmark" })
  map(nx, "<Leader>ma", "<Cmd>BookmarkClear<CR>", { desc = "Clear Bookmarks" })

  -- Refactor
  map("n", "<Leader>rr", vim.lsp.buf.rename, { desc = "Rename" })
  map("n", "<Leader>ra", vim.lsp.buf.code_action, { desc = "Code Action" })
end
