-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
    end,
  },
  {
    'bloznelis/before.nvim',
    config = function()
      local before = require 'before'
      before.setup()

      -- Jump to previous entry in the edit history
      vim.keymap.set('n', '<A-h>', before.jump_to_last_edit, {})

      -- Jump to next entry in the edit history
      vim.keymap.set('n', '<A-l>', before.jump_to_next_edit, {})

      -- Look for previous edits in quickfix list
      vim.keymap.set('n', '<leader>oq', before.show_edits_in_quickfix, {})

      -- Look for previous edits in telescope (needs telescope, obviously)
      vim.keymap.set('n', '<leader>oe', before.show_edits_in_telescope, {})
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main',
    cmd = 'CopilotChat',
    opts = function()
      local user = vim.env.USER or 'User'
      user = user:sub(1, 1):upper() .. user:sub(2)
      return {
        auto_insert_mode = true,
        question_header = '  ' .. user .. ' ',
        answer_header = '  Copilot ',
        window = {
          width = 0.4,
        },
      }
    end,
    keys = {
      { '<c-s>', '<CR>', ft = 'copilot-chat', desc = 'Submit Prompt', remap = true },
      { '<leader>a', '', desc = '+ai', mode = { 'n', 'v' } },
      {
        '<leader>aa',
        function()
          return require('CopilotChat').toggle()
        end,
        desc = 'Toggle (CopilotChat)',
        mode = { 'n', 'v' },
      },
      {
        '<leader>ax',
        function()
          return require('CopilotChat').reset()
        end,
        desc = 'Clear (CopilotChat)',
        mode = { 'n', 'v' },
      },
      {
        '<leader>aq',
        function()
          vim.ui.input({
            prompt = 'Quick Chat: ',
          }, function(input)
            if input ~= '' then
              require('CopilotChat').ask(input)
            end
          end)
        end,
        desc = 'Quick Chat (CopilotChat)',
        mode = { 'n', 'v' },
      },
      {
        '<leader>ap',
        function()
          require('CopilotChat').select_prompt()
        end,
        desc = 'Prompt Actions (CopilotChat)',
        mode = { 'n', 'v' },
      },
    },
    config = function(_, opts)
      local chat = require 'CopilotChat'

      vim.api.nvim_create_autocmd('BufEnter', {
        pattern = 'copilot-chat',
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
        end,
      })

      chat.setup(opts)
    end,
  },

  --[[ {
    'luckasRanarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    build = ':UpdateRemotePlugins', event = 'LspAttach', dependencies = { 'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim', -- optional
      'neovim/nvim-lspconfig', -- optional
    },
    config = function()
      require('tailwind-tools').setup {}
    end,
  },
  ]]
  --[[ 
  {
    'neovim/nvim-lspconfig',
    event = 'LazyFile',
    dependencies = {
      'mason.nvim',
      { 'williamboman/mason-lspconfig.nvim', config = function() end },
    },
    config = function()
      local capabilitiies = nil
      if pcall(require, 'cmp_nvim_lsp') then
        capabilitiies = require('cmp_nvim_lsp').default_capabilities()
      end

      local on_attach = function(client, bufnr)
        vim.lsp.completion.enable(true, client, bufnr, { autotrigger = true })
        require('lsp_signature').on_attach {
          bind = true,
          floating_window = true,
          handler_opts = {
            border = 'rounded',
          },
        }

        if client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_augroup('lsp_document_highlight', {
            clear = false,
          })

          vim.api.nvim_clear_autocmds {
            buffer = bufnr,
            group = 'lsp_document_highlight',
          }

          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd('CursorMoved', {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end

      require('lspconfig').intelephense.setup {
        settings = {
          intelephense = {
            stubs = {
              'bcmath',
              'bz2',
              'Core',
              'curl',
              'date',
              'dom',
              'fileinfo',
              'filter',
              'gd',
              'gettext',
              'hash',
              'iconv',
              'imap',
              'intl',
              'json',
              'libxml',
              'mbstring',
              'mcrypt',
              'mysql',
              'mysqli',
              'password',
              'pcntl',
              'pcre',
              'PDO',
              'pdo_mysql',
              'Phar',
              'readline',
              'regex',
              'session',
              'SimpleXML',
              'sockets',
              'sodium',
              'standard',
              'superglobals',
              'tokenizer',
              'xml',
              'xdebug',
              'xmlreader',
              'xmlwriter',
              'yaml',
              'zip',
              'zlib',
              'wordpress-stubs',
              'woocommerce-stubs',
              'acf-pro-stubs',
              'wordpress-globals',
              'wp-cli-stubs',
              'genesis-stubs',
              'polylang-stubs',
            },
            environment = {
              includePaths = { 'C:/Users/Paul/AppData/Roaming/Composer/vendor/php-stubs/' },
            },
            files = {
              maxSize = 5000000,
            },
          },
        },
        capabilitiies = capabilitiies,
        on_attach = on_attach,
      }
    end,
  }, ]]
}
