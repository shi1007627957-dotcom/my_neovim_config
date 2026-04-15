return {
  -- 1. 主题 (Tokyonight)
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

 {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() 
      local configs = require("nvim-treesitter.configs") -- 这里是你报错的源头
      configs.setup({
          -- 你的具体配置写在这里
          ensure_installed = { "c","cpp","lua", "vim", "vimdoc", "query" },
          highlight = { enable = true },
      })
    end
  }

  -- 3. 文件模糊搜索 (Telescope) 带过滤功能
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    },
    opts = {
      defaults = {
        file_ignore_patterns = {
          ".git/",
          "node_modules/",
          "Library/",
          ".cache/"
        },
      },
    },
  },
} -- 就是因为你之前漏掉了这最后一个大括号！