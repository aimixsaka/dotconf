(import-macros {: tx} :config.macros)

(tx "catppuccin/nvim"
  {:config (fn []
             (vim.cmd "colorscheme catppuccin-latte"))})
