;;; -*- lexical-binding: t -*-

;;; package manager start
(defvar bootstrap-version)
(let ((bootstrap-file
	(expand-file-name
          "straight/repos/straight.el/bootstrap.el"
          (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
       (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
      (url-retrieve-synchronously
        "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
;;; package manager end

;; functions
(defun my/vsp (filename)
  "Split window vertically like vim."
  (interactive "FFile to vertical split: ")
  (split-window-right)
  (other-window 1)
  (find-file filename))

(defun my/sp (filename)
  "Split window vertically like vim."
  (interactive "FFile to vertical split: ")
  (split-window-below)
  (other-window 1)
  (find-file filename))

;; keybinding
(global-set-key (kbd "C-c p") 'eval-print-last-sexp)
(defun undo-yank (arg)
  "Undo the yank you just did. Really, adjust just-yanked text like \\[yank-pop] does, but in the opposite direction."
  (interactive "p")
  (yank-pop (- arg)))
(global-set-key (kbd "C-M-Y") 'undo-yank)

(defun open-init-file()
  (interactive)
  (find-file (cond
	       ((string= system-type "gnu/linux")
		 "~/.config/emacs/init.el")
	       ((string= system-type "windows-nt")
		 "C:\\Users\\aimi\\.emacs.d\\init.el")
	       (t (error "Unsupported system: %s" system-type)))))
(global-set-key (kbd "<f2>") 'open-init-file)

(global-set-key "\C-x\C-n" 'other-window)
(global-set-key "\C-x\C-p" 'other-window-backward)

;;; advice
(defadvice switch-to-buffer (before existing-buffer
			      activate compile)
  "When activate, switch to existing buffers only,
unless given a prefix argument."
  (interactive
    (list (read-buffer "Switch to buffer:"
	    (other-buffer)
	    (null current-prefix-arg)))))



(defvar unscroll-point (make-marker)
  "Cursor position for next call to `unscroll'.")
(defvar unscroll-window-start (make-marker)
  "Window start for next call to `unscroll'.")
(defvar unscroll-hscroll nil
  "Hscroll for next call to `unscroll'.")
(defun unscroll-maybe-remember ()
  (unless (get last-command 'unscrollable)
    (set-marker unscroll-point (point))
    (set-marker unscroll-window-start (window-start))
    (setq unscroll-hscroll (window-hscroll))))

(defadvice scroll-up (before remember-for-unscroll
		       activate compile)
  (put 'scroll-up 'unscrollable t)
  (unscroll-maybe-remember))
(defadvice scroll-down (before remember-for-unscroll
			 activate compile)
  (put 'scroll-down 'unscrollable t)
  (unscroll-maybe-remember))
(defadvice scroll-left (before remember-for-unscroll
			 activate compile)
  (put 'scroll-left 'unscrollable t)
  (unscroll-maybe-remember))
(defadvice scroll-right (before remember-for-unscroll
			  activate compile)
  (put 'scroll-right 'unscrollable t)
  (unscroll-maybe-remember))

(defun unscroll ()
  "Revert to `unscroll-point' and `unscroll-window-start'."
  (interactive)
  (if (not unscroll-point)
    (error "Cannot unscroll yet"))
  (goto-char unscroll-point)
  (set-window-start nil unscroll-window-start)
  (set-window-hscroll nil unscroll-hscroll))



(defcustom insert-time-format "%X"
  "Format for \\[insert-time] (c.f. `format-time-string').")
(defcustom insert-date-format "%x"
  "Format for \\[insert-date] (c.f. `format-time-string').")
(defun insert-time ()
  "Insert the current time according to `insert-time-format'."
  (interactive "*")
  (insert (format-time-string insert-time-format
	    (current-time))))
(defun insert-date ()
  "Insert the current date according to `insert-date-format'."
  (interactive "*")
  (insert (format-time-string insert-date-format
	    (current-time))))

(defun insert-date-time ()
  "Insert date (from `insert-date') and time (from `insert-time')."
  (interactive "*")
  (insert-date)
  (insert " ")
  (insert-time))

(defcustom writestamp-format "%Y-%m-%d %T"
  "Format for writestamps (c.f. `format-time-string').")
(defcustom writestamp-prefix "WRITESTAMP(("
  "Unique string identifying start of writestamps.")
(defcustom writestamp-suffix "))"
  "String that terminates a writestamps.")

;;; hooks
(add-hook 'write-file-hooks 'update-writestamps)
(defun update-writestamps ()
  "Find writestamps and replace them with the current time"
  (save-excursion
    (save-restriction
      (save-match-data
	(widen)
	(goto-char (point-min))
	(while (re-search-forward (concat "^" (regexp-quote writestamp-prefix))
		 nil t)
	  (let ((start (point)))
	    (when (re-search-forward (concat (regexp-quote writestamp-suffix) "$")
		    (line-end-position) t)
	      (delete-region start (match-beginning 0))
	      (goto-char start)
	      (insert (format-time-string writestamp-format
			(current-time)))))))))
  nil)


;;; custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
  '(lsp-headerline-breadcrumb-enable nil)
  '(menu-bar-mode nil)
  '(scroll-bar-mode nil)
  '(tool-bar-mode nil)
  '(visual-replace-default-to-full-scope t))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(default ((t (:weight regular :height 170 :width normal :family "DejaVu Sans Mono")))))


;; packages
(straight-use-package 'use-package)
(setq straight-use-package-by-default 1)

(use-package emacs
  :init
  ;; lsp performance related
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq help-window-select t)
  (setq make-backup-files nil)
  (setq enable-recursive-minibuffers t)
  
  :config
  ;; tree-sitter
  (setq treesit-language-source-alist
    `(,(if (eq 'windows-nt system-type)
	 '(janet-simple
            . ("https://github.com/sogaiu/tree-sitter-janet-simple"
		nil nil "gcc.exe"))
	 '(janet-simple
            . ("https://github.com/sogaiu/tree-sitter-janet-simple")))
       (elisp . ("https://github.com/Wilfred/tree-sitter-elisp"))
       (c . ("https://github.com/tree-sitter/tree-sitter-c"))
       (cpp . ("https://github.com/tree-sitter/tree-sitter-cpp"))
       (zig . ("https://github.com/tree-sitter-grammars/tree-sitter-zig"))))
  
  (mapc #'(lambda (grammar) (unless (treesit-language-available-p grammar)
			      (treesit-install-language-grammar grammar)))
    (mapcar #'car treesit-language-source-alist))
  (setq debug-on-error t)
  ;; (setq help-window-select t)
  (global-display-line-numbers-mode)

  ;; real auto save
  (when (>= emacs-major-version 26)
    (auto-save-visited-mode 1)
    (setq auto-save-visited-interval 1))

  ;; auto pair
  (electric-pair-mode 1)

  (with-eval-after-load 'chistory
    (setq list-command-history-max 120)
    (define-key command-history-map (kbd "<return>") 'command-history-repeat))
  (windmove-default-keybindings))
				 
(use-package consult)

(use-package vertico
  :init
  (vertico-mode 1))

(use-package cape)

(use-package orderless
  :init
  ;; Tune the global completion style settings to your liking!
  ;; This affects the minibuffer and non-lsp completion at point.
  (setq completion-styles '(orderless partial-completion basic)
    completion-category-defaults nil
    completion-category-overrides nil))

(use-package janet-ts-mode
  :straight (janet-ts-mode :host github
	      :repo "sogaiu/janet-ts-mode"
	      :files ("*.el")))


(use-package flycheck-janet
  :straight (flycheck-janet :host github
	      :repo "sogaiu/flycheck-janet"
	      :files ("*.el")))

(use-package ajrepl
  :straight (ajrepl :host github
	      :repo "sogaiu/ajrepl"
	      :files ("*.el" "ajrepl"))
  :hook
  (janet-ts-mode . ajrepl-interaction-mode))



(use-package flycheck
  :config
  (global-flycheck-mode))
;; from https://github.com/minad/corfu/wiki#advanced-example-configuration-with-orderless
(use-package lsp-mode
  :custom
  (lsp-completion-provider :none) ;; we use Corfu!

  :init
  (setq lsp-keymap-prefix "C-c C-l")
  (setq lsp-idle-delay 0.500)
  (defun my/orderless-dispatch-flex-first (_pattern index _total)
    (and (eq index 0) 'orderless-flex))

  (defun my/lsp-mode-setup-completion ()
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
          '(orderless))
    ;; Optionally configure the first word as flex filtered.
    (add-hook 'orderless-style-dispatchers #'my/orderless-dispatch-flex-first nil 'local)
    ;; Optionally configure the cape-capf-buster.
    (setq-local completion-at-point-functions (list (cape-capf-buster #'lsp-completion-at-point))))

  :hook
  ((lsp-completion-mode . my/lsp-mode-setup-completion)
    (lsp-mode . lsp-enable-which-key-integration)
    (c-mode . lsp))
  :commands lsp)

;; (use-package lsp-mode
;;   :init
;;   (setq lsp-keymap-prefix "C-l")
;;   :hook
;;   ((c-mode . lsp)
;;    (lsp-mode . lsp-enable-which-key-integration))
;;   :commands lsp)

;; project or dired level occur mode
(use-package noccur)

;; more visual search-replace
(use-package visual-replace
  :defer nil
  :config
  (visual-replace-global-mode 1))


(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-quit-at-boundary t)     ;; Automatically quit at word boundary
  (corfu-quit-no-match t)
  :init
  (global-corfu-mode 1))
			
(use-package lsp-ui :commands lsp-ui-mode)
(use-package dap-mode)
(use-package which-key
    :config
    (which-key-mode))

(use-package sly
  :config
  (setq inferior-lisp-program "sbcl"))

(straight-register-package 'vterm)
(unless (string= system-type "windows-nt")
  (use-package vterm))

(use-package catppuccin-theme
  :config
  (load-theme 'catppuccin :no-confirm)
  (setq catppuccin-flavor 'latte) ;; or 'latte, 'macchiato, or 'mocha
  (catppuccin-reload))

(use-package meow
  :init
  ;; QWERTY mode for moew
  (defun meow-setup ()
    (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
    (meow-define-state disabled
      "meow state to disable meow."
      :keymap (make-keymap))
    (setq meow-mode-state-list
      '((conf-mode . normal)
	 (fundamental-mode . normal)
	 (help-mode . motion)
	 (prog-mode . normal)
	 (text-mode . normal)
	 (vterm-mode . disabled)))
    (meow-define-keys
      'insert
      '("C-;" . "<escape>")
      ;; '("C-[" . meow-insert-exit)
      )
    (meow-motion-define-key
      '("j" . meow-next)
      '("k" . meow-prev)
      '("<escape>" . ignore))
    (meow-leader-define-key
      ;; Use SPC (0-9) for digit arguments.
      '("1" . meow-digit-argument)
      '("2" . meow-digit-argument)
      '("3" . meow-digit-argument)
      '("4" . meow-digit-argument)
      '("5" . meow-digit-argument)
      '("6" . meow-digit-argument)
      '("7" . meow-digit-argument)
      '("8" . meow-digit-argument)
      '("9" . meow-digit-argument)
      '("0" . meow-digit-argument)
      '("/" . meow-keypad-describe-key)
      '("?" . meow-cheatsheet))
    (meow-normal-define-key
      '("0" . meow-expand-0)
      '("9" . meow-expand-9)
      '("8" . meow-expand-8)
      '("7" . meow-expand-7)
      '("6" . meow-expand-6)
      '("5" . meow-expand-5)
      '("4" . meow-expand-4)
      '("3" . meow-expand-3)
      '("2" . meow-expand-2)
      '("1" . meow-expand-1)
      '("-" . negative-argument)
      '(";" . meow-reverse)
      '("," . meow-inner-of-thing)
      '("." . meow-bounds-of-thing)
      '("[" . meow-beginning-of-thing)
      '("]" . meow-end-of-thing)
      '("a" . meow-append)
      '("A" . meow-open-below)
      '("b" . meow-back-word)
      '("B" . meow-back-symbol)
      '("c" . meow-change)
      '("d" . meow-delete)
      '("D" . meow-backward-delete)
      '("e" . meow-next-word)
      '("E" . meow-next-symbol)
      '("f" . meow-find)
      '("g" . meow-cancel-selection)
      '("G" . meow-grab)
      '("h" . meow-left)
      '("H" . meow-left-expand)
      '("i" . meow-insert)
      '("I" . meow-open-above)
      '("j" . meow-next)
      '("J" . meow-next-expand)
      '("k" . meow-prev)
      '("K" . meow-prev-expand)
      '("l" . meow-right)
      '("L" . meow-right-expand)
      '("m" . meow-join)
      '("n" . meow-search)
      '("o" . meow-block)
      '("O" . meow-to-block)
      '("p" . meow-yank)
      '("q" . meow-quit)
      '("Q" . meow-goto-line)
      '("r" . meow-replace)
      '("R" . meow-swap-grab)
      '("s" . meow-kill)
      '("t" . meow-till)
      '("u" . meow-undo)
      '("U" . meow-undo-in-selection)
      '("v" . meow-visit)
      '("w" . meow-mark-word)
      '("W" . meow-mark-symbol)
      '("x" . meow-line)
      '("X" . meow-goto-line)
      '("y" . meow-save)
      '("Y" . meow-sync-grab)
      '("z" . meow-pop-selection)
      '("'" . repeat)
      '("<escape>" . ignore)))
  :config
  (meow-setup)
  (meow-global-mode 1))

;; It's magit!
(use-package magit)

;; kernel c style
(defun linux-kernel-coding-style/c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
   (column (c-langelem-2nd-pos c-syntactic-element))
   (offset (- (1+ column) anchor))
   (steps (floor offset c-basic-offset)))
    (* (max steps 1)
      c-basic-offset)))


;; Add Linux kernel style
(add-hook 'c-mode-common-hook
    (lambda ()
      (c-add-style "linux-kernel"
       '("linux" (c-offsets-alist
            (arglist-cont-nonempty
             c-lineup-gcc-asm-reg
             linux-kernel-coding-style/c-lineup-arglist-tabs-only))))))

(defun linux-kernel-coding-style/setup ()
  (let ((filename (buffer-file-name)))
    ;; Enable kernel mode for the appropriate files
    (setq indent-tabs-mode t)
    (setq tab-width 8)
    (setq c-basic-offset 8)
    (c-set-style "linux-kernel")))

(add-hook 'c-mode-hook 'linux-kernel-coding-style/setup)
