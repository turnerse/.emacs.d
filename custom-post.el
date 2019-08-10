;;;; This file is loaded from init-custom.el

;;; created by Steve Turner

(setq mac-command-modifier 'meta) ;; default = 'meta
(setq mac-option-modifier 'super) ;; default = none

;; Slime
(load (expand-file-name "~/.roswell/helper.el"))
(setq inferior-lisp-program "ros -Q run")
