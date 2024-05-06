-- EXAMPLE
--[[ local coq = require "coq"
local ensure_cap = coq.lsp_ensure_capabilities ]]
-- local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_attach = function(client, bufnr)
  require("lsp_signature").on_attach(client, bufnr)
  require("nvchad.configs.lspconfig").on_attach(client, bufnr)
end
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
local lspconfig = require "lspconfig"
local servers = {
  "perlnavigator",
  "tsserver",
  "clangd",
  "bashls",
  "basedpyright",
  "marksman",
  "html",
  "cssls",
  "cmake",
  "openscad_lsp",
  "lemminx",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- non-default configs
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    ["rust_analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}
lspconfig.sqls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { vim.fn.expand "~" .. "~/.local/share/nvim/mason/packages/sqls/sqls" },
}
lspconfig.dockerls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = {
    vim.fn.expand "~"
      .. "/.local/share/nvim/mason/packages/dockerfile-language-server/node_modules/dockerfile-language-server-nodejs/bin/docker-langserver",
    "--stdio",
  },
}
lspconfig.docker_compose_language_service.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = {
    vim.fn.expand "~"
      .. "/.local/share/nvim/mason/packages/docker-compose-language-service/node_modules/.bin/docker-compose-langserver",
    "--stdio",
  },
}
lspconfig.jdtls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = {
    -- "/home/huynguyen/jdt-language-server/bin/jdtls",
    vim.fn.expand "~" .. "/.local/share/nvim/mason/packages/jdtls/bin/jdtls",
    "-configuration",
    -- I would prefer the cache files to be here
    vim.fn.expand "~" .. "/.cache/jdtls/config",
    "-data",
    vim.fn.expand "~" .. "/.cache/jdtls/workspace",
  },
}
lspconfig.omnisharp.setup {
  on_attach = require("nvchad.configs.lspconfig").on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "dotnet", vim.fn.expand "~" .. "/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
  enable_editorconfig_support = true,
  enable_roslyn_analyzers = false,
  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").definition_handler,
    ["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
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
require "ufo"
require "neogit"
