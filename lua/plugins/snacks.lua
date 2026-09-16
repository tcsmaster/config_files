return {
  { "folke/snacks.nvim", opts = { explorer = { enabled = false }, statuscolumn = { enabled = false } } },
  {
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          filter = { event = "msg_show", find = "Enter passphrase" },
          opts = { skip = true },
        },
      },
      notify = {
        enabled = false,
      },
    },
  },
}
