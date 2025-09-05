local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports", "golines" },
    sql = { "sql_formatter" },
  },

  formatters = {
    ["golines"] = {
      command = "golines",
      args = { "--max-len=200", "--base-formatter=gofumpt" },
      stdin = true,
    },
    ["sql_formatter"] = {
      command = "sql-formatter",
      args = {
        "--config",
        [[{"language":"postgresql","keywordCase":"upper","dataTypeCase":"upper"}]],
      },
      stdin = true,
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2000,
    lsp_fallback = true,
  },
}

return options
