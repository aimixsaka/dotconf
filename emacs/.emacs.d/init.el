;; package related
(require 'package)
(setq package-archives '(("gnu" . "https://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("nongnu" . "https://mirrors.ustc.edu.cn/elpa/nongnu/")))
(package-initialize)
(unless package-archive-contents
  package-refresh-contents)

(use-package emacs
  :ensure nil
  :init
  (load-theme 'arc-dark t))

(use-package eglot
  :hook (prog-mode . eglot-ensure))

(use-package vterm
  :ensure t)

(use-package evil
  :ensure t
  :config
  (evil-mode))
(use-package eldoc
  :init
  (global-eldoc-mode))

(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package helm
  :ensure t
  :config
  (helm-mode 1))

(use-package tree-sitter-langs
  :ensure t)
  

(global-set-key [remap list-buffers] 'ibuffer)

;; (define-key evil-normal-state-map "c" nil)
;; (define-key evil-motion-state-map "cu" 'universal-argument)

(evil-define-key '(normal visual) 'global (kbd "M-+") 'evil-numbers/inc-at-pt)
(evil-define-key '(normal visual) 'global (kbd "M--") 'evil-numbers/dec-at-pt)
(evil-define-key '(normal insert) 'global (kbd "C-y") 'yank)
(evil-define-key '(normal insert) 'global (kbd "C-e") 'move-end-of-line)
;(evil-define-key '(normal) 'global (kbd "C-t") 'transpose-chars)

(global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)
(global-set-key (kbd "C-c C-+") 'evil-numbers/inc-at-pt-incremental)
(global-set-key (kbd "C-c C--") 'evil-numbers/dec-at-pt-incremental)
; use M-o to move between windows
(global-set-key (kbd "M-o") 'other-window)
; imenu key
(global-set-key (kbd "M-i") 'imenu)

; enable S-<left> S-<up>... to move between windwos
(windmove-default-keybindings)


;; add nix path to PATH
(add-to-list 'exec-path "/run/current-system/sw/bin")
(setenv "PATH" (format "%s:%s" "/run/current-system/sw/bin" (getenv "PATH")))


;;; I prefer cmd key for meta
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'super
      mac-option-modifier 'meta)

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-default-style
   '((c-mode . "linux") (java-mode . "java") (awk-mode . "awk")
     (other . "gnu")))
 '(evil-undo-system 'undo-redo)
 '(evil-want-C-u-delete t)
 '(evil-want-C-u-scroll t)
 '(font-use-system-font t)
 '(global-display-line-numbers-mode t)
 '(global-superword-mode t)
 '(ido-enable-flex-matching t)
 '(ido-mode 'both nil (ido))
 '(isearch-allow-motion t)
 '(menu-bar-mode nil)
 '(mouse-wheel-progressive-speed nil)
 '(package-selected-packages
   '(company evil evil-numbers geiser geiser-guile geiser-racket
	     haskell-mode helm sis slime tree-sitter-langs vterm
	     zig-mode))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#21252b" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 170 :width normal :foundry "nil" :family "DejaVu Sans Mono")))))



(ido-mode 1)
(setq ido-enable-flex-matching t)

;; (setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq evil-emacs-state-modes '(vterm-mode))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(sis-ism-lazyman-config "org.fcitx.inputmethod.Fcitx5" "org.fcitx.inputmethod.Fcitx5" 'fcitx5)

(setq inferior-lisp-program "sbcl")

(setq major-mode-remap-alist
      '((python-mode . python-ts-mode)))

(add-to-list 'tree-sitter-major-mode-language-alist
	     '(python-ts-mode . python))


(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
