-- This is a VS Code like winbar that uses nvim-navic in order to get LSP context from your language server.
return {
  'utilyre/barbecue.nvim',
  name = 'barbecue',
  version = '*',
  dependencies = {
    'SmiteshP/nvim-navic',
    'catppuccin/nvim', -- barbecue needs to load after colorscheme
    'nvim-tree/nvim-web-devicons', -- optional dependency
  },
  opts = {
    -- configurations go here
  },
}
