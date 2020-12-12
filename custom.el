;;; custom.el --- user customization file    -*- no-byte-compile: t -*-
;;; Commentary:
;;;       Copy custom-template.el to custom.el and change the configurations, then restart Emacs.
;;;       Put your own configurations in custom-post.el to override default configurations.
;;; Code:

;; (setq centaur-logo nil)                        ; Logo file or nil (official logo)
;; (setq centaur-full-name "user name")           ; User full name
;; (setq centaur-mail-address "user@email.com")   ; Email address
;; (setq centaur-proxy "127.0.0.1:1080")          ; Network proxy
;; (setq centaur-package-archives 'emacs-china)   ; Package repo: melpa, melpa-mirror, emacs-china, netease, tencent or tuna
;; (setq centaur-theme 'classic)                  ; Color theme: default, classic, dark, light or daylight
;; (setq centaur-dashboard nil)                   ; Use dashboard at startup or not: t or nil
;; (setq centaur-lsp 'eglot)                      ; Set LSP client: lsp-mode, eglot or nil
;; (setq centaur-chinese-calendar nil)            ; Use Chinese calendar or not: t or nil
;; (setq centaur-benchmark t)                     ; Enable initialization benchmark or not: t or nil

;; For Emacs devel
;; (setq package-user-dir (locate-user-emacs-file (format "elpa-%s" emacs-major-version)))
;; (setq desktop-base-file-name (format ".emacs-%s.desktop" emacs-major-version))
;; (setq desktop-base-lock-name (format ".emacs-%s.desktop.lock" emacs-major-version))

;; Fonts
(when (display-graphic-p)
  ;; Set default font
  (catch 'loop
    (dolist (font '("SF Mono" "Hack" "Source Code Pro" "Fira Code"
                    "Menlo" "Monaco" "DejaVu Sans Mono" "Consolas"))
      (when (member font (font-family-list))
        (set-face-attribute 'default nil :font font :height (cond
                                                             (sys/mac-x-p 130)
                                                             (sys/win32p 110)
                                                             (t 100)))
        (throw 'loop t))))

  ;; Specify font for all unicode characters
  (catch 'loop
    (dolist (font '("Symbola" "Apple Symbols" "Symbol"))
      (when (member font (font-family-list))
        (set-fontset-font t 'unicode font nil 'prepend)
        (throw 'loop t))))

  ;; Specify font for Chinese characters
  (catch 'loop
    (dolist (font '("WenQuanYi Micro Hei" "Microsoft Yahei"))
      (when (member font (font-family-list))
        (set-fontset-font t '(#x4e00 . #x9fff) font)
        (throw 'loop t)))))

;; Mail
;; (setq message-send-mail-function 'smtpmail-send-it
;;       smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
;;       smtpmail-auth-credentials '(("smtp.gmail.com" 587
;;                                    user-mail-address nil))
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587)

;; Misc.
;; (setq confirm-kill-emacs 'y-or-n-p)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(centaur-package-archives 'melpa)
 '(centaur-theme 'default)
 '(create-lockfiles nil)
 '(dimmer-mode t)
 '(global-display-line-numbers-mode nil)
 '(global-hl-line-mode t)
 '(mac-command-modifier 'meta)
 '(mac-mouse-wheel-mode t)
 '(mac-option-modifier 'super)
 '(markdown-command "pandoc")
 '(org-capture-templates
   '(("i" "Idea" entry
      (file "/Users/steve/org//idea.org")
      "*  %^{Title} %?
%U
%a
")
     ("t" "Todo" entry
      (file "/Users/steve/org//gtd.org")
      "* TODO %?
%U
%a
")
     ("n" "Note" entry
      (file "/Users/steve/org//note.org")
      "* %? :NOTE:
%U
%a
")
     ("j" "Journal" entry
      (file+olp+datetree "/Users/steve/org//journal.org")
      "*  %^{Title} %?
%U
%a
")
     ("b" "Book" entry
      (file+olp+datetree "/Users/steve/org//book.org")
      "* Topic: %^{Description}  %^g %? Added: %U")))
 '(org-roam-directory "/Users/steve/org-roam/")
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("org" . "https://orgmode.org/elpa/")))
 '(which-key-idle-delay 0.5)
 '(which-key-side-window-max-height 1.0))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(all-the-icons-dired-dir-face ((t (:foreground nil))))
 '(aw-leading-char-face ((t (:inherit font-lock-keyword-face :bold t :height 3.0))))
 '(aw-minibuffer-leading-char-face ((t (:inherit font-lock-keyword-face :bold t :height 2.0))))
 '(aw-mode-line-face ((t (:inherit mode-line-emphasis :bold t))))
 '(dashboard-heading ((t (:inherit (font-lock-string-face bold)))))
 '(diff-hl-change ((t (:foreground "#51afef"))))
 '(diff-hl-delete ((t (:background nil))))
 '(diff-hl-insert ((t (:background nil))))
 '(doom-modeline-buffer-file ((t (:inherit (mode-line bold)))))
 '(flycheck-posframe-face ((t (:foreground "#98be65"))))
 '(flycheck-posframe-info-face ((t (:foreground "#98be65"))))
 '(git-timemachine-minibuffer-author-face ((t (:inherit success))))
 '(git-timemachine-minibuffer-detail-face ((t (:inherit warning))))
 '(ivy-minibuffer-match-face-1 ((t (:inherit font-lock-doc-face :foreground nil))))
 '(lsp-ui-doc-background ((t (:background "#23272e"))))
 '(lsp-ui-sideline-code-action ((t (:inherit warning))))
 '(macrostep-expansion-highlight-face ((t (:background "#23272e"))))
 '(org-ellipsis ((t (:foreground nil))))
 '(org-pomodoro-mode-line ((t (:inherit warning))))
 '(org-pomodoro-mode-line-break ((t (:inherit success))))
 '(org-pomodoro-mode-line-overtime ((t (:inherit error))))
 '(pulse-highlight-face ((t (:inherit region))))
 '(pulse-highlight-start-face ((t (:inherit region))))
 '(symbol-overlay-default-face ((t (:inherit 'region))))
 '(symbol-overlay-face-1 ((t (:inherit 'highlight))))
 '(symbol-overlay-face-2 ((t (:inherit 'font-lock-builtin-face :inverse-video t))))
 '(symbol-overlay-face-3 ((t (:inherit 'warning :inverse-video t))))
 '(symbol-overlay-face-4 ((t (:inherit 'font-lock-constant-face :inverse-video t))))
 '(symbol-overlay-face-5 ((t (:inherit 'error :inverse-video t))))
 '(symbol-overlay-face-6 ((t (:inherit 'dired-mark :inverse-video t :bold nil))))
 '(symbol-overlay-face-7 ((t (:inherit 'success :inverse-video t))))
 '(symbol-overlay-face-8 ((t (:inherit 'dired-symlink :inverse-video t :bold nil))))
 '(ztreep-arrow-face ((t (:inherit font-lock-comment-face))))
 '(ztreep-diff-header-face ((t (:inherit (diff-header bold)))))
 '(ztreep-diff-header-small-face ((t (:inherit diff-file-header))))
 '(ztreep-diff-model-add-face ((t (:inherit diff-nonexistent))))
 '(ztreep-diff-model-diff-face ((t (:inherit diff-removed))))
 '(ztreep-diff-model-ignored-face ((t (:inherit font-lock-doc-face :strike-through t))))
 '(ztreep-diff-model-normal-face ((t (:inherit font-lock-doc-face))))
 '(ztreep-expand-sign-face ((t (:inherit font-lock-function-name-face))))
 '(ztreep-header-face ((t (:inherit diff-header))))
 '(ztreep-leaf-face ((t (:inherit diff-index))))
 '(ztreep-node-face ((t (:inherit font-lock-variable-name-face)))))

;;; custom.el ends here
