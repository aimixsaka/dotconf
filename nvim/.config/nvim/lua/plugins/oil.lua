-- [nfnl] fnl/plugins/oil.fnl
local function _1_(_, opts)
  local oil = require("oil")
  oil.setup(opts)
  if (("" == vim.fn.expand("%")) and not vim.api.nvim_win_get_config(0).zindex) then
    return oil.open()
  else
    return nil
  end
end
return {"stevearc/oil.nvim", config = _1_, dependencies = {{"echasnovski/mini.icons", opts = {}}}, keys = {{"<leader>e", "<CMD>Oil<CR>", desc = "Open parent directory"}}, lazy = false, opts = {columns = {"icon"}, view_options = {show_hidden = false}}}
