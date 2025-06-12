return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    'folke/snacks.nvim', -- optional
  },
  keys = {
    { '<leader>gs', '<cmd>Neogit<cr>', desc = 'Git status' },
    { '<leader>gc', '<cmd>Neogit commit<cr>', desc = 'Git commit' },
    { '<leader>gp', '<cmd>Neogit pull<cr>', desc = 'Git pull' },
    { '<leader>gP', '<cmd>Neogit push<cr>', desc = 'Git push' },
    { '<leader>gf', '<cmd>Neogit fetch<cr>', desc = 'Git fetch' },
    { '<leader>gl', '<cmd>Neogit log<cr>', desc = 'Git log' },
  },
}
