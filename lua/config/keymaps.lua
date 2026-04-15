-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- 设置 Leader 键为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- 取消搜索高亮: 按 <leader> + nh
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- 窗口切换 (不用按 ctrl+w 了，直接 ctrl+a/s/w/d)
keymap.set("n", "<C-a>", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<C-s>", "<C-w>j", { desc = "Go to lower window" })
keymap.set("n", "<C-w>", "<C-w>k", { desc = "Go to upper window" })
keymap.set("n", "<C-d>", "<C-w>l", { desc = "Go to right window" })

-- 保持视觉模式下缩进后继续选中
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
