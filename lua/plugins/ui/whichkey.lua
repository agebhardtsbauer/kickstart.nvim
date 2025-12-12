return {
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    local wk = require 'which-key'
    wk.opts = {
      icons = {
        mappings = false, -- Disable icons
      },
      triggers = {
        { '<auto>', mode = 'nso' }, -- automatically setup triggers
      },
    }

    wk.setup(wk.opts)
    require('which-key').setup()

    --NOTE: Old Which-Key configuration

    wk.add {
      { '<leader>b', group = '[b]uffer' },
      { '<leader>f', group = '[f]ile' }, -- group}
      { '<leader>c', group = '[c]ode' },
      { '<leader>f', group = '[F]ile' },
      { '<leader>g', group = '[g]it' },
      { '<leader>gh', group = 'git [h]unk' },
      { '<leader>o', group = '[o]pen' },
      { '<leader>r', group = '[r]ename' },
      { '<leader>s', group = '[s]earch' },
      { '<leader>t', group = '[t]oggle' },
      { '<leader>w', group = '[w]indow' },
      { '<leader>x', group = '[x]diagnostics' },

      -- NOTE: Other Which-Key Examples

      -- { '<leader>b', group = '[b]uffer', desc = 'fileb' }, -- group
      -- { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find File', mode = 'n' },
      -- {
      --   '<leader>fb',
      --   function()
      --     print 'hello'
      --   end,
      --   desc = 'Foobar',
      -- },
      -- { '<leader>fn', desc = 'New File' },
      -- { '<leader>f1', hidden = true }, -- hide this keymap
      -- { '<leader>w', proxy = '<c-w>', group = 'windows' }, -- proxy to window mappings
      -- {
      --   '<leader>b',
      --   group = 'buffers',
      --   expand = function()
      --     return require('which-key.extras').expand.buf()
      --   end,
      -- },
      {
        mode = { 'v' },
        { '<leader>gh', group = 'git [h]unk' },
        -- Nested mappings are allowed and can be added in any order
        -- Most attributes can be inherited or overridden on any level
        -- There's no limit to the depth of nesting
        -- mode = { 'n', 'v' }, -- NORMAL and VISUAL mode
        -- { '<leader>q', '<cmd>q<cr>', desc = 'Quit' }, -- no need to specify mode since it's inherited
        -- { '<leader>w', '<cmd>w<cr>', desc = 'Write' },
      },
    }
  end,
}
