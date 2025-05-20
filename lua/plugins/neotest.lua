return {
  'nvim-neotest/neotest',
  dependencies = {
    'thenbe/neotest-playwright',
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    dependencies = 'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require('neotest-playwright').adapter {
          options = {
            persist_project_selection = true,
            enable_dynamic_test_discovery = true,
          },
        },
      },
    }
  end,
  keys = {
    {
      '<leader>tr',
      '<cmd>Neotest run<cr>',
      desc = 'Neotest run',
    },
    {
      '<leader>to',
      '<cmd>Neotest output<cr>',
      desc = 'Neotest output',
    },
    {
      '<leader>ts',
      '<cmd>Neotest summary<cr>',
      desc = 'Neotest summary',
    },
    {
      '<leader>ta',
      '<cmd>lua require("neotest").run.run({ suite = true })<cr>',
      desc = 'Neotest run all tests',
    },
  },
}
