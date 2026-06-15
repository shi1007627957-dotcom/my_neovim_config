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
     -- 使用 opts 代替 config 函数，Lazy 会自动、安全地帮你执行 setup
     opts = {
       ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query" },
       highlight = {
         enable = true,
       },
     },
   },

  -- 3. 文件模糊搜索 (Telescope) 带过滤功能
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
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
