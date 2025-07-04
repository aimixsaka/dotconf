;; emacs keybinds
(define-configuration buffer
  ((default-modes
    (pushnew 'nyxt/mode/emacs:emacs-mode %slot-value%))))

(define-configuration input-buffer
  ((override-map
    (let ((map (make-keymap "override-map")))
      (define-key map "M-x" 'execute-command "C-space" 'nothing)))))

(defvar *my-search-engines*
  (list
   '("google" "https://google.com/search?q=~a" "https://google.com"))
  "List of search engines.")

(define-configuration context-buffer
  "Go through the search engines above and make-search-engine out of them."
  ((search-engines
    (append %slot-default%
	    (mapcar
	     (lambda (engine) (apply 'make-search-engine engine))
	     *my-search-engines*)))))
