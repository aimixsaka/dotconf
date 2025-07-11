;;; Options
(set vim.g.mapleader " ")
(set vim.g.maplocalleader "\\")
(set vim.o.ignorecase true)
(set vim.o.smartcase true)
(set vim.o.splitright true)
(set vim.o.splitbelow true)
(set vim.o.foldenable false)
(set vim.o.undofile true)
(set vim.o.spell true)
(set vim.o.termguicolors true)
(set vim.o.exrc true)
(set vim.o.number true)
(set vim.o.relativenumber true)

;;; Diagnostics
(fn toggle-diagnostic-lines []
  (vim.diagnostic.config
    {:virtual_lines
     (if (. (vim.diagnostic.config) :virtual_lines)
         false
         {:current_line true})}))

(fn toggle-diagnostic-text []
  (vim.diagnostic.config
    {:virtual_text (not (. (vim.diagnostic.config) :virtual_text))}))

(vim.diagnostic.config
  {:virtual_text true
   :virtual_lines false})
(vim.keymap.set "n" "<leader>tdl" toggle-diagnostic-lines {:desc "Toggle diagnostic virtual lines."})
(vim.keymap.set "n" "<leader>tdt" toggle-diagnostic-text {:desc "Toggle diagnostic virtual text."})

;;; Mappings

(vim.keymap.set "n" "<leader>q" "<CMD>quit<CR>" {:desc ":quit"})
(vim.keymap.set "n" "-" "<CMD>split<CR>" {:desc ":split"})
(vim.keymap.set "n" "|" "<CMD>vsplit<CR>" {:desc ":vsplit"})
(vim.keymap.set "n" "<leader>bw" "<CMD>w<CR>" {:desc "Write the buffer"})

;; copy to system clipboard
(vim.keymap.set "v" "<leader>y" "\"+y" {:desc "copy to system clipboard"})

(vim.keymap.set "n" "<leader>sc" "<CMD>nohlsearch<CR>"
  {:desc "Clear search highlight"})

;;; Plugins
(require :bootstrap)
