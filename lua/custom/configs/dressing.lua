return {
  input = {
    -- Set to false to disable the vim.ui.input implementation
    enabled = true,

    -- Default prompt string
    default_prompt = 'Input:',

    -- Can be 'left', 'right', or 'center'
    prompt_align = 'left',

    -- When true, <Esc> will close the modal
    insert_only = true,

    -- When true, input will start in insert mode.
    start_in_insert = true,

    -- These are passed to nvim_open_win
    anchor = 'SW',
    border = 'rounded',
    -- 'editor' and 'win' will default to being centered
    relative = 'cursor',

    -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    prefer_width = 20,
    width = nil,
    -- min_width and max_width can be a list of mixed types.
    -- min_width = {20, 0.2} means 'the greater of 20 columns or 20% of total'
    max_width = { 140, 0.9 },
    min_width = { 10, 0.1 },

    win_options = {
      -- Window transparency (0-100)
      winblend = 0,
      -- Change default highlight groups (see :help winhl)
      winhighlight = 'Normal:FloatBackground',
    },

    -- Set to `false` to disable
    mappings = {
      n = {
        ['<Esc>'] = 'Close',
        ['<CR>'] = 'Confirm',
      },
      i = {
        ['<C-c>'] = 'Close',
        ['<CR>'] = 'Confirm',
        ['<Up>'] = 'HistoryPrev',
        ['<Down>'] = 'HistoryNext',
      },
    },

    override = function(conf)
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      return conf
    end,

    -- see :help dressing_get_config
    get_config = nil,
  },

  select = {
    -- Set to false to disable the vim.ui.select implementation
    enabled = true,

    -- Priority list of preferred vim.select implementations
    backend = { 'telescope', 'nui', "fzf", "builtin" },

    -- Options for nui Menu
    nui = {
      position = {
        row = 1,
        col = 0,
      },
      size = nil,
      relative = 'cursor',
      border = {
        style = 'rounded',
        text = {
          top_align = 'right',
        },
      },
      buf_options = {
        swapfile = false,
        filetype = 'DressingSelect',
      },
      max_width = 80,
      max_height = 40,
    },

    -- Options for built-in selector
    builtin = {
      -- These are passed to nvim_open_win
      anchor = 'NW',
      border = 'rounded',
      -- 'editor' and 'win' will default to being centered
      relative = 'cursor',

      win_options = {
        -- Window transparency (0-100)
        winblend = 5,
        -- Change default highlight groups (see :help winhl)
        winhighlight = 'Normal:Normal',
      },

      -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      -- the min_ and max_ options can be a list of mixed types.
      -- max_width = {140, 0.8} means 'the lesser of 140 columns or 80% of total'
      width = nil,
      max_width = { 140, 0.8 },
      min_width = { 10, 0.2 },
      height = nil,
      max_height = 0.9,
      min_height = { 2, 0.05 },

      -- Set to `false` to disable
      mappings = {
        ['<Esc>'] = 'Close',
        ['<C-c>'] = 'Close',
        ['q'] = 'Close',
        ['<CR>'] = 'Confirm',
      },

      override = function(conf)
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        conf.row = 1

        return conf
      end,
    },

    --see :help dressing_get_config
    get_config = function(opts)
      vim.b.s_index = 0
      if opts.kind == 'codeaction' then
        opts.format_item = function (action)
          vim.b.s_index = vim.b.s_index + 1

          return vim.b.s_index .. '. ' .. action[2].title
        end
        return {
          backend = 'builtin',
          builtin = {
            anchor = 'NW',
            relative = 'cursor',
            min_height = 1,
          },
        }
      end
    end
  },
}
