return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = function(_, opts)
      opts.flavour = "mocha"
      opts.highlight_overrides = {
        mocha = function(mocha)
          return {
            LineNr = { fg = "#ffffff" },
            CursorLineNr = { fg = "#ffa500", style = { "bold" } },
          }
        end,
      }
      return opts
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-nvim",
    },
  },
}
