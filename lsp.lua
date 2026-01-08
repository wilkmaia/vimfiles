--[[
LSP shortcuts cheatsheet:

Inherited from Vim:
ctrl-]          -> go to definition
gq              -> format selected text or text object
K               -> display documentation of the symbol under the cursor
ctrl-x + ctrl-o -> in insert mode, trigger code completion

Neovim-specific:
grn        -> renames all references of the symbol under the cursor
gra        -> list code actions available in the line under the cursor
grr        -> lists all the references of the symbol under the cursor
gri        -> lists all the implementations for the symbol under the cursor
grt        -> jump to the definition of the type symbol under the cursor
gO         -> lists all symbols in the current buffer
ctrl-s     -> in insert mode, display function signature under the cursor
[d         -> jump to previous diagnostic in the current buffer
]d         -> jump to next diagnostic in the current buffer
ctrl-w + d -> show error/warning message in the line under the cursor
]]

-- Misc
local function has_value(tab, val)
    for _, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

require('mini.completion').setup({
  lsp_completion = {
    source_func = 'omnifunc',
    auto_setup = true,
  },
  window = {
    config = { border = 'double' },
  },
})

-- Lua
vim.lsp.config('luals', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc' },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = {
        globals = {},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      telemetry = { enabled = false },
    },
  },

  -- This is meant to only add the `vim` global on the nvim config files. But if neovim
  -- is opened anywhere and a buffer is loaded with any of its config files, this can
  -- be bypassed. Not sure how to better solve this problem. Leaving this as is for now.
  on_attach = function(client, buffer)
    local g = client.settings.Lua.diagnostics.globals
    if vim.api.nvim_buf_get_name(buffer):match(vim.fn.stdpath('config')) and not has_value(g, 'vim') then
      table.insert(g, 'vim')
    end
  end
})

vim.lsp.enable('luals')

-- Typescript
vim.lsp.config('ts_ls', {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx'
  },
  root_markers = { 'package.json', '.git', 'tsconfig.json' },
  settings = {
    ['typescript.disableAutomaticTypeAcquisition'] = true,
  },
})

local old_handler = vim.lsp.handlers["workspace/executeCommand"]
vim.lsp.handlers["workspace/executeCommand"] = function(a, result, ctx)
  if ctx.params.command == "_typescript.goToSourceDefinition" then
    vim.lsp.handlers["textDocument/definition"](a, result, ctx)
  else
    old_handler(a, result, ctx)
  end
end

vim.lsp.enable('ts_ls')

-- Python
vim.lsp.config('basedpyright', {
  cmd = { 'basedpyright-langserver', '--stdio' },
  filetypes = { 'python' },
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = 'standard', -- options: 'off', 'basic', 'standard', 'all'
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
      },
    },
    python = {
      pythonPath = vim.fn.exepath('python3') -- ensures it uses the active venv
    }
  }
})

vim.lsp.enable('basedpyright')

-- Terraform
vim.lsp.config('terraformls', {
  cmd = { 'terraform-ls', 'serve', '-log-file=/dev/null' },
  filetypes = { 'terraform', 'tf', 'terraform-vars' },
  root_markers = { '.terraform', '.git' },
})

vim.lsp.enable('terraformls')

-- Helm
vim.lsp.config('helm_ls', {
  cmd = { "helm_ls", "serve" },
  filetypes = { 'helm' },
  root_markers = { 'Chart.yaml' },
  settings = {
    ['helm-ls'] = {
      yamlls = {
        enabled = true,
        path = "yaml-language-server",
      }
    }
  }
})

vim.lsp.enable('helm_ls')
