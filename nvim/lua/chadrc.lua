-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "oxocarbon",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "                                   ",
    "      ███╗   ██╗███████╗ ██████╗     ",
    "      ████╗  ██║██╔════╝██╔═══██╗    ",
    "      ██╔██╗ ██║█████╗  ██║   ██║    ",
    "      ██║╚██╗██║██╔══╝  ██║   ██║    ",
    "      ██║ ╚████║███████╗╚██████╔╝    ",
    "      ╚═╝  ╚═══╝╚══════╝ ╚═════╝     ",
    "                                   ",
    "         NeoVim Dashboard        ",
    "                                   ",
  },
  buttons = {
    { txt = "  Find File", keys = "f f", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "f o", cmd = "Telescope oldfiles" },
    { txt = "󰈭  Find Word", keys = "f w", cmd = "Telescope live_grep" },
    { txt = "󱥚  Themes", keys = "t h", cmd = ":lua require('nvchad.themes').open()" },
    { txt = "  Mappings", keys = "c h", cmd = "NvCheatsheet" },

    { txt = "󰒲  Lazy", keys = "l z", cmd = "Lazy" },
    { txt = "  Restore Session", keys = "s s", cmd = ":lua require('utils.session_helper').restore_session()" },
    { txt = "  Configuration", keys = "f c", cmd = "Telescope find_files cwd=~/.config/nvim" },

    { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },

    {
      txt = function()
        local ok, stats = pcall(function()
          return require("lazy").stats()
        end)
        if not ok then
          return "  Plugin manager not ready"
        end
        local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
      end,
      hl = "NvDashLazy",
      no_gap = true,
    },
  },
}
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

M.plugins = "plugins"

return M
