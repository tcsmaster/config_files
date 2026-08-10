return {
  'theHamsta/nvim-dap-virtual-text',
  requires = {
    'nvim-treesitter/nvim-treesitter',
    'mfussenegger/nvim-dap',
  },
  config = function()
    require('nvim-dap-virtual-text').setup {
      commented = true,
    }
  end,
}
