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

local lsp_configs = {
  clangd = {
    -- C / C++ / Obj-C
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
    root_markers = { '.terraform', '.git' },
  },
  luals = {
    -- Lua
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
  },
  ts_ls = {
    -- JavaScript / TypeScript
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
    init_options = {
      disableAutomaticTypingAcquisition = true,
    },
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayVariableTypeHints = true,
        },
      },
      javascript = {
        suggest = {
          completeFunctionCalls = true,
        },
      },
    },
  },
  basedpyright = {
    -- Python
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
  },
  terraformls = {
    -- Terraform
    cmd = { 'terraform-ls', 'serve', '-log-file=/dev/null' },
    filetypes = { 'terraform', 'tf', 'terraform-vars' },
    root_markers = { '.terraform', '.git' },
  },
  helm_ls = {
    -- Helm
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
  },
}

local blink_cmp = require('blink.cmp')
for server, cfg in pairs(lsp_configs) do
  local capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }
    }
  }
  capabilities = vim.tbl_deep_extend('force', capabilities, vim.lsp.protocol.make_client_capabilities())
  capabilities = vim.tbl_deep_extend('force', capabilities, cfg.capabilities or {})
  cfg.capabilities = blink_cmp.get_lsp_capabilities(capabilities)
  vim.lsp.config(server, cfg)
  vim.lsp.enable(server)
end

local old_handler = vim.lsp.handlers["workspace/executeCommand"]
vim.lsp.handlers["workspace/executeCommand"] = function(a, result, ctx)
  if ctx.params.command == "_typescript.goToSourceDefinition" then
    vim.lsp.handlers["textDocument/definition"](a, result, ctx)
  else
    old_handler(a, result, ctx)
  end
end
