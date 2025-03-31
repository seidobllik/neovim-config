--[[ Core Configs ]]--
require("core.options")
require("core.keymaps")
--require("core.treesitter")
--require("core.lsp")
require("core.statusline")
--require("core.snippet")

--[[ Packages ]]--
require("packages.nvim-tree")

vim.g.colorscheme = "unokai"
vim.print("colorscheme (again): "..vim.g.colorscheme)
