return {
  -- { "p00f/nvim-ts-rainbow" }, -- the original rainbow still works fine
  -- { "HiPhish/nvim-ts-rainbow2" },

  -- -- no lazy load as it will not works
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --
  --   -- NOTE: adding keys makes it lazy load?
  --   -- keys = {
  --   --   {
  --   --     "<leader>cc",
  --   --     function()
  --   --       require("treesitter-context").go_to_context()
  --   --     end,
  --   --     desc = "Go to Context",
  --   --   },
  --   -- },
  -- },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "p00f/nvim-ts-rainbow" }, -- the original rainbow still works fine
      {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
          require("treesitter-context").setup({
            enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
            max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
            min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
            line_numbers = true,
            multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
            trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
            mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
            -- Separator between context and content. Should be a single character string, like '-'.
            -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
            separator = nil,
            zindex = 20, -- The Z-index of the context window
            on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
          })
        end,
        keys = {
          {
            "<leader>cc",
            function()
              require("treesitter-context").go_to_context()
            end,
            desc = "Go to Context",
          },
        },
      },
    },

    opts = {
      highlight = {
        enable = true,
        -- NOTE: 'disable' will be moved to each language config in /extra/go for example
        -- disable = { "go" }, -- NOTE: disable go TS to use vim-go-syntx highlight instead but still uses the ts plugins like  ts-rainbow and context
      },
      rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
      },
      -- rainbow = {
      --   enable = true,
      --   -- list of languages you want to disable the plugin for
      --   -- disable = { "jsx", "cpp" },
      --   -- Which query to use for finding delimiters
      --   query = "rainbow-parens",
      --   -- Highlight the entire buffer all at once
      --   strategy = require("ts-rainbow.strategy.global"),
      --   -- Do not enable for files with more than n lines
      --   max_file_lines = 3000,
      -- },
    },
  },
}
