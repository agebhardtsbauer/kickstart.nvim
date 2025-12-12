-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>of', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
    { '<leader>tf', ':Neotree toggle<CR>', { desc = 'Toggle Neotree' } },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          -- \\  switch window
          -- ['\\'] = 'focus',
          -- ['\\'] = 'focus_preview',
          ['<space>'] = '',
          -- ['<cr>'] = 'open',
          -- ['<c-x>'] = 'open_split',
          -- ['<c-v>'] = 'open_vsplit',
          -- ['<c-t>'] = 'open_tabnew',
          -- ['<c-c>'] = 'close_node',
          -- ['<bs>'] = 'navigate_up',
          -- ['<tab>'] = 'next_source',
          -- ['<s-tab>'] = 'prev_source',
          -- ['\\'] = 'close_window',
          -- [] = '
          -- ['<enter>'] = 'open',
          -- ['<cr>'] = 'open',
          -- ['<c-x>'] = 'open_split',
          -- ['<c-v>'] = 'open_vsplit',
          -- ['<c-t>'] = 'open_tabnew',
          -- ['<c-c>'] = 'close_window',
        },
      },
    },
  },
}
