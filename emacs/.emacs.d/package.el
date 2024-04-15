(require 'package)

;----------------------------
; packages repo
;------------------------------
(add-to-list 'package-archives
  '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/"))

;----------------------------
; installed packages
;---------------------------
; (package-initialize)
; (package-refresh-contents)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))
;; Enable Evil
(require 'evil)
;; (evil-mode 1)

; Download go-mod
; (unless (package-install-p ))


;; dart(flutter)
(setq package-selected-packages 
  '(dart-mode lsp-mode lsp-dart lsp-treemacs flycheck company
    ;; Optional packages
    lsp-ui company hover))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

(add-hook 'dart-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024))
