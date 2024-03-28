return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- defaults
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        -- csharp
        "omnisharp",
        "csharpier",
        -- c-cpp
        "clangd",
        "clang-format",
        --haskell
        "haskell-language-server",
        --rust
        "rust-analyzer",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        -- FP
        "haskell",
        -- my first love but she sucks
        "c_sharp",
        -- why
        "java",
        -- low level
        "c",
        "cpp",
        "rust",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      "folke/neodev.nvim",
    },
    config = function()
      require "configs.dapui"
    end,
  },
  {
    "folke/neodev.nvim",
    opts = {},
    config = function()
      require "configs.neodev"
    end,
  },
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
  },
  {
    -- oh, java, god damn it
    "mfussenegger/nvim-jdtls",
    config = function()
      require "configs.jdtls"
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "Issafalcon/neotest-dotnet",
      "mrcjkb/neotest-haskell",
    },
    config = function()
      require "configs.neotest"
    end,
  },
}
