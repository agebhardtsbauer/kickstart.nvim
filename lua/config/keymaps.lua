-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

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
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Enhanced keybindings for better organization
-- Buffer navigation (unbind default J and use for most recently used buffer)
vim.keymap.set('n', 'J', '<C-^>', { desc = 'Switch to previous buffer (MRU)', silent = true })
vim.keymap.set('n', 'L', ':bnext<CR>', { desc = 'Next buffer', silent = true })

-- Buffer management
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = '[B]uffer [D]elete', silent = true })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = '[B]uffer [N]ext', silent = true })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = '[B]uffer [P]revious', silent = true })
vim.keymap.set('n', '<leader>ba', ':%bdelete|edit#<CR>', { desc = '[B]uffer Delete [A]ll Others', silent = true })
vim.keymap.set('n', '<leader>bo', ':%bdelete|edit#<CR>', { desc = '[B]uffer Delete [O]thers', silent = true })

-- File operations
vim.keymap.set('n', '<leader>fs', ':w<CR>', { desc = '[F]ile [S]ave', silent = true })
vim.keymap.set('n', '<leader>fS', ':wa<CR>', { desc = '[F]ile [S]ave All', silent = true })
vim.keymap.set('n', '<leader>fn', ':enew<CR>', { desc = '[F]ile [N]ew', silent = true })
vim.keymap.set('n', '<leader>fo', function() require('conform').format { async = true, lsp_fallback = true } end, { desc = '[F]ile F[o]rmat' })

-- Common shortcuts
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file', silent = true })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit', silent = true })
vim.keymap.set('n', '<leader>x', ':x<CR>', { desc = 'Save and quit', silent = true })

-- Open operations
vim.keymap.set('n', '<leader>ot', ':terminal<CR>', { desc = '[O]pen [T]erminal', silent = true })
vim.keymap.set('n', '<leader>ol', ':Lazy<CR>', { desc = '[O]pen [L]azy', silent = true })
vim.keymap.set('n', '<leader>om', ':Mason<CR>', { desc = '[O]pen [M]ason', silent = true })

-- UI toggles
vim.keymap.set('n', '<leader>un', ':set number!<CR>', { desc = '[U]I Toggle Line [N]umbers', silent = true })
vim.keymap.set('n', '<leader>ur', ':set relativenumber!<CR>', { desc = '[U]I Toggle [R]elative Numbers', silent = true })
vim.keymap.set('n', '<leader>uw', ':set wrap!<CR>', { desc = '[U]I Toggle [W]rap', silent = true })
vim.keymap.set('n', '<leader>us', ':set spell!<CR>', { desc = '[U]I Toggle [S]pell', silent = true })

-- Git operations (basic ones, gitsigns provides more)
vim.keymap.set('n', '<leader>gs', ':!git status<CR>', { desc = '[G]it [S]tatus', silent = true })
vim.keymap.set('n', '<leader>gl', ':!git log --oneline<CR>', { desc = '[G]it [L]og', silent = true })
vim.keymap.set('n', '<leader>gd', ':!git diff<CR>', { desc = '[G]it [D]iff', silent = true })