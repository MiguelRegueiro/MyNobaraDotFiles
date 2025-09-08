require "nvchad.options"

-- add yours here!

local o = vim.o
local opt = vim.opt

-- Basic editor enhancements
o.number = true                -- Show line numbers
o.relativenumber = true       -- Show relative line numbers
o.wrap = false                -- Don't wrap lines
o.linebreak = true            -- Wrap lines at convenient points
o.showmode = false            -- Don't show mode since we have statusline
o.showmatch = true            -- Show matching brackets/parentheses
o.ignorecase = true           -- Case insensitive searching
o.smartcase = true            -- Case sensitive when uppercase is present
o.incsearch = true            -- Show search matches as you type
o.hlsearch = true             -- Highlight search results
o.scrolloff = 8               -- Keep 8 lines above/below cursor
o.sidescrolloff = 15          -- Keep 15 columns left/right cursor
o.splitright = true           -- Vertical splits open to the right
o.splitbelow = true           -- Horizontal splits open below
o.mouse = "a"                 -- Enable mouse support
o.clipboard = "unnamedplus"   -- Use system clipboard
o.termguicolors = true        -- Enable true colors
o.signcolumn = "yes"          -- Always show sign column
o.updatetime = 300            -- Faster completion
o.timeoutlen = 500            -- Faster key timeout
o.completeopt = "menuone,noselect"  -- Better completion

-- Indentation settings
o.expandtab = true            -- Use spaces instead of tabs
o.tabstop = 2                 -- 2 spaces for tabs
o.softtabstop = 2             -- 2 spaces for tabs
o.shiftwidth = 2              -- 2 spaces for indentation
o.autoindent = true           -- Copy indent from current line
o.smartindent = true          -- Smart autoindenting for C programs

-- Backup and swap files
o.backup = false              -- Don't create backup files
o.writebackup = false         -- Don't create backup files
o.swapfile = false            -- Don't create swap files