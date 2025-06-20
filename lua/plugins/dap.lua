local js_based_languages = {
  'typescript',
  'javascript',
  'vue',
}

return {
  {
    'nvim-neotest/nvim-nio',
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
      },
      {
        'Joakker/lua-json5',
        build = './install.sh',
      },
      { 'theHamsta/nvim-dap-virtual-text' },
    },
    config = function()
      local dap = require 'dap'

      require('nvim-dap-virtual-text').setup()

      dap.adapters.chrome = {
        type = 'executable',
        command = 'node',
        args = { os.getenv 'HOME' .. '/vscode-chrome-debug/out/src/chromeDebug.js' },
      }

      for _, language in ipairs(js_based_languages) do
        dap.configurations[language] = {
          -- Debug single nodejs files
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
          },
          -- Debug nodejs processes (make sure to add --inspect when you run the process)
          {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach',
            processId = require('dap.utils').pick_process,
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
          },
          -- Debug web applications (client side)
          {
            type = 'chrome',
            request = 'attach',
            name = 'Attach to Chrome',
            -- program = '${file}',
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = 'inspector',
            port = 9222,
            webRoot = function()
              local co = coroutine.running()
              return coroutine.create(function()
                vim.ui.input({
                  prompt = 'Enter webRoot: ',
                  default = '${workspaceFolder}/Source/TourismTasmania.Web/Areas/DiscoverTasmania',
                }, function(input)
                  if input == nil or input == '' then
                    return
                  else
                    coroutine.resume(co, input)
                  end
                end)
              end)
            end,
          },
          {
            type = 'chrome',
            request = 'launch',
            name = 'Debug in Chrome',
            url = function()
              local co = coroutine.running()
              return coroutine.create(function()
                vim.ui.input({
                  prompt = 'Enter URL: ',
                  default = 'https://discovertasmania.local',
                }, function(url)
                  if url == nil or url == '' then
                    return
                  else
                    coroutine.resume(co, url)
                  end
                end)
              end)
            end,
            port = 9222,
            webRoot = function()
              local co = coroutine.running()
              return coroutine.create(function()
                vim.ui.input({
                  prompt = 'Enter webRoot: ',
                  default = '${workspaceFolder}/Source/TourismTasmania.Web/Areas/DiscoverTasmania',
                }, function(input)
                  if input == nil or input == '' then
                    return
                  else
                    coroutine.resume(co, input)
                  end
                end)
              end)
            end,
          },
          -- {
          --   type = 'pwa-chrome',
          --   request = 'launch',
          --   name = 'Launch & Debug Chrome',
          --   url = function()
          --     local co = coroutine.running()
          --     return coroutine.create(function()
          --       vim.ui.input({
          --         prompt = 'Enter URL: ',
          --         default = 'http://localhost:3000',
          --       }, function(url)
          --         if url == nil or url == '' then
          --           return
          --         else
          --           coroutine.resume(co, url)
          --         end
          --       end)
          --     end)
          --   end,
          --   webRoot = vim.fn.getcwd(),
          --   protocol = 'inspector',
          --   sourceMaps = true,
          --   userDataDir = false,
          -- },
          -- Divider for the launch.json derived configs
          {
            name = '----- ↓ launch.json configs ↓ -----',
            type = '',
            request = 'launch',
          },
        }
      end
    end,
    keys = {
      {
        '<leader>dB',
        function()
          require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        desc = 'Breakpoint Condition',
      },
      {
        '<leader>db',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'Toggle Breakpoint',
      },
      {
        '<leader>dc',
        function()
          require('dap').continue()
        end,
        desc = 'Run/Continue',
      },
      -- {
      --   '<leader>da',
      --   function()
      --     require('dap').continue { before = get_args }
      --   end,
      --   desc = 'Run with Args',
      -- },
      {
        '<leader>dC',
        function()
          require('dap').run_to_cursor()
        end,
        desc = 'Run to Cursor',
      },
      {
        '<leader>dg',
        function()
          require('dap').goto_()
        end,
        desc = 'Go to Line (No Execute)',
      },
      {
        '<leader>di',
        function()
          require('dap').step_into()
        end,
        desc = 'Step Into',
      },
      {
        '<leader>dj',
        function()
          require('dap').down()
        end,
        desc = 'Down',
      },
      {
        '<leader>dk',
        function()
          require('dap').up()
        end,
        desc = 'Up',
      },
      {
        '<leader>dl',
        function()
          require('dap').run_last()
        end,
        desc = 'Run Last',
      },
      {
        '<leader>do',
        function()
          require('dap').step_out()
        end,
        desc = 'Step Out',
      },
      {
        '<leader>dO',
        function()
          require('dap').step_over()
        end,
        desc = 'Step Over',
      },
      {
        '<leader>dP',
        function()
          require('dap').pause()
        end,
        desc = 'Pause',
      },
      {
        '<leader>dr',
        function()
          require('dap').repl.toggle()
        end,
        desc = 'Toggle REPL',
      },
      {
        '<leader>ds',
        function()
          require('dap').session()
        end,
        desc = 'Session',
      },
      {
        '<leader>dt',
        function()
          require('dap').terminate()
        end,
        desc = 'Terminate',
      },
      {
        '<leader>dw',
        function()
          require('dap.ui.widgets').hover()
        end,
        desc = 'Widgets',
      },
      {
        '<leader>da',
        function()
          if vim.fn.filereadable '.vscode/launch.json' then
            local dap_vscode = require 'dap.ext.vscode'
            dap_vscode.load_launchjs(nil, {
              ['pwa-node'] = js_based_languages,
              ['chrome'] = js_based_languages,
              ['pwa-chrome'] = js_based_languages,
            })
          end
          require('dap').continue()
        end,
        desc = 'Run with Args',
      },
    },
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'nvim-neotest/nvim-nio' },
    -- stylua: ignore
    keys = {
      { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
      { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
    },
    opts = {},
    config = function(_, opts)
      local dap = require 'dap'
      local dapui = require 'dapui'
      dapui.setup(opts)
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open {}
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close {}
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close {}
      end
    end,
  },
}
