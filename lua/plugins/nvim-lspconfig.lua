-- LSP STUFF

local lsp = require("util.lsp")
local on_attach = lsp.on_attach
local diagnostic_signs = lsp.diagnostic_signs

local config = function()
  require("neoconf").setup({})
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  local lspconfig = require("lspconfig")

  for type, icon in pairs(diagnostic_signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  local capabilities = cmp_nvim_lsp.default_capabilities()

  -- lua
  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = { -- custom settings for lua
      Lua = {
        -- make the language server recognize "vim" global
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          -- make language server aware of runtime files
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        },
      },
    },
  })

  -- json
  lspconfig.jsonls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "json", "jsonc" },
  })

  -- typescript
  lspconfig.tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
    },
    root_dir = function(fname)
      -- terrible hack for monorepo
      return lspconfig.util.root_pattern("pnpm-workspace.yaml", ".git")(fname)
        or lspconfig.util.root_pattern("package.json", "tsconfig.json")(fname)
    end,
  })

  -- bash
  lspconfig.bashls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "sh" },
  })

  -- docker
  lspconfig.dockerls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  local luacheck = require("efmls-configs.linters.luacheck")
  local stylua = require("efmls-configs.formatters.stylua")
  local eslint_d = require("efmls-configs.linters.eslint_d")
  local prettier = require("efmls-configs.formatters.prettier")
  local fixjson = require("efmls-configs.formatters.fixjson")
  local shellcheck = require("efmls-configs.linters.shellcheck")
  local shfmt = require("efmls-configs.formatters.shfmt")
  local alex = require("efmls-configs.linters.alex")
  local hadolint = require("efmls-configs.linters.hadolint")

  -- configure efm server
  lspconfig.efm.setup({
    filetypes = {
      "lua",
      "json",
      "jsonc",
      "sh",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "svelte",
      "vue",
      "markdown",
      "docker",
    },
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
      hover = true,
      documentSymbol = true,
      codeAction = true,
      completion = true,
    },
    settings = {
      languages = {
        lua = { luacheck, stylua },
        typescript = { eslint_d, prettier },
        json = { eslint_d, fixjson },
        jsonc = { eslint_d, fixjson },
        sh = { shellcheck, shfmt },
        javascript = { eslint_d, prettier },
        javascriptreact = { eslint_d, prettier },
        typescriptreact = { eslint_d, prettier },
        markdown = { alex, prettier },
        docker = { hadolint, prettier },
      },
    },
  })
end

return {
  "neovim/nvim-lspconfig",
  config = config,
  lazy = false,
  dependencies = {
    "windwp/nvim-autopairs",
    "williamboman/mason.nvim",
    "creativenull/efmls-configs-nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
  },
}
