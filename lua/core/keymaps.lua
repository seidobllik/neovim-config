----------------------
--[[ Key Bindings ]]--
----------------------
vim.g.mapleader = vim.keycode("<space>")
vim.g.maplocalleader = vim.keycode("<cr>")



-------------------------------------
----------[[ Normal Mode ]]----------
-------------------------------------
-- Spell-check on/off
vim.api.nvim_set_keymap('n', '<C-z>', ':setlocal spell! spelllang=en_us<CR>', { noremap = true, silent = true })

-- Opening a file explorer
vim.api.nvim_set_keymap('n', '<leader>e', ':Lex<CR>', { noremap = true, silent = true })

-- Opening a file from explorer
vim.api.nvim_set_keymap('n', '<leader>o', ':Explore<CR>', { noremap = true, silent = true })

-- Opening a terminal window
vim.api.nvim_set_keymap('n', '<C-t>', ':ter<CR>', { noremap = true, silent = true })

-- Split the window in Vim
vim.api.nvim_set_keymap('n', '<leader>y', ':split<space>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':vsplit<space>', { noremap = true, silent = true })

-- Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Resize split windows using arrow keys
vim.api.nvim_set_keymap('n', '<A-Up>', '<C-w>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Down>', '<C-w>-', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Left>', '<C-w><', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Right>', '<C-w>>', { noremap = true, silent = true })

-- Moving between tabs
vim.api.nvim_set_keymap('n', '<leader>t', 'gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>T', 'gT', { noremap = true, silent = true })

-- Duplicate current buffer to a new tab
vim.api.nvim_set_keymap('n', '<leader>n', ':tab sb<CR>', { noremap = true, silent = true })

-- Quitting and saving a file using CTRL+q
vim.api.nvim_set_keymap('n', '<C-q>', ':wq<CR>', { noremap = true, silent = true })

-- Surround word with a wanted character
vim.api.nvim_set_keymap('n', '<leader>sw', '<cmd>echo "Press a character: " | let c = nr2char(getchar()) | exec "normal viwo\\ei" . c . "\\eea" . c . "\\e" | redraw<CR>', { noremap = true, silent = true })

-- Replace all occurrences of a word
vim.api.nvim_set_keymap('n', '<leader>rw', ':%s/\\<<C-r><C-w>\\>//g<left><left>', { noremap = true, silent = true })

-- Seeing the registers
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>registers<CR>', { noremap = true, silent = true })

-- Disable search highlighting with escape key.
vim.api.nvim_set_keymap('n', '<Esc>', ':nohl<CR>', { noremap = true, silent = true })




-------------------------------------
----------[[ Insert Mode ]]----------
-------------------------------------
-- Type jj to exit insert mode quickly
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })




-------------------------------------
----------[[ Visual Mode ]]----------
-------------------------------------
-- Moving lines in visual mode
vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'K', ':m \'>-2<CR>gv=gv', { noremap = true, silent = true })




---------------------------------------
----------[[ Terminal Mode ]]----------
---------------------------------------
-- Closing the terminal window
vim.api.nvim_set_keymap('t', '<C-t>', 'exit<CR>', { noremap = true, silent = true })

-- CTRL+I or Esc to make the terminal scrollable and I to input mode
vim.api.nvim_set_keymap('t', '<C-i>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
