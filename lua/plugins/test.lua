return {
  "mfussenegger/nvim-dap",
  dependencies = {
    -- 提供漂亮的调试 UI 界面
    "rcarriga/nvim-dap-ui",
    -- UI 的底层依赖
    "nvim-neotest/nvim-nio", 
    -- 桥接 Mason，帮你自动安装底层调试器
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
      local dap = require("dap")
      -- 自定义 C++ 调试启动行为
    dap.configurations.cpp = {
      {
        name = "自动运行当前同名可执行文件",
        type = "codelldb",
        request = "launch",
        program = function()
          -- 自动获取当前打开的不带后缀的文件名作为程序路径
          local exe = vim.fn.expand('%:p:r')
          -- 如果是在 Windows，加上 .exe 后缀
          if vim.fn.has('win32') == 1 then
              exe = exe .. '.exe'
          end
          return exe
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }
    -- 让 C 和 Rust 也共用这个配置
    dap.configurations.c = dap.configurations.cpp

    local dap = require("dap")
    local dapui = require("dapui")

    -- 1. 配置 Mason 自动安装 C++ 的调试适配器 (推荐使用 codelldb)
    require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb" }, -- 自动安装 codelldb
        automatic_installation = true,
        handlers = {}, -- 使用默认配置
    })

    -- 2. 配置 DAP UI
    dapui.setup()
    
    -- 3. 自动打开和关闭 UI 界面的钩子
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open() -- 开始调试时自动打开 UI
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close() -- 结束调试时自动关闭 UI
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- 4. 绑定类似 VS Code 的调试快捷键
    vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = "调试: 启动/继续" })
    vim.keymap.set('n', '<F9>', function() dap.toggle_breakpoint() end, { desc = "调试: 切换断点" })
    vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = "调试: 单步跳过" })
    vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = "调试: 单步进入" })
    vim.keymap.set('n', '<F12>', function() dap.step_out() end, { desc = "调试: 单步跳出" })
  end
}
