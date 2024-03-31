-- EXAMPLE
local coq = require "coq"
local ensure_cap = coq.lsp_ensure_capabilities
-- local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_attach = function(client, bufnr)
  require("lsp_signature").on_attach(client, bufnr)
end
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
local lspconfig = require "lspconfig"
local servers = { "tsserver", "clangd", "bashls", "basedpyright", "marksman", "html", "cssls", "cmake", "openscad_lsp" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    ensure_cap {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
    },
  }
end

-- non-default configs
lspconfig.jdtls.setup {
  ensure_cap {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    cmd = {
      -- "/home/huynguyen/jdt-language-server/bin/jdtls",
      "/home/huynguyen/.local/share/nvim/mason/packages/jdtls/bin/jdtls",
      "-configuration",
      -- I would prefer the cache files to be here
      "/home/huynguyen/.cache/jdtls/config",
      "-data",
      "/home/huynguyen/.cache/jdtls/workspace",
    },
  },
}
lspconfig.omnisharp.setup {
  on_attach = require("nvchad.configs.lspconfig").on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "dotnet", "/home/huynguyen/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
  enable_editorconfig_support = true,
  enable_roslyn_analyzers = true,
  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").definition_handler,
    ["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
    ["textDocument/references"] = require("omnisharp_extended").references_handler,
    ["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
  },
}

lspconfig.hls.setup {
  ensure_cap {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    cmd = { "haskell-language-server-wrapper", "--lsp" },
  },
}
require("ufo").setup()
