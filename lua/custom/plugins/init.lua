-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Git conflict resolution
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    config = function()
      require('git-conflict').setup {
        default_mappings = false, -- Disable default mappings
        default_commands = true,
        disable_diagnostics = false,
        list_opener = 'copen',
        debug = false,
        highlights = {
          incoming = 'DiffAdd',
          current = 'DiffText',
        },
      }
      -- Custom mappings under <leader>g for git operations
      vim.keymap.set('n', '<leader>gc', 'which_key_ignore', { desc = 'git [c]onflict' })
      vim.keymap.set('n', '<leader>gco', '<cmd>GitConflictChooseOurs<cr>', { desc = 'Choose Ours (Current)' })
      vim.keymap.set('n', '<leader>gct', '<cmd>GitConflictChooseTheirs<cr>', { desc = 'Choose Theirs (Incoming)' })
      vim.keymap.set('n', '<leader>gcb', '<cmd>GitConflictChooseBoth<cr>', { desc = 'Choose Both' })
      vim.keymap.set('n', '<leader>gcn', '<cmd>GitConflictChooseNone<cr>', { desc = 'Choose None' })
      vim.keymap.set('n', '<leader>gcj', '<cmd>GitConflictNextConflict<cr>', { desc = 'Next Conflict' })
      vim.keymap.set('n', '<leader>gck', '<cmd>GitConflictPrevConflict<cr>', { desc = 'Previous Conflict' })
      vim.keymap.set('n', '<leader>gcl', '<cmd>GitConflictListQf<cr>', { desc = 'List Conflicts' })
    end,
  },

  -- Trouble diagnostics
  {
    'folke/trouble.nvim',
    opts = {},
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
}
