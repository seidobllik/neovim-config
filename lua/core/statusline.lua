---@return string
local function mode()
	local key = vim.fn.mode()
    local modes = {
        ["n"] = "NORMAL",
        ["V"] = "VISUAL LINE",
        ["v"] = "VISUAL",
        ["i"] = "INSERT",
        ["<C-V>"] = "V-BLOCK",
        ["R"] = "REPLACE",
        ["s"] = "SELECT",
        ["t"] = "TERMINAL",
        ["c"] = "COMMAND",
        ["!"] = "SHELL",
    }
    return string.format("[%s]", modes[key])
end

---@return string
local function spell_check()
    if vim.o.spell then
        return "[SPELL]"
    else
        return ""
    end
end

---Show attached LSP clients in `[name1, name2]` format.
---Long server names will be modified. For example, `lua-language-server` will be shorten to `lua-ls`
---Returns an empty string if there aren't any attached LSP clients.
---@return string
local function lsp_status()
    local attached_clients = vim.lsp.get_clients({ bufnr = 0 })
    if #attached_clients == 0 then
        return "[no lsp]"
    end
    local names = vim.iter(attached_clients)
        :map(function(client)
            local name = client.name:gsub("language.server", "ls")
            return name
        end)
        :totable()
    return "[" .. table.concat(names, ", ") .. "]"
end

-- Build statusline string.
---@return string
function _G.statusline()
    return table.concat({
        "%2*",
        mode(),
        " ",
        spell_check(),
        "%1* ",
        "%3*<- %f -> ",
        "%4*%m",
        "%=",
        lsp_status(),
        " ",
        "%h%r",
        "%4*%c/%l/%L ",
        "%1*|%y ",
        "%4*%P ",
        "%3*t:$%n ",
    }, "")
end

-- Set up highlight groups used by statusline.
vim.api.nvim_set_hl(0, "User1", {fg = "white", bg = "black"})
vim.api.nvim_set_hl(0, "User2", {fg = "black", bg = "lightgreen"})
vim.api.nvim_set_hl(0, "User3", {fg = "lightcyan", bg = "black"})
vim.api.nvim_set_hl(0, "User4", {fg = "green", bg = "black"})

vim.o.statusline = "%{%v:lua._G.statusline()%}"
