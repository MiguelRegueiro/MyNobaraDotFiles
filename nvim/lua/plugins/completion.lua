return {
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
          { name = "nvim_lsp" },    -- LSP (will be empty but won't cause errors)
        },
      }
    end,
  }
}