;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; .emacs
;
; This is my Emacs initialization file. For now I know that it only works
; with Emacs, not Xemacs
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; I am going to put my initialization code in ~/.myemacs directory
(setq load-path (append '("~/.myemacs") load-path))

;; Are we running XEmacs or Emacs?
(defvar running-xemacs (string-match "XEmacs\\|Lucid" emacs-version))

;; Load useful emacs modules
;;(load "s-region")           ;;; Enable marking by SHIFT+motion
(load "paren")              ;;; Highlight whatever paren matches
(load "saveplace")          ;;; Save cursor position between editing sessions
(load "verilog-mode")       ;;; Verilog language mode
(load "xcscope")            ;; Cscope support
(load "p4-mode")            ;; P4 lanuage mode

;; Now, load my stuff
(load "global-prefs")
(load "status-line")
(load "file-types")
(load "c-mode-prefs")

;; Start Emacs Server
;; (load "emacs-server")

;; Load keyboard bindings and menus
(load "new-Xmenus")
(load "utils")
(load "pc-kbd")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (adwaita)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
