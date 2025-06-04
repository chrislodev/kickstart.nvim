return {
  'augmentcode/augment.vim',
  keys = {
    {
      '<leader>at',
      '<cmd>Augment chat-toggle<cr>',
      desc = 'Toggle chat',
      mode = { 'n', 'i' },
    },
    {
      '<leader>as',
      '<cmd>Augment signin<cr>',
      desc = 'Sign in',
      mode = { 'n', 'i' },
    },
    {
      '<leader>aS',
      '<cmd>Augment status<cr>',
      desc = 'Status',
      mode = { 'n', 'i' },
    },
    {
      '<leader>ac',
      '<cmd>Augment chat<cr>',
      desc = 'Chat',
      mode = { 'n', 'i', 'v' },
    },
    {
      '<leader>an',
      '<cmd>Augment chat-new<cr>',
      desc = 'New chat',
      mode = { 'n', 'i', 'v' },
    },
  },
  enabled = function()
    -- If no augmentignore file, disable augment unless user confirms
    local cwd = vim.uv.cwd()
    print('cwd is: ' .. cwd)
    local file = cwd .. '/.augmentignore'
    local enabled = false
    if vim.loop.fs_stat(file) then
      print('.augmentignore file found at: ' .. file)
      enabled = true
    else
      print 'No .augmentignore file found'
      local choice = vim.fn.confirm('Enable Augment anyway?', '&Yes\n&No', 2)
      if choice == 1 then
        enabled = true
        print 'User chose to enable Augment anyway'
      else
        print 'Augment is disabled!'
      end
    end
    print('augment enabled: ' .. tostring(enabled))
    return enabled
  end,
  config = function()
    -- Set workspace folders to current working directory
    local cwd = vim.uv.cwd()
    vim.g.augment_workspace_folders = { cwd }
    vim.keymap.set('i', '<cr>', '<cmd>call augment#Accept()<cr>', { noremap = true })
  end,
}
