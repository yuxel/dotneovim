-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local tab_count = 0

_G.HandleTab = function(direction)
  tab_count = tab_count + 1
  vim.defer_fn(function()
    if tab_count == 2 then
      if direction == "next" then
        vim.cmd("tabnext")
      elseif direction == "prev" then
        vim.cmd("tabprev")
      end
    end
    tab_count = 0
  end, 500) -- 500ms içinde iki kez basılmalı
end

vim.api.nvim_set_keymap("n", "<Tab>", [[:lua HandleTab('next')<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<S-Tab>", [[:lua HandleTab('prev')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-t>", ":tabnew<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-e>", ":Neotree<CR>", { noremap = true, silent = true })
