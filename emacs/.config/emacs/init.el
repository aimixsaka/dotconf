;; attribute
(global-display-line-numbers-mode)

(put 'upcase-region 'disabled nil)

(setq backup-directory-alist '((".*" . "/tmp/emacs-bak")))
(setq enable-recursive-minibuffers t)
(with-eval-after-load 'chistory
  (setq list-command-history-max 120)
  (define-key command-history-map (kbd "<return>") 'command-history-repeat))

(windmove-default-keybindings)

;; keybinding
(defun undo-yank (arg)
  "Undo the yank you just did. Really, adjust just-yanked text like \\[yank-pop] does, but in the opposite direction."
  (interactive "p")
  (yank-pop (- arg)))
(global-set-key (kbd "C-M-Y") 'undo-yank)


(defun open-init-file()
  (interactive)
  (find-file "~/.config/emacs/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

(global-set-key "\C-x\C-n" 'other-window)
(defun other-window-backward (n)
  "Select Nth previous window."
  (interactive "p")
  (other-window (- n)))
(global-set-key "\C-x\C-p" 'other-window-backward)


;;; custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doc-view-resolution 600)
 '(evil-emacs-state-modes
   '(5x5-mode archive-mode bbdb-mode biblio-selection-mode blackbox-mode
	      bookmark-bmenu-mode bookmark-edit-annotation-mode
	      browse-kill-ring-mode bs-mode bubbles-mode
	      bzr-annotate-mode calc-mode cfw:calendar-mode
	      completion-list-mode Custom-mode
	      custom-theme-choose-mode debugger-mode
	      delicious-search-mode desktop-menu-blist-mode
	      desktop-menu-mode doc-view-mode dun-mode
	      dvc-bookmarks-mode dvc-diff-mode dvc-info-buffer-mode
	      dvc-log-buffer-mode dvc-revlist-mode dvc-revlog-mode
	      dvc-status-mode dvc-tips-mode ediff-mode ediff-meta-mode
	      efs-mode Electric-buffer-menu-mode emms-browser-mode
	      emms-mark-mode emms-metaplaylist-mode emms-playlist-mode
	      ess-help-mode etags-select-mode fj-mode gc-issues-mode
	      gdb-breakpoints-mode gdb-disassembly-mode
	      gdb-frames-mode gdb-locals-mode gdb-memory-mode
	      gdb-registers-mode gdb-threads-mode gist-list-mode
	      git-rebase-mode gnus-article-mode gnus-browse-mode
	      gnus-group-mode gnus-server-mode gnus-summary-mode
	      gomoku-mode google-maps-static-mode ibuffer-mode
	      jde-javadoc-checker-report-mode magit-cherry-mode
	      magit-diff-mode magit-log-mode magit-log-select-mode
	      magit-popup-mode magit-popup-sequence-mode
	      magit-process-mode magit-reflog-mode magit-refs-mode
	      magit-revision-mode magit-stash-mode magit-stashes-mode
	      magit-status-mode mh-folder-mode monky-mode mpuz-mode
	      mu4e-main-mode mu4e-headers-mode mu4e-view-mode
	      notmuch-hello-mode notmuch-search-mode notmuch-show-mode
	      notmuch-tree-mode occur-mode org-agenda-mode
	      package-menu-mode pdf-outline-buffer-mode pdf-view-mode
	      proced-mode rcirc-mode rebase-mode recentf-dialog-mode
	      reftex-select-bib-mode reftex-select-label-mode
	      reftex-toc-mode sldb-mode slime-inspector-mode
	      slime-thread-control-mode slime-xref-mode snake-mode
	      solitaire-mode sr-buttons-mode sr-mode sr-tree-mode
	      sr-virtual-mode tar-mode tetris-mode tla-annotate-mode
	      tla-archive-list-mode tla-bconfig-mode
	      tla-bookmarks-mode tla-branch-list-mode tla-browse-mode
	      tla-category-list-mode tla-changelog-mode
	      tla-follow-symlinks-mode tla-inventory-file-mode
	      tla-inventory-mode tla-lint-mode tla-logs-mode
	      tla-revision-list-mode tla-revlog-mode
	      tla-tree-lint-mode tla-version-list-mode twittering-mode
	      urlview-mode vc-annotate-mode vc-dir-mode
	      vc-git-log-view-mode vc-hg-log-view-mode
	      vc-svn-log-view-mode vm-mode vm-summary-mode w3m-mode
	      wab-compilation-mode xgit-annotate-mode
	      xgit-changelog-mode xgit-diff-mode xgit-revlog-mode
	      xhg-annotate-mode xhg-log-mode xhg-mode xhg-mq-mode
	      xhg-mq-sub-mode xhg-status-extra-mode telega-chat-mode))
 '(evil-undo-system 'undo-redo)
 '(evil-want-C-u-delete t)
 '(evil-want-C-u-scroll t)
 '(evil-want-C-w-delete t)
 '(package-selected-packages '(consult evil marginalia sly telega vertico))
 '(telega-notifications-mode t)
 '(telega-server-libs-prefix "/usr"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:weight regular :height 170 :width normal :family "DejaVu Sans Mono")))))


;; package
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq completion-styls '(partial-completion substring flex))
(defun p-install (package)
    (unless (package-installed-p package)
      (with-demoted-errors "%s"
	(unless package-archive-contents
	  (package-refresh-contents))
	(package-install package))))

(p-install 'vertico)
(with-demoted-errors "%s" (vertico-mode +1))

(p-install 'marginalia)
(with-demoted-errors "%s" (marginalia-mode +1))

(p-install 'sly)
(setq inferior-lisp-program "sbcl")

(p-install 'telega)

;; (p-install 'evil)
;; (with-demoted-errors "%s" (evil-mode +1))
;; ;; use vertico for evil-ex
;; (p-install 'consult)
;; (setq completion-in-region-function 'consult-completion-in-region)
