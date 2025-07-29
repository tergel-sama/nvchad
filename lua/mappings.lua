require "nvchad.mappings"

-- Disable mappings
local nomap = vim.keymap.del

-- whichkey
nomap("n", "<leader>wK")
nomap("n", "<leader>wk")
nomap("n", "<leader>x")

-- Add mappings
local map = vim.keymap.set

-- Map to save the file (:w)
map("n", "<leader>w", ":w<CR>", { desc = "Save File" })

-- Prevent visual paste from overwriting the yank register
map("v", "p", '"_dP', { desc = "Paste without overwriting yank" })

-- Easy exit from terminal mode
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Show linting error or warnings
-- Diagnostic Float with Lua
vim.keymap.set("n", "gl", function()
  vim.diagnostic.open_float(0, { scope = "line" })
end, { desc = "Open Diagnostic Float" })

-- Map to close buffer (tabufline) and go back prev cursor
vim.keymap.set("n", "<leader>q", function()
  -- get current buff
  local currentbuf = vim.api.nvim_get_current_buf()

  -- go back prev buff
  vim.cmd "b#"

  -- get prev buff
  local destbuff = vim.api.nvim_get_current_buf()

  -- close first buff when this func work it's goes back
  require("nvchad.tabufline").close_buffer(currentbuf)

  -- check buff is valid
  if vim.api.nvim_buf_is_valid(destbuff) then
    -- #b command can return unlisted buff so we need check
    -- if no go back dest buff
    local is_listed = vim.bo[destbuff].buflisted
    if is_listed then
      vim.api.nvim_set_current_buf(destbuff)
    else
    end
  end
end, { desc = "Close buffer, then jump back and re-center" })
