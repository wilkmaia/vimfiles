vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('wim-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end
})


vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  group = vim.api.nvim_create_augroup('wim-buf-write-pre-autoformatting', { clear = true }),
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
