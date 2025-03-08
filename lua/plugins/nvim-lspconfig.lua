-- LSP Support
return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig', opts = {} },
    { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function ()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = {
        'bashls',
        'cssls',
        'html',
        'gradle_ls',
        'groovyls',
        'lua_ls',
        'jdtls',
        'jsonls',
        'marksman',
        'yamlls',
      }
    })

    require('mason-tool-installer').setup({
      ensure_installed = {
        'java-debug-adapter',
        'java-test',
      },
    })

    vim.api.nvim_command('MasonToolsInstall')

    local lspconfig = require('lspconfig')
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_attach = function(client, bufnr)
    end

    require('mason-lspconfig').setup_handlers({
      function(server_name)
        if server_name ~= 'jdtls' then
          lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
          })
        end
      end
    })

    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
        },
      },
    }

    -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
    -- local open_floating_preview = vim.lsp.util.open_floating_preview
    -- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    --   opts = opts or {}
    --   opts.border = opts.border or "rounded" -- Set border to rounded
    --   return open_floating_preview(contents, syntax, opts, ...)
    -- end
  end
}

