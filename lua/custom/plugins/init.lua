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
