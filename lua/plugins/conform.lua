return {
  "stevearc/conform.nvim",

  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>f",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      javascript = { "prettier", "eslint" },
      typescript = { "prettier", "eslint" },
      css = { "prettier", "eslint" },
      scss = { "prettier", "eslint" },
      typescriptreact = { "prettier", "eslint" },
      rust = { "rustfmt" },
      handlebars = { "ember-template-lint" },
    },
  },
}
