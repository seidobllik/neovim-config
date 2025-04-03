----------------------
--[[ Key Bindings ]]--
----------------------
vim.g.mapleader = vim.keycode("<space>")
vim.g.maplocalleader = vim.keycode("<cr>")



-------------------------------------
----------[[ Normal Mode ]]----------
-------------------------------------
-- Spell-check on/off
vim.api.nvim_set_keymap('n', '<C-z>', ':setlocal spell! spelllang=en_us<CR>', { noremap = true, silent = true, desc = 'Toggle Spell check' })

-- Opening a file explorer
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = 'Toggle NvimTree' })
vim.api.nvim_set_keymap('n', '<leader>E', ':NvimTreeOpen .<CR>', { noremap = true, silent = true, desc = 'Open pwd in NvimTree' })

-- Opening a terminal window
vim.api.nvim_set_keymap('n', '<C-t>', ':ter<CR>', { noremap = true, silent = true, desc = 'Open a terminal window' })

-- Split the window in Vim
vim.api.nvim_set_keymap('n', '<leader>y', ':split<space>', { noremap = true, silent = true, desc = 'Split window vertically' })
vim.api.nvim_set_keymap('n', '<leader>x', ':vsplit<space>', { noremap = true, silent = true, desc = 'Split window horizontally' })

-- Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true, desc = 'Navigate to window below' })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true, desc = 'Navigate to window above' })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true, desc = 'Navigate to window left' })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true, desc = 'Navigate to window right' })

-- Resize split windows using arrow keys
vim.api.nvim_set_keymap('n', '<A-Up>', '<C-w>+', { noremap = true, silent = true, desc = 'Resize window y+' })
vim.api.nvim_set_keymap('n', '<A-Down>', '<C-w>-', { noremap = true, silent = true, desc = 'Resize window y-' })
vim.api.nvim_set_keymap('n', '<A-Left>', '<C-w><', { noremap = true, silent = true, desc = 'Resize window x-' })
vim.api.nvim_set_keymap('n', '<A-Right>', '<C-w>>', { noremap = true, silent = true, desc = 'Resize window x+' })

-- Moving between tabs
vim.api.nvim_set_keymap('n', '<leader>t', 'gt', { noremap = true, silent = true, desc = 'Navigate to next tab' })
vim.api.nvim_set_keymap('n', '<leader>T', 'gT', { noremap = true, silent = true, desc = 'Navigate to previous tab' })

-- Duplicate current buffer to a new tab
vim.api.nvim_set_keymap('n', '<leader>n', ':tab sb<CR>', { noremap = true, silent = true, desc = 'Duplicate buffer to new tab' })

-- Moving between buffers
vim.api.nvim_set_keymap('n', '<leader>b', ':bn<CR>', { noremap = true, silent = true, desc = 'Switch to next buffer' })
vim.api.nvim_set_keymap('n', '<leader>B', ':bp<CR>', { noremap = true, silent = true, desc = 'Switch to previous buffer' })

-- Quitting and saving a file using CTRL+q
vim.api.nvim_set_keymap('n', '<C-q>', ':wq<CR>', { noremap = true, silent = true, desc = 'Save file and quit' })

-- Surround word with a wanted character
vim.api.nvim_set_keymap('n', '<leader>sw', '<cmd>echo "Press a character: " | let c = nr2char(getchar()) | exec "normal viwo\\ei" . c . "\\eea" . c . "\\e" | redraw<CR>', { noremap = true, silent = true, desc = 'Surround word with a char' })

-- Replace all occurrences of a word
vim.api.nvim_set_keymap('n', '<leader>rw', ':%s/\\<<C-r><C-w>\\>//g<left><left>', { noremap = true, silent = true, desc = 'Replace all occurrences of a word' })

-- Seeing the registers
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>registers<CR>', { noremap = true, silent = true, desc = 'List the registers' })

-- Disable search highlighting with escape key.
vim.api.nvim_set_keymap('n', '<Esc>', ':nohl<CR>', { noremap = true, silent = true, desc = 'Disable search highlighting' })




-------------------------------------
----------[[ Insert Mode ]]----------
-------------------------------------
-- Type jj to exit insert mode quickly
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true, desc = 'Exit insert mode' })




-------------------------------------
----------[[ Visual Mode ]]----------
-------------------------------------
-- Moving lines in visual mode
vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true, desc = 'Move line down in visual mode' })
vim.api.nvim_set_keymap('v', 'K', ':m \'>-2<CR>gv=gv', { noremap = true, silent = true, desc = 'Move line up in visual mode' })




---------------------------------------
----------[[ Terminal Mode ]]----------
---------------------------------------
-- Closing the terminal window
vim.api.nvim_set_keymap('t', '<C-t>', 'exit<CR>', { noremap = true, silent = true, desc = 'Close the terminal' })

-- CTRL+I or Esc to make the terminal scrollable and I to input mode
vim.api.nvim_set_keymap('t', '<C-i>', '<C-\\><C-n>', { noremap = true, silent = true, desc = 'Enter normal mode from terminal' })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true, desc = 'Enter normal mode from terminal' })



-----------------------------------------
----------[[ Neovide Specific ]]----------
------------------------------------------
if vim.g.neovide == true then
    local scale_delta = 0.01
    local function modify_scale(factor)
        if factor == 0 then
            scale = 1
        else
            scale = vim.g.neovide_scale_factor
        end
        vim.g.neovide_scale_factor = scale + factor
    end
    vim.keymap.set('n', '<C-=>', function() modify_scale(scale_delta) end, { desc = 'Scale up' })
    vim.keymap.set('n', '<C-->', function() modify_scale(-scale_delta) end, { desc = 'Scale down' })
    vim.keymap.set('n', '<C-0>', function() modify_scale(0) end, { desc = 'Reset Scale' })
end

