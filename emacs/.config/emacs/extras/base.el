;; Eat: Emulate A Terminal  -*- lexical-binding: t; -*-
(use-package eat
  :ensure t
  :custom
  (eat-term-name "xterm")
  :config
  (eat-eshell-mode)                     ; use Eat to handle term codes in program output
  (eat-eshell-visual-command-mode))     ; commands like less will be handled by Eat


;; multi-occur on project or dired
(use-package noccur
  :straight (noccur :type git :host github :repo "NicolasPetton/noccur.el"))
