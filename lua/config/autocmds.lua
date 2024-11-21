-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.o.number = true
vim.o.relativenumber = false
vim.o.clipboard = "unnamed"

--  vim.api.nvim_create_autocmd("User", {
--    pattern = "neo-tree-file-selected",
--    callback = function()
--      vim.notify("secildi")
--      -- Aktif buffer'ı al
--      local current_buf = vim.api.nvim_get_current_buf()
--      local buf_filetype = vim.bo[current_buf].filetype
--
--      -- Eğer seçilen dosya Neo-tree ise sekmeden kaldır
--      if buf_filetype == "neo-tree" then
--        -- Sekmeyi kapat
--        vim.cmd("bdelete " .. current_buf)
--      end
--    end,
--  })
--
--  -- open buffers in new tabs
--  vim.api.nvim_create_autocmd("BufWinEnter", {
--    callback = function()
--      if vim.bo.buftype == "" and vim.fn.bufname() ~= "" and vim.fn.filereadable(vim.fn.bufname()) == 1 then
--        vim.cmd("tabedit " .. vim.fn.expand("%:p"))
--      end
--    end,
--  })
