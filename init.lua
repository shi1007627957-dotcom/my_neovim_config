
-- 按顺序加载配置
require("config.options")
require("config.keymaps")
require("config.lazy")
-- 开启自动切换当前工作目录 (Current Working Directory)
vim.opt.autochdir = true
-- 按下 F5 一键保存、编译、运行当前 C++ 文件
vim.keymap.set('n', '<F5>', function()
    -- 1. 强制保存当前文件
    vim.cmd('w')

    -- 2. 获取绝对路径，彻底解决找不到文件的问题！
    local filepath = vim.fn.expand('%:p')       -- 绝对路径 (例: /Users/xxx/Desktop/c++/test3.cpp)
    local filedir = vim.fn.expand('%:p:h')      -- 文件所在文件夹 (例: /Users/xxx/Desktop/c++/)
    local filenoext = vim.fn.expand('%:p:r')    -- 不带后缀的绝对路径 (例: /Users/xxx/Desktop/c++/test3)

    -- 3. 组装最稳妥的编译运行命令 (用引号包裹路径，防止文件夹名字有空格)
    local cmd = string.format('cd "%s" && g++ "%s" -o "%s" && "%s"', filedir, filepath, filenoext, filenoext)

    -- 4. 在下方分屏打开终端，并执行命令
    vim.cmd('botright 15split') -- botright 确保在最下方打开，15 是高度
    vim.cmd('term ' .. cmd)     -- 运行终端命令
    vim.cmd('startinsert')      -- 自动进入输入模式，方便你输入 cin 的数据
end, { desc = 'Compile and Run C++' })




-- 设置自动命令，在 Neovim 启动时触发
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        -- argc() == 0 表示你是直接输入 `nvim` 打开的，没有跟具体文件名
        if vim.fn.argc() == 0 then
            -- 你的目标路径 (注意处理路径中的空格)
            local target_dir = vim.fn.expand("~/Desktop/code\\ project")
            
            -- 切换 Neovim 的当前工作目录
            vim.api.nvim_set_current_dir(target_dir)
            
            -- 可选：如果你使用了 nvim-tree 插件，可以自动打开它
            -- vim.cmd("NvimTreeOpen")
            
            -- 可选：如果你使用了 neo-tree 插件，可以自动打开它
            -- vim.cmd("Neotree show")
        end
    end
})
--在nvim的文件中查询特定词后，取消查找结果高亮
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
--开启nvim的模糊搜索
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true   -- 默认高亮搜索结果
vim.o.incsearch = true  -- 输入时就开始实时跳转到匹配点
