local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"
local map = vim.keymap.set

-- reuse your existing on_attach
nvlsp.on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end
  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
  map("n", "<leader>ra", require "nvchad.lsp.renamer", opts "Rename symbol")
  map("n", "gr", vim.lsp.buf.references, opts "Show references")
end

local servers = { "gopls", "vtsls", "golangci_lint_ls", "biome" }

for _, name in ipairs(servers) do
  local cfg = {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }

  if name == "golangci_lint_ls" then
    -- override init_options.command, not `cmd`
    cfg.cmd = { "golangci-lint-langserver" }
    cfg.init_options = {
      -- this is the exact CLI you want run behind the scenes:
      command = {
        "golangci-lint",
        "run",
        "--output.json.path",
        "stdout", -- emit JSON to stdout
        "--show-stats=false", -- hide stats for speed
        "--issues-exit-code=1", -- return non-zero when issues found
      },
    }
  end

  lspconfig[name].setup(cfg)
end
