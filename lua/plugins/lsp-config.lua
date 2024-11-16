return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "cssls",
          "ts_ls",
          "jsonls",
          "html",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",

    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local servers = {
        "lua_ls",
        "sqls",
        "cssls",
        "ts_ls",
        "jsonls",
      }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          --- on_attach = on_attach,
          capabilities = capabilities,
        })
      end

      local function should_ignore_message(message)
        -- vim.notify("Gelen mesaj: " .. message, vim.log.levels.INFO)

        local patterns = {
          "File is a CommonJS module",
          "Could not find a declaration file for module",
          "^'next' is declared",
          "^'req' is declared",
          "^'res' is declared",
        }
        for _, pattern in ipairs(patterns) do
          if string.find(message, pattern) then
            return true
          end
        end
        return false
      end

      lspconfig.ts_ls.setup({
        handlers = {
          ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
            -- Belirli bir tanı mesajını filtrele
            if result.diagnostics then
              result.diagnostics = vim.tbl_filter(function(diagnostic)
                return not should_ignore_message(diagnostic.message)
              end, result.diagnostics)
            end
            vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
          end,
        },
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "good definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to references" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" })
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
    end,
  },
}
