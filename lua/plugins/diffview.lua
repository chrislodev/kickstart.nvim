return {
  'sindrets/diffview.nvim',
  opts = {
    view = {
      merge_tool = {
        layout = 'diff4_mixed',
      },
    },
  },
  keys = {
    {
      '<leader>gdf',
      '<cmd>DiffviewFileHistory<cr>',
      desc = 'Diffview file history',
    },
    {
      '<leader>gdo',
      '<cmd>DiffviewOpen<cr>',
      desc = 'Diffview open',
    },
    {
      '<leader>gdc',
      '<cmd>DiffviewClose<cr>',
      desc = 'Diffview close',
    },
    {
      '<leader>gdr',
      '<cmd>DiffviewRefresh<cr>',
      desc = 'Diffview refresh',
    },
  },
}
