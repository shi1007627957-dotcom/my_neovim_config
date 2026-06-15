return {
  -- 1. Mason (LSP 应用商店)
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- 2. Mason-LSPconfig (桥梁：让 Mason 自动安装 LSP)
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- 确保自动安装 clangd (C/C++ 的大脑)
        ensure_installed = { "clangd" },
      })
    end,
  },

-- 3. Nvim-LSPconfig (配置并启动 LSP)
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- 使用 Neovim 最新的原生 API 启动 clangd
      vim.lsp.enable("clangd")

      -- 设置几个方便的跳转快捷键（把光标放在函数上按）
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "跳转到定义 (Go to definition)" })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "悬浮显示文档/函数参数" })
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "重命名变量 (Rename)" })
    end,
  },
}
 

