-- 自动安装 lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- 最新稳定版
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 加载 lua/plugins 目录下的所有插件
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  checker = { enabled = true }, -- 自动检查插件更新
})