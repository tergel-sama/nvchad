return {
  -- nvim surroung
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

  -- telescope configs
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = function()
      local tlsp = require "nvchad.configs.telescope"
      tlsp.pickers = vim.tbl_deep_extend("force", tlsp.pickers or {}, {
        find_files = {
          hidden = true, -- Show hidden files in find_files picker
        },
      })
      return tlsp
    end,
  },

  -- format on save
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  -- git stuff
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      return require "configs.gitsigns"
    end,
  },

  -- animate the indentscope
  {
    "echasnovski/mini.indentscope",
    version = "*",
    lazy = false,
    opts = require("configs.miniindentscope").opts,
    init = require("configs.miniindentscope").init,
  },

  -- animate the cursor and scrolling
  {
    "echasnovski/mini.animate",
    version = "*",
    lazy = false,
    opts = require "configs.minianimate",
  },

  -- lsp configs
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- lang syntax
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "go",
        "gomod",
        "gosum",
        "javascript",
      },
    },
  },
}
