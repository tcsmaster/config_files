return {
  'rcarriga/nvim-dap-ui',
  dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
  opts = require('lazydev').setup {
    library = { 'nvim-dap-ui' },
  },
  config = true,
  keys = {
    {
      '<leader>du',
      function()
        require('dapui').toggle {}
      end,
      desc = 'Dap UI',
    },
  },
}
