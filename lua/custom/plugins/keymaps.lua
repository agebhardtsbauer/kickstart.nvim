if true then
  return {}
end

local map = vim.keymap.set

map('n', '<leader>z', ':Telescope colorscheme<CR>')
