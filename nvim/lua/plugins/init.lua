return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- enable format on save
    opts = require "configs.conform",
    enabled = false, -- Keep disabled as we're not using external formatters
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Do nothing, LSP is disabled
    end,
    enabled = false, -- Keep disabled
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "javascript", "typescript", "python",
        "json", "markdown",
        "c", "cpp", "java", "sql", "rust"
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    },
    -- Keep treesitter enabled for syntax highlighting and indentation
  },

  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    opts = {
      filesystem = {
        window = {
          mappings = {
            ["<leader>e"] = "close_window",
          }
        }
      }
    }
  },

  -- Bufferline for tabs
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        mode = "tabs",
        separator_style = "slant",
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { 
          {
            "filename",
            file_status = true,
            path = 1
          }
        },
        lualine_x = { 
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = "󰌵 ",
            },
          },
          "encoding",
          "fileformat",
          "filetype"
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  -- Mason for managing LSP servers, DAP servers, linters, and formatters
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- All tools are commented out to prevent installation
      },
    },
    enabled = false, -- Keep disabled to prevent any installations
  },

  -- Linting
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lint"
    end,
    enabled = false, -- Keep disabled
  },
  
  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
      -- Setup integration with cmp (if we add it later)
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      local cmp = require "cmp"
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  
  -- Comments
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle selection" },
    },
    opts = {},
  },
  
  -- Better surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {},
  },
  
  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",        -- LSP completions (we won't use this)
      "hrsh7th/cmp-buffer",          -- Buffer completions
      "hrsh7th/cmp-path",            -- Path completions
      "hrsh7th/cmp-cmdline",         -- Command line completions
      "saadparwaiz1/cmp_luasnip",    -- Snippet completions
      "L3MON4D3/LuaSnip",            -- Snippet engine
    },
    opts = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
          ["<C-j>"] = cmp.mapping.select_next_item(), -- Next suggestion
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- Show completion suggestions
          ["<C-e>"] = cmp.mapping.abort(), -- Close completion window
          ["<CR>"] = cmp.mapping.confirm { select = false },
        },
        sources = {
          { name = "buffer" },      -- Text from current buffer
          { name = "path" },        -- File paths
          { name = "luasnip" },     -- Snippets
        },
      }
    end,
  }
}