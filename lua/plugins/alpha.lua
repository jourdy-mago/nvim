return {
  "goolord/alpha-nvim",

  keys = {
    { "<leader>a", "<cmd>Alpha<cr>", desc = "Home (alpha.nvim)" },
  },
  opts = function(_, opt)
    local logo = [[
░░░░░██╗██╗░░██╗░█████╗░██╗░██████╗  ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗
░░░░░██║██║░░██║██╔══██╗╚█║██╔════╝  ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║
░░░░░██║███████║██║░░██║░╚╝╚█████╗░  ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║
██╗░░██║██╔══██║██║░░██║░░░░╚═══██╗  ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║
╚█████╔╝██║░░██║╚█████╔╝░░░██████╔╝  ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║
░╚════╝░╚═╝░░╚═╝░╚════╝░░░░╚═════╝░  ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝
    ]]
    opt.section.header.val = vim.split(logo, "\n", { trimempty = true })
  end,
}
