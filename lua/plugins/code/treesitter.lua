return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'vim',
      'vimdoc',
      -- Web development
      'javascript',
      'typescript',
      'tsx',
      'css',
      'scss',
      'json',
      'yaml',
      -- Systems programming
      'rust',
      'go',
      'python',
      'java',
      'cpp',
      -- DevOps/Config
      'dockerfile',
      'toml',
      'sql',
      'regex',
      -- Others
      'git_config',
      'gitignore',
      'comment',
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },

    -- Incremental selection based on the named nodes from the grammar.
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<C-space>',
        node_incremental = '<C-space>',
        scope_incremental = false,
        node_decremental = '<bs>',
      },
    },

    -- Textobjects for better code navigation
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['ai'] = '@conditional.outer',
          ['ii'] = '@conditional.inner',
          ['al'] = '@loop.outer',
          ['il'] = '@loop.inner',
          ['ak'] = '@block.outer',
          ['ik'] = '@block.inner',
          ['as'] = '@statement.outer',
          ['is'] = '@statement.inner',
          ['ad'] = '@comment.outer',
          ['id'] = '@comment.inner',
          ['am'] = '@call.outer',
          ['im'] = '@call.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']f'] = '@function.outer',
          [']c'] = '@class.outer',
          [']a'] = '@parameter.inner',
          [']i'] = '@conditional.outer',
          [']l'] = '@loop.outer',
        },
        goto_next_end = {
          [']F'] = '@function.outer',
          [']C'] = '@class.outer',
          [']A'] = '@parameter.inner',
          [']I'] = '@conditional.outer',
          [']L'] = '@loop.outer',
        },
        goto_previous_start = {
          ['[f'] = '@function.outer',
          ['[c'] = '@class.outer',
          ['[a'] = '@parameter.inner',
          ['[i'] = '@conditional.outer',
          ['[l'] = '@loop.outer',
        },
        goto_previous_end = {
          ['[F'] = '@function.outer',
          ['[C'] = '@class.outer',
          ['[A'] = '@parameter.inner',
          ['[I'] = '@conditional.outer',
          ['[L'] = '@loop.outer',
        },
      },
      -- TODO don't know if I want to enable swapping
      -- swap = {
      --   enable = true,
      --   swap_next = {
      --     ['<leader>a'] = '@parameter.inner',
      --     ['<leader>f'] = '@function.outer',
      --   },
      --   swap_previous = {
      --     ['<leader>A'] = '@parameter.inner',
      --     ['<leader>F'] = '@function.outer',
      --   },
      -- },
    },
  },
  config = function(_, opts)
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

    -- Prefer git instead of curl in order to improve connectivity in some environments
    require('nvim-treesitter.install').prefer_git = true
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)

    -- Treesitter enhancements now enabled:
    --   ✓ Incremental selection: Use <C-space> to expand selection, <bs> to shrink
    --   ✓ Textobjects: af/if for functions, ac/ic for classes, aa/ia for parameters, etc.
    --   ✓ Movement: ]f/[f for functions, ]c/[c for classes, ]a/[a for parameters, etc.
    --   ✓ Swapping: <leader>a to swap parameters, <leader>f to swap functions
    --   ✓ Expanded parser support for web dev, systems programming, and DevOps
    --
    -- For more features, explore:
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  end,
}
