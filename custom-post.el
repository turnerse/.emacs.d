;;;; This file is loaded from init-custom.el

;;; created by Steve Turner

(setq mac-command-modifier 'meta) ;; default = 'meta
(setq mac-option-modifier 'super) ;; default = none

(load-theme 'doom-molokai t)

;; Common Lisp
(setq inferior-lisp-program "ros -Q run")

;;;  enable narrow-to-region
(put 'narrow-to-region 'disabled nil)

;;;  which-key
(which-key-setup-side-window-right)
;;; end
