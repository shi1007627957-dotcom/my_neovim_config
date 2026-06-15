return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter", -- 在启动 Neovim 时加载
  dependencies = { {"nvim-tree/nvim-web-devicons"} }, -- 依赖图标插件
  config = function()
    require("dashboard").setup({
      theme = 'doom', -- 推荐使用 doom 主题，比较简约大气
      config = {
        header = {
          -- 这里可以放你喜欢的 ASCII 字符画，你可以去网上找其他的替换
          "                                   ",
          "                                   ",
          "                                   ",
          "   ⣟⢮⡳⡭⡪⡎⡧⡳⡱⡕⡧⡳⡱⡕⡧⡳⡱⡕⡧⣳   ",
          "   ⢟⢮⢳⢱⢣⢣⢣⢣⢣⢣⢣⢣⢣⢣⢣⢣⢣⢣⢣⢣⡣  ",
          "   ⠟⠜⠎⠇⠇⠇⠇⠇⠇⠇⠇⠇⠇⠇⠇⠇⠇⠇⠇⠇⠣  ",
          "                                   ",
          "          N E O V I M              ",
        },
        center = {
          -- 快捷菜单栏
          { action = "Telescope find_files", desc = " Find file",       icon = "🔍 ", key = "f" },
          { action = "Telescope oldfiles",   desc = " Recent files",    icon = "⏱️ ", key = "r" },
          { action = "Telescope live_grep",  desc = " Find text",       icon = "📝 ", key = "g" },
          { action = "Lazy",                 desc = " Lazy",            icon = "💤 ", key = "l" },
          { action = "qa",                   desc = " Quit",            icon = "❌ ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    })
  end,
}
