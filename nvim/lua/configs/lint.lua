-- Disable linting by commenting out the configuration
-- Local lint = require "lint"

--[[
-- Configure linters by filetype
lint.linters_by_ft = {
  python = { "flake8" },
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  cpp = { "cpplint" },
  java = { "checkstyle" },
  lua = { "selene" },
}

-- Auto-run linting
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  callback = function()
    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype
    lint.try_lint()
  end,
})
]]

-- Return an empty table to avoid errors
return {}