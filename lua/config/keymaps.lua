-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>xq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- NOTE: leader z change color scheme
-- vim.keymap.set('n', '<leader>z', ':Telescope colorscheme<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>cr', '<cmd>:cd ~/repos/<CR>', { desc = 'Change dir to [r]epo' })
vim.keymap.set('n', '<leader>cn', '<cmd>:cd ~/.config/nvim/<CR>', { desc = 'Change dir to [n]vim config' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<leader>wj', '<C-w><C-h>', { desc = 'window left' })
vim.keymap.set('n', '<leader>wl', '<C-w><C-l>', { desc = 'window right' })
vim.keymap.set('n', '<leader>wk', '<C-w><C-j>', { desc = 'window down' })
vim.keymap.set('n', '<leader>wi', '<C-w><C-k>', { desc = 'window up' })
vim.keymap.set('n', '<leader>ww', '<C-w>w', { desc = 'window switch' })
vim.keymap.set('n', '\\', '<C-w>w', { desc = 'window switch' })

-- Enhanced keybindings for better organization
-- Buffer navigation (unbind default J and use for most recently used buffer)
vim.keymap.set('n', 'J', '<C-^>', { desc = 'Switch to previous buffer (MRU)', silent = true })
vim.keymap.set('n', 'L', ':bnext<CR>', { desc = 'Next buffer', silent = true })

-- Buffer management
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Buffer [D]elete', silent = true })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Buffer [N]ext', silent = true })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Buffer [P]revious', silent = true })
vim.keymap.set('n', '<leader>ba', ':%bdelete|edit#<CR>', { desc = 'Buffer Delete [A]ll Others', silent = true })
vim.keymap.set('n', '<leader>bo', ':%bdelete|edit#<CR>', { desc = 'Buffer Delete [O]thers', silent = true })

-- File operations
vim.keymap.set('n', '<leader>fs', ':w<CR>', { desc = 'File [s]ave', silent = true })
vim.keymap.set('n', '<leader>fa', ':wa<CR>', { desc = 'File save [a]ll', silent = true })
vim.keymap.set('n', '<leader>fn', ':enew<CR>', { desc = 'File [N]ew', silent = true })
vim.keymap.set('n', '<leader>fo', function()
  require('conform').format { async = true, lsp_fallback = true }
end, { desc = 'File F[o]rmat' })

-- Open operations
vim.keymap.set('n', '<leader>ot', ':terminal<CR>', { desc = 'Open [T]erminal', silent = true })
vim.keymap.set('n', '<leader>ol', ':Lazy<CR>', { desc = 'Open [L]azy', silent = true })
vim.keymap.set('n', '<leader>om', ':Mason<CR>', { desc = 'Open [M]ason', silent = true })

-- UI toggles
vim.keymap.set('n', '<leader>tn', ':set number!<CR>', { desc = 'Toggle Line [n]umbers', silent = true })
vim.keymap.set('n', '<leader>tr', ':set relativenumber!<CR>', { desc = 'Toggle [r]elative Numbers', silent = true })
vim.keymap.set('n', '<leader>tw', ':set wrap!<CR>', { desc = 'Toggle Line [w]rap', silent = true })
vim.keymap.set('n', '<leader>ts', ':set spell!<CR>', { desc = 'Toggle [s]pell Check', silent = true })

-- Git operations (basic ones, gitsigns provides more)
vim.keymap.set('n', '<leader>gs', ':!git status<CR>', { desc = 'git [s]tatus', silent = true })
vim.keymap.set('n', '<leader>gl', ':!git log --oneline<CR>', { desc = 'Git [l]og', silent = true })
vim.keymap.set('n', '<leader>gd', ':!git diff<CR>', { desc = 'git [d]iff', silent = true })

-- vim.keymap.del('n',, opts?)
