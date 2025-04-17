local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports", "gofmt" },
    sql = { "sql_formatter" },
  },

  formatters = {
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
