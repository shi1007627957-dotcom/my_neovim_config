return {
  "nvim-tree/nvim-tree.lua",
  -- 依赖一个图标插件，让文件前面显示漂亮的图标（如 lua图标、js图标）
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- 快捷键设置
  keys = {
    -- 之前设置了 leader 为空格，所以这里就是 按 空格 + e 打开/关闭文件树
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle File Explorer" },
  },
  config = function()
    -- 禁用 Neovim 自带的极简文件浏览器（为了防止冲突）
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- 初始化配置
    require("nvim-tree").setup({
      view = {
        width = 30,      -- 文件树的宽度
        side = "left",   -- 显示在左边
      },
      filters = {
        dotfiles = false, -- 是否隐藏以 . 开头的隐藏文件（建议 false，也就是显示）
      },
      git = {
        enable = true,    -- 如果是在 Git 仓库，会显示文件修改状态
      },
    })
  end,
}