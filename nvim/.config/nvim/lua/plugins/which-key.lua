-- [nfnl] fnl/plugins/which-key.fnl
local function _1_()
  local wk = require("which-key")
  return wk.add({{"<leader>b", group = "Buffer"}, {"<leader>f", group = "Find"}, {"<leader>l", group = "LSP"}, {"<leader>la", group = "LSP actions"}, {"<leader>g", group = "Git"}, {"<leader>s", group = "Search"}, {"<leader>n", group = "Notifications"}, {"<leader>t", group = "Toggle"}, {"<leader>td", group = "Toggle diagnostics"}, {"<leader>d", group = "Diffview"}})
end
return {"folke/which-key.nvim", config = _1_, event = "VeryLazy"}
