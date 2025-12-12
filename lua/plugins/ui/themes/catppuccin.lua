return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'catppuccin'
  end,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      styles = {},
      color_overrides = {
        mocha = {
          -- base = '#10101b',
          -- mantle = '#090909',
          base = '#090913',
          mantle = '#10101c',
          crust = '#1e1e2e',
        },
      },
    }
  end,
}
