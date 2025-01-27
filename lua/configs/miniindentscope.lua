local options = {
  opts = {
    -- symbol = "▏",
    symbol = "│",
    options = { try_as_border = true },
  },

  init = function()
    -- disable on these
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "Trouble",
        "alpha",
        "dashboard",
        "fzf",
        "help",
        "lazy",
        "mason",
        "neo-tree",
        "nvim-tree",
        "notify",
        "snacks_dashboard",
        "snacks_notif",
        "snacks_terminal",
        "snacks_win",
        "toggleterm",
        "trouble",
        "NvimTree",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}

return options
