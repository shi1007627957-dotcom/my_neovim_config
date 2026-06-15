return {
  {
    "saghen/blink.cmp",
    version = "*",
    opts = {
      keymap = {
        preset = "default",
        -- 让上下键回归光标移动
        ["<Up>"] = { "fallback" },
        ["<Down>"] = { "fallback" },
        -- 让 Tab 键负责补全选择
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        --按enter键选中
        ["<CR>"] = { "accept", "fallback" },
      },
    },
  },
}
