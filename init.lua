if vim.fn.has("nvim-0.11") == 0 then
    vim.notify("This vim config only supports Neovim 0.11+", vim.log.levels.ERROR)
    return
end

require("core.options")
require("core.keymaps")
require("core.treesitter")
require("core.lsp")
require("core.statusline")
require("core.snippet")
require("core.nvim-tree")
