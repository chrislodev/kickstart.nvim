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
}
