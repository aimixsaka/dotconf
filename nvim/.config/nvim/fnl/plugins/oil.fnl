(import-macros {: tx} :config.macros)

(tx "stevearc/oil.nvim"
  {:opts {:columns [;; "permissions" "size" "mtime"
                    "icon"]
          :view_options {:show_hidden false}}
   :config (fn [_ opts]
             (let [oil (require :oil)]
               (oil.setup opts)

               ;; Open Oil by default if we don't specify a file at the CLI.
               ;; And when there are no floating windows (i.e. Lazy)
               (when (and (= "" (vim.fn.expand "%"))
                          (not (. (vim.api.nvim_win_get_config 0) :zindex)))
                 (oil.open))))
   :lazy false
   :keys [(tx "<leader>e" "<CMD>Oil<CR>"
            {:desc "Open parent directory"})]
   :dependencies [(tx "echasnovski/mini.icons" {:opts {}})]})
