-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- 行号
opt.number = true         -- 显示行号
opt.relativenumber = true -- 相对行号

-- 缩进 (设置为 4 个空格，可按需改为 2)
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- 搜索
opt.ignorecase = true     -- 忽略大小写
opt.smartcase = true      -- 如果有大写字母则精确匹配

-- 外观
opt.termguicolors = true  -- 开启真彩色
opt.cursorline = true     -- 高亮当前行
opt.signcolumn = "yes"    -- 始终显示左侧图标列

-- 剪贴板 (与系统剪贴板同步)
opt.clipboard = "unnamedplus"

-- 其他
opt.updatetime = 250      -- 降低更新时间，加快响应
opt.splitright = true     -- 垂直分割在右侧
opt.splitbelow = true     -- 水平分割在下方
