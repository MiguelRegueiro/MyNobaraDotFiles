-- Disable all language servers
-- Commented out the original configuration to prevent loading LSP servers

--[[
require("nvchad.configs.lspconfig").defaults()

local servers = { 
  "html",           -- HTML
  "cssls",          -- CSS
  "ts_ls",          -- JavaScript/TypeScript (formerly tsserver)
  "pyright",        -- Python
  "clangd",         -- C/C++
  "jdtls",          -- Java
  "sqlls",          -- SQL
  "lua_ls",         -- Lua (lua-language-server)
  "rust_analyzer",  -- Rust
}

-- Enable all language servers
vim.lsp.enable(servers)

-- Optional: Custom configurations for specific servers
local configs = require("nvchad.configs.lspconfig")
local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"

-- Python LSP with additional settings
lspconfig.pyright.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  },
}

-- JavaScript/TypeScript LSP
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- HTML LSP
lspconfig.html.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- CSS LSP
lspconfig.cssls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- C/C++ LSP (clangd)
lspconfig.clangd.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
  init_options = {
    usePlaceholders = true,
  },
}

-- Java LSP (jdtls)
lspconfig.jdtls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      format = {
        enabled = true,
      },
    },
    signatureHelp = { enabled = true },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
    },
    contentProvider = { preferred = "fernflower" },
    extendedClientCapabilities = {
      progressReportProvider = false,
    },
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
  },
}

-- SQL LSP
lspconfig.sqlls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- Lua LSP (lua-language-server)
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        version = 'Lua 5.4',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
      completion = {
        callSnippet = "Replace",
      },
    },
  },
}

-- Rust LSP (rust-analyzer)
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "self",
      },
      cargo = {
        loadOutDirsFromCheck = true,
      },
      procMacro = {
        enable = true,
      },
      checkOnSave = true,
      check = {
        command = "clippy",
      },
      completion = {
        postfix = {
          enable = false,
        },
      },
      hover = {
        actions = {
          enable = true,
        },
      },
      inlayHints = {
        enable = true,
        showParameterNames = true,
        parameterHintsPrefix = "<- ",
        otherHintsPrefix = "=> ",
      },
    },
  },
}
]]