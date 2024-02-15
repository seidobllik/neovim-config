local cmd = vim.cmd
local opt = vim.opt

-- Vim Commands.
cmd.colorscheme("slate")    -- Set color scheme.

-- Vim Options.
opt.number = true           -- Enable line numbers.
opt.relativenumber = true   -- Enable relative line numbers.
opt.wrap = false            -- Disable line wrapping.
opt.showmatch = true        -- Quickly flash matching brackets as you type.
opt.ignorecase = true       -- Ignore case when searching (not sure if this is working).
opt.shiftwidth = 4          -- Width of autoindents.
opt.tabstop = 4             -- Number of spaces in each tab.
opt.softtabstop = 4         -- See multiple spaces at tabstops so <BS> does the right thing.
opt.expandtab = true        -- Convert tabs into spaces.
opt.wildmode = "list:longest"   -- When more than one match, list all and complete till longest common str.
opt.autoindent = true       -- Indent automatically
opt.cursorline = true       -- Enables cursor line
opt.splitright = true       -- Split to the right on vertical
opt.splitbelow = true       -- Split below when horizontal
opt.formatoptions:append('cro') -- continue comments when going down a line, hit C-u to remove the added comment prefix
opt.sessionoptions:remove('options') -- don't save keymaps and local options
opt.foldlevelstart = 99     -- no auto folding

print("core.lua done")

