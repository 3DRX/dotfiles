require("configs.nvim-tree")
require("configs.luasnipConfig")
require("configs.lsp")
require("configs.comment")
require("configs.treesitter")
require("configs.lualine")
require("configs.colorscheme")
require("configs.telescope")
require("configs.indentline")
require("configs.colorizer")
require("configs.autotag")
require("configs.peek")
require("configs.copilot")
require("configs.bqf")

if vim.g.neovide then
    require("configs.neovide")
end
