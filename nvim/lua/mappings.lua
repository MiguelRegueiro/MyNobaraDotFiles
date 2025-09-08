require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Basic navigation and editing
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Buffers
map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Quick save and quit
map("n", "<leader>w", ":w<CR>", { desc = "Save" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>qa", ":qa<CR>", { desc = "Quit all" })

-- Better indenting
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Move selected line / block of text in visual mode
map("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move line down" })
map("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move line up" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Add undo break-points in insert mode
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Better window navigation
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- File explorer
map("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })

-- Search and replace
map("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })

-- Diagnostic keymaps (keeping these but they won't work without LSP)
-- map("n", "<space>e", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
-- map("n", "<space>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })
-- map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
-- map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })

-- Dashboard/nvdash specific mappings
map("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "Open Lazy plugin manager" })
map("n", "<leader>ss", function()
  require("utils.session_helper").restore_session()
end, { desc = "Restore last session" })
map("n", "<leader>fc", function()
  require("telescope.builtin").find_files({ cwd = vim.fn.expand("~/.config/nvim") })
end, { desc = "Find config files" })

-- Additional session management mappings
map("n", "<leader>sl", function()
  require("utils.session_helper").restore_last_session()
end, { desc = "Restore last session" })
map("n", "<leader>sd", function()
  require("utils.session_helper").stop_session()
end, { desc = "Stop session saving" })
map("n", "<leader>sw", function()
  require("utils.session_helper").save_session()
end, { desc = "Save current session" })

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })