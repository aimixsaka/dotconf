-- [nfnl] fnl/plugins/conjure.fnl
vim.g["conjure#filetype#fennel"] = "conjure.client.fennel.nfnl"
vim.g["conjure#mapping#doc_word"] = "K"
local function _1_()
  vim.g["conjure#log#hud#enabled"] = false
  return nil
end
return {"Olical/conjure", event = "VeryLazy", init = _1_}
