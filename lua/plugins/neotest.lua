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
            enable_dynamic_test_discovery = true,
            get_playwright_config = function()
              return vim.loop.cwd() .. '/playwright.config.ts'
            end,
            persist_project_selection = true,
            preset = 'none',
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
      '<leader>tp',
      '<cmd>NeotestPlaywrightPreset<cr>',
      desc = 'Select preset',
    },
    {
      '<leader>tP',
      '<cmd>NeotestPlaywrightProject<cr>',
      desc = 'Select project(s)',
    },
    {
      '<leader>tR',
      '<cmd>NeotestPlaywrightRefresh<cr>',
      desc = 'Refresh Playwright',
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
