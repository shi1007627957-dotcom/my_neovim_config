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
      local lspconfig = require("lspconfig")

      -- 启动 C/C++ 的 clangd
      lspconfig.clangd.setup({})

      -- 设置几个方便的跳转快捷键 (把光标放在函数上按)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "跳转到定义 (Go to definition)" })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "悬浮显示文档/函数参数" })
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "重命名变量 (Rename)" })
    end,
  },

  -- 4. 自动补全引擎 (Nvim-cmp)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- 让补全引擎能拿到 LSP 的数据
      "L3MON4D3/LuaSnip",     -- 代码片段引擎 (必须项)
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        -- 补全菜单的快捷键
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping.select_next_item(),     -- Tab 键往下选
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),   -- Shift+Tab 往上选
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- 回车确认补全
        }),
        -- 补全的数据来源
        sources = cmp.config.sources({
          { name = 'nvim_lsp' }, -- 开启代码智能提示来源
        })
      })
    end,
  },
}