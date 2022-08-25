local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "tailwindcss","html","cssls","bashls","pyright","tsserver","terraformls","dockerls", "yamlls"
}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        -- capabilities = capabilities,
        capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities),
        settings = {
          tailwindCSS = {
            classAttributes = { 'class' , 'className' , 'classList' }
          }
        },
        root_dir = vim.loop.cwd,
        handlers = {
       ["textDocument/publishDiagnostics"] = vim.lsp.with(
         vim.lsp.diagnostic.on_publish_diagnostics, {
          -- Disable virtual_text
          virtual_text = false
         }
      ),
  }
    }
end
