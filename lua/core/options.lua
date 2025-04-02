----------------------------------------------
--[[ general options (critical, necessary)]]--
----------------------------------------------
vim.o.completeopt = "menu,menuone,popup,fuzzy" -- modern completion menu

vim.o.foldenable = true   -- enable fold
vim.o.foldlevel = 99      -- start editing with all folds opened
vim.o.foldmethod = "expr" -- use tree-sitter for folding method
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"



----------------------------
--[[ Modifiable options ]]--
----------------------------
vim.cmd.colorscheme("unokai")

vim.g.loaded_netrw = true   -- Disable netrw in favor or nvim-tree.
vim.g.loaded_netrwPlugin = true

vim.o.termguicolors = true  -- enable rgb colors

vim.o.cursorline = true     -- enable cursor line
vim.o.cursorcolumn = true   -- enable cursor column

vim.o.number = true         -- enable line number
vim.o.relativenumber = true -- and relative line number

vim.o.signcolumn = "yes"    -- always show sign column

vim.o.pumheight = 10        -- max height of completion menu

vim.o.list = true           -- use special characters to represent things like tabs or trailing spaces
vim.opt.listchars = {       -- NOTE: using `vim.opt` instead of `vim.o` to pass rich object
    tab = "▏ ",
    trail = "·",
    extends = "»",
    precedes = "«",
}

vim.opt.diffopt:append("linematch:60") -- second stage diff to align lines

vim.o.confirm = true     -- show dialog for unsaved file(s) before quit
vim.o.updatetime = 200   -- save swap file with 200ms debouncing

vim.o.ignorecase = true  -- case-insensitive search
vim.o.smartcase = true   -- , until search pattern contains upper case characters

vim.o.smartindent = true -- auto-indenting when starting a new line
vim.o.shiftround = true  -- round indent to multiple of 'shiftwidth'
vim.o.shiftwidth = 0     -- 0 to follow the 'tabstop' value
vim.o.tabstop = 4        -- tab width
vim.o.expandtab = true   -- replace tabs with spaces.

vim.o.undofile = true    -- enable persistent undo
vim.o.undolevels = 10000 -- 10x more undo levels

vim.opt.path = "**"        -- Include subfolders in searches.

vim.o.wrap = false          -- Do not wrap lines of text.
vim.o.showmode = false      -- Disable showmode - the status line already shows it.

vim.opt.clipboard = "unnamedplus"



---------------------------------------------------------
--[[ Basic auto-completion. (from help: autocomplete) ]]--
---------------------------------------------------------
  local triggers = {'.'}
  vim.api.nvim_create_autocmd('InsertCharPre', {
    buffer = vim.api.nvim_get_current_buf(),
    callback = function()
      if vim.fn.pumvisible() == 1 or vim.fn.state('m') == 'm' then
        return
      end
      local char = vim.v.char
      if vim.list_contains(triggers, char) then
        local key = vim.keycode('<C-x><C-n>')
        vim.api.nvim_feedkeys(key, 'm', false)
      end
    end
  })

