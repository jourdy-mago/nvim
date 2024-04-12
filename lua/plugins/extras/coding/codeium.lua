return {
  -- NOTE: will change to use the codeium.nvim below if the issue is solved.
  -- it also supports chat now but still waiting PR to fix the root dir bug where it doesnt know the root dir.
  {
    {
      "Exafunction/codeium.vim",
      event = "BufEnter",
      disabled = true,
      config = function()
        vim.g.codeium_disable_bindings = 1
        -- stylua: ignore
        vim.keymap.set('n', '<leader>C', function () return vim.fn['codeium#Chat']() end, { expr = true, silent = true, desc = "Open Codeium Chat" })
        -- stylua: ignore
        vim.keymap.set('i', '<C-a>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
        -- stylua: ignore
        vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
        -- stylua: ignore
        vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
        -- stylua: ignore
        vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
      end,
    },
  },

  -- -- FIX: codeium.nvim is not working as expected. using comment will not generate a suggestion.
  -- -- start typing the code will, but it will stop generating a suggestion after accepting those several times.
  -- -- in my case it stops generating a suggestion after 3 times accepting.
  -- -- ironically this comment is mostly generated by codeium.
  -- -- or maybe codeium is not working properly because of my other plugin.
  -- -- such as the one that create a new line of comment after enter. update: still not working.
  -- {
  --   "nvim-cmp",
  --   dependencies = {
  --     -- codeium
  --     {
  --       "Exafunction/codeium.nvim",
  --       cmd = "Codeium",
  --       build = ":Codeium Auth",
  --       opts = {},
  --     },
  --   },
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     table.insert(opts.sources, 1, {
  --       name = "codeium",
  --       group_index = 1,
  --       priority = 50,
  --     })
  --   end,
  -- },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   optional = true,
  --   event = "VeryLazy",
  --   opts = function(_, opts)
  --     table.insert(opts.sections.lualine_x, 2, require("lazyvim.util").lualine.cmp_source("codeium"))
  --   end,
  -- },

  -- {
  --   "nvim-cmp",
  --   dependencies = {
  --     -- codeium
  --     {
  --       "Exafunction/codeium.nvim",
  --       cmd = "Codeium",
  --       build = ":Codeium Auth",
  --       opts = {},
  --     },
  --   },
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     table.insert(opts.sources, 1, {
  --       name = "codeium",
  --       group_index = 1,
  --       priority = 100,
  --     })
  --   end,
  -- },

  -- {
  --   "nvim-lualine/lualine.nvim",
  --   optional = true,
  --   event = "VeryLazy",
  --   opts = function(_, opts)
  --     table.insert(opts.sections.lualine_x, 2, LazyVim.lualine.cmp_source("codeium"))
  --   end,
  -- },

}
