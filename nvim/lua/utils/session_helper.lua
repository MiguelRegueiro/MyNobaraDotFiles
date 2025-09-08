local M = {}

-- Function to check if there are any sessions available
local function has_sessions()
  local session_dir = vim.fn.stdpath("state") .. "/sessions"
  if vim.fn.isdirectory(session_dir) == 0 then
    return false
  end
  local sessions = vim.fn.glob(session_dir .. "/*", false, true)
  return #sessions > 0
end

-- Function to check if current directory has a session
local function has_current_session()
  local session_dir = vim.fn.stdpath("state") .. "/sessions"
  local cwd = vim.loop.cwd()
  local session_file = session_dir .. cwd:gsub("/", "%%") .. ".vim"
  return vim.fn.filereadable(session_file) == 1
end

-- Smart session restore function
function M.restore_session()
  if has_current_session() then
    require('persistence').load()
    vim.notify("Session restored for current directory!", vim.log.levels.INFO)
  elseif has_sessions() then
    require('persistence').load({ last = true })
    vim.notify("Last session restored!", vim.log.levels.INFO)
  else
    vim.notify("No sessions found! Open some files and they'll auto-save when you exit.", vim.log.levels.WARN)
    vim.notify("Tip: persistence.nvim automatically saves sessions when you exit", vim.log.levels.INFO)
  end
end

-- Function to restore the last session
function M.restore_last_session()
  if has_sessions() then
    require('persistence').load({ last = true })
    vim.notify("Last session restored!", vim.log.levels.INFO)
  else
    vim.notify("No sessions found!", vim.log.levels.WARN)
  end
end

-- Function to save current session with feedback
function M.save_session()
  require('persistence').save()
  vim.notify("Session saved!", vim.log.levels.INFO)
end

-- Function to stop session saving
function M.stop_session()
  require('persistence').stop()
  vim.notify("Session saving disabled for this session", vim.log.levels.INFO)
end

return M
