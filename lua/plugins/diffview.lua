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
      '<leader>gdfa',
      '<cmd>DiffviewFileHistory<cr>',
      desc = 'Diffview file history (all files)',
    },
    {
      '<leader>gdfc',
      '<cmd>DiffviewFileHistory --follow %<cr>',
      desc = 'Diffview file history (current file)',
    },
    -- This hung neovim!
    -- {
    --   '<leader>gdfl',
    --   '<cmd>.DiffviewFileHistory --follow<CR>',
    --   desc = 'Diffview file history (current line)',
    -- },
    {
      '<leader>gdo',
      '<cmd>DiffviewOpen<cr>',
      desc = 'Diffview open',
    },
    {
      '<leader>gdm',
      '<cmd>DiffviewOpen master<cr>',
      desc = 'Diffview open (master)',
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
