return {
  {
    "rest-nvim/rest.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>or", "", desc = "+rest.nvim (http)" },
      { "<leader>orr", "<Plug>RestNvim", desc = "Run Http Call" },
      { "<leader>orl", "<Plug>RestNvimLast", desc = "Run Last Http Call" },
      { "<leader>orp", "<Plug>RestNvimPreview", desc = "Preview cURL" },

      -- NOTE: env_file specifies file name that consist environment variables (default: .env)
      {
        "<leader>ore",
        function()
          -- TODO: :RestSelectEnv path/to/env`
          local docName = vim.fn.input("Specify env: ")
          -- if docName == "" then
          --   notify("Cannot find empty doc", "warn", { title = "go.nvim" })
          -- else
          --   local godoc = string.format(":GoDoc %s", docName)
          --   vim.cmd(godoc)
          -- end
        end,
        desc = "Set Path to Env File",
      },
    },
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          -- show the generated curl command in case you want to launch
          -- the same request via the terminal (can be verbose)
          show_curl_command = false,
          show_http_info = true,
          show_headers = true,
          -- executables or functions for formatting response body [optional]
          -- set them to false if you want to disable them
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end,
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = ".env",
        custom_dynamic_variables = {},
        yank_dry_run = true,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "http", "json" })
      end
    end,
  },
}
