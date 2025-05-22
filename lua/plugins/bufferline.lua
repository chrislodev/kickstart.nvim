return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      truncate_names = true,
      numbers = 'none',
      indicator = {
        -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
        -- style = 'icon' | 'underline' | 'none',
        style = 'underline',
      },
    },
  },
}
