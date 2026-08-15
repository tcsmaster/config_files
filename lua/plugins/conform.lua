return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft.python= { "ruff_fix", "ruff_organize_imports" }
  end,
}
