;------------------------------------------
; useful functions for modulize emacs config
;-----------------------------------------
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))


(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))




;; packages
(load-user-file "package.el")

;; custom configs
(load-user-file "custom-setting.el")

;; Invert to dark mode
; (invert-face 'default)

(global-set-key [remap list-buffers] 'ibuffer)
; use M-o to move between windows
(global-set-key (kbd "M-o") 'other-window)
; enable S-<left> S-<up>... to move between windwos
(windmove-default-keybindings)

;; theme
(load-theme 'arc-dark t)

;------------------------
; program languages
;-----------------------
;;; js
;; Enable number and relative number(like vim)
;; (menu-bar--display-line-numbers-mode-relative 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-use-system-font t)
 '(global-display-line-numbers-mode t)
 '(global-superword-mode t)
 '(ido-enable-flex-matching t)
 '(ido-mode 'both nil (ido))
 '(package-selected-packages '(geiser-guile)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata Nerd Font" :foundry "CYRE" :slant normal :weight regular :height 173 :width normal)))))
