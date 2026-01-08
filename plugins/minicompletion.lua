return {
  {
    'nvim-mini/mini.completion',
    version = '*',
    dependencies = {
      { 'nvim-mini/mini.icons', version = '*' },
    },
    config = function()
      vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'popup', 'fuzzy' }
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
          end
        end
      })
    end
  },
}
