-- Enable basic built-in formatters
local options = {
  formatters_by_ft = {
    lua = { "lua-format" },      -- Built-in Lua formatter
    -- Commented out external formatters to prevent errors
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = false, -- Disable LSP fallback since we're not using LSP
  },
}

return options