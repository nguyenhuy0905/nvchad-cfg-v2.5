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
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      hint_prefix = "👉",
      doc_lines = 0,
      max_height = 3,
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require "configs.lspsaga"
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
  },
  {
    "ms-jpq/coq_nvim",
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "BufEnter",
    config = function()
      require "configs.harpoon"
    end,
  },
  {
    "ggandor/leap.nvim",
    event = "BufEnter",
    config = function()
      require "configs.leap"
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
        -- openscad
        "openscad-lsp",
        -- bash
        "bash-language-server",
        -- snek
        "debugpy",
        "basedpyright",
        "ruff",
        "ruff-lsp",
        -- markdown
        "marksman",
        "vale",
        -- csharp
        "omnisharp",
        "csharpier",
        "netcoredbg",
        -- java
        "jdtls",
        "java-debug-adapter",
        -- c-cpp
        "clangd",
        "clang-format",
        "cmake-language-server",
        "checkmake",
        "cmake",
        "cmakelang",
        "codelldb",
        -- xml
        "lemminx",
        "xmlformatter",
        --haskell
        "haskell-language-server",
        --rust
        "rust-analyzer",
        -- perl
        "perlnavigator",
        -- docker
        "dockerfile-language-server",
        "docker-compose-language-service",
        -- sql
        "sqls",
      },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "luukvbaal/statuscol.nvim",
    },
    config = function()
      require "configs.ufo"
    end,
  },
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      local builtin = require "statuscol.builtin"
      require("statuscol").setup {
        relculright = true,
        segments = {
          { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
          { text = { "%s" }, click = "v:lua.ScSa" },
          { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
        },
      }
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
      require "configs.neogit"
    end,
  },
  {
    "karb94/neoscroll.nvim",
    lazy = false,
    config = function()
      require("neoscroll").setup {
        easing_function = "circular",
      }
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    configs = function()
      require "configs.treesitter"
    end,
  },
  {
    "RRethy/vim-illuminate",
    event = "BufEnter",
  },
  {
    "mfussenegger/nvim-dap",
    lazy = "VeryLazy",
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
    "mfussenegger/nvim-lint",
    config = function()
      require "configs.lint"
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
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "configs.trouble"
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require "configs.notify"
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require "configs.noice"
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
      "nvim-neotest/neotest-python",
      "rcasia/neotest-java",
      "rouge8/neotest-rust",
    },
    config = function()
      require "configs.neotest"
    end,
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    ft = "norg",
    -- put any other flags you wanted to pass to lazy here!
    config = function()
      require "configs.neorg"
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
      "BufReadPre "
        .. vim.fn.expand "~"
        .. "/Obsidian/GTK/**.md",
      -- "BufNewFile path/to/my-vault/**.md",
    },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      -- Others
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter",
    },
    opts = {
      workspaces = {
        {
          name = "GTK",
          path = "~/Obsidian/GTK",
        },
        -- {
        --   name = "work",
        --   path = "~/vaults/work",
        -- },
      },
    },
    config = function()
      require "configs.obsidian"
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
    },
    event = "BufEnter",
    config = function()
      require "configs.todo-comments"
    end,
  },
  {
    "danymat/neogen",
    event = "LspAttach",
    config = function()
      require "configs.neogen"
    end,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
  -- different, more robust tools for some languages
  {
    -- oh, java, god damn it
    "mfussenegger/nvim-jdtls",
    config = function()
      require "configs.jdtls"
    end,
  },
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    ft = { "c_sharp" },
    dependencies = {
      "neovim/nvim-lspconfig",
    },
  },
  -- {
  --   "Decodetalkers/csharpls-extended-lsp.nvim",
  --   ft = { "c_sharp" },
  --   dependencies = {
  --     "neovim/nvim-lspconfig",
  --   },
  -- },
  {
    "mfussenegger/nvim-dap-python",
    ft = { "python" },
    config = function()
      require("dap-python").setup "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").test_runner = "pytest"
    end,
  },
  {
    "mistricky/codesnap.nvim",
    build = "make build_generator",
    lazy = "true",
    version = "^1",
    cmd = "CodeSnap",
    config = function()
      require("codesnap").setup {
        mac_window_bar = false,
        code_font_family = "JetBrainsMono Nerd Font",
        bg_theme = "summer",
      }
    end,
  },
  -- {
  --   "mrcjkb/rustaceanvim",
  --   version = "^4", -- Recommended
  --   ft = { "rust" },
  --   config = function()
  --     require "configs.rust"
  --   end,
  -- },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
