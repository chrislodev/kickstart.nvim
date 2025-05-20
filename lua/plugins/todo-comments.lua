return -- Highlight todo, notes, etc in comments
{
  'folke/todo-comments.nvim',
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    signs = false,
  },
  keys = {
    {
      '<leader>st',
      function()
        require('snacks').picker.todo_comments()
      end,
      desc = 'Todo',
    },
    {
      '<leader>sT',
      function()
        require('snacks').picker.todo_comments { keywords = { 'TODO', 'FIX', 'FIXME' } }
      end,
      desc = 'Todo/Fix/Fixme',
    },
  },
}
