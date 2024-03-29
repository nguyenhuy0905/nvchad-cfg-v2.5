-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {"bashls", "marksman", "html", "cssls", "ruff_lsp", "cmake" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- non-default configs
lspconfig.clangd.setup{
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = {"clangd", "--clang-tidy"}
}
lspconfig.jdtls.setup {
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
}

lspconfig.omnisharp.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "dotnet", "/home/huynguyen/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
  enable_editorconfig_support = true,
  enable_roslyn_analyzers = true,
  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").definition_handler,
    ["textDocument/references"] = require("omnisharp_extended").references_handler,
    ["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
  },
}

lspconfig.hls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "haskell-language-server-wrapper", "--lsp" },
}

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
