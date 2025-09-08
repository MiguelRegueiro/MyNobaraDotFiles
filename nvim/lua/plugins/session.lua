return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {
    options = vim.opt.sessionoptions:get(), -- sessionoptions used for saving
    pre_save = nil, -- a function to call before saving the session
    post_save = nil, -- a function to call after saving the session
    save_empty = false, -- don't save if there are no open file buffers
    pre_load = nil, -- a function to call before loading the session
    post_load = nil, -- a function to call after loading the session
  },
  -- stylua: ignore
  keys = {
    { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
  },
  
  config = function(_, opts)
    require("persistence").setup(opts)
    
    -- Auto-restore session for current directory if it exists
    vim.api.nvim_create_autocmd("VimEnter", {
      group = vim.api.nvim_create_augroup("persistence_auto_restore", { clear = true }),
      callback = function()
        -- Only auto-restore if nvim was started without file arguments and not from nvdash
        local should_load = vim.fn.argc() == 0 and not vim.g.nvdash_displayed
        if should_load then
          local session_dir = vim.fn.stdpath("state") .. "/sessions"
          local cwd = vim.loop.cwd()
          local session_file = session_dir .. "/" .. cwd:gsub("/", "%%") .. ".vim"
          if vim.fn.filereadable(session_file) == 1 then
            require("persistence").load()
          end
        end
      end,
      nested = true,
    })
    
    -- Create user commands for easier access
    vim.api.nvim_create_user_command("SessionSave", function()
      require("persistence").save()
      vim.notify("Session saved!", vim.log.levels.INFO)
    end, {
      desc = "Save current session"
    })
    
    vim.api.nvim_create_user_command("SessionRestore", function()
      require("persistence").load()
      vim.notify("Session restored!", vim.log.levels.INFO)
    end, {
      desc = "Restore session for current directory"
    })
    
    vim.api.nvim_create_user_command("SessionRestoreLast", function()
      require("persistence").load({ last = true })
      vim.notify("Last session restored!", vim.log.levels.INFO)
    end, {
      desc = "Restore last session"
    })
    
    vim.api.nvim_create_user_command("SessionDelete", function()
      require("persistence").stop()
      vim.notify("Session saving disabled for this session", vim.log.levels.INFO)
    end, {
      desc = "Stop saving current session"
    })
  end,
}
