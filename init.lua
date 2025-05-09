if vim.g.vscode then
    -- empty config.
else
    --[[ Core Configs ]] --
    require("core.options")
    require("core.keymaps")
    require("core.statusline")
    require("core.lsp")

    --[[ Packages ]] --
    require("packages.nvim-tree")
    require("packages.lualine")
end
