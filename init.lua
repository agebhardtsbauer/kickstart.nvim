--[[
=====================================================================
==================== MODULAR KICKSTART.NVIM =====================
=====================================================================

This configuration has been modularized for better organization.

Original structure moved to:
- lua/config/options.lua       - Vim options and settings
- lua/config/keymaps.lua       - Basic keymaps
- lua/config/autocommands.lua  - Autocommands
- lua/config/lazy-setup.lua    - Plugin manager setup

Plugin configurations remain in the main lazy.setup call below.
TODO: Further modularize plugins into separate files.

=====================================================================
--]]

-- Load core configuration modules
require 'config.options'
require 'config.keymaps'
require 'config.autocommands'
require 'config.lazy-setup'
-- require 'config.lazy' -- default lazy.nvim config
-- for lazy menu run :Lazy
-- to update plugins :Lazy update

require 'plugins.ui.nerdicons'

-- Add your LSP configurations here
-- For example, you can add:
-- clangd = {},
-- gopls = {},
-- pyright = {},
-- rust_analyzer = {},
-- tsserver = {},

--
-- NOTE: Here is where you install your plugins.
require('lazy').setup {
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  --
  require 'plugins.code.ai.inline.copilot',

  -- Moved to lua/plugins/motions/flash.lua
  require 'plugins.motions.flash',

  require 'plugins.ui.noice',
  require 'plugins.ui.whichkey',
  require 'plugins.ui.telescope',
  require 'plugins.ui.themes.catppuccin',
  require 'plugins.ui.comments', -- highlights for TODO: and NOTE:
  require 'plugins.ui.neotree',
  require 'plugins.ui.gitsigns', -- adds gitsigns recommend keymaps
  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  --    require('gitsigns').setup({ ... })
  -- See `:help gitsigns` to understand what the configuration keys do
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  --TODO: try removing this plugin, not sure what it does
  require 'plugins.code.mini',

  require 'plugins.code.treesitter',
  require 'plugins.code.nvimlspconfig',
  require 'plugins.code.conform',
  require 'plugins.code.gc-comment', -- motion "gc" to comment visual regions/lines

  require 'plugins.autocomplete.nvimcmp',
  --TODO: Try Blink instead of cmp
  -- require 'plugins.autocomplete.blink',

  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  { import = 'custom.plugins' },
}

-- NOTE: Plugins can also be added by using a table,
--
-- with the first argument being the link and the following
-- keys can be used to configure plugin behavior/loading/etc.
--
-- Use `opts = {}` to force a plugin to be loaded.
--
--  This is equivalent to:
--    require('Comment').setup({})
