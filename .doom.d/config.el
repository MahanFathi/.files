;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "Mahan Fathi"
      user-mail-address "mahan0fathi@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; test
(setq doom-font (font-spec :family "Fira Code" :size 18)
      doom-variable-pitch-font (font-spec :family "sans"))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-city-lights)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type 'relative)

;; ibuffer instead of list-buffers
;; (global-set-key (kbd "C-x C-b") 'ibuffer)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;;============================================================
;; NOTE: Mahan added these: BEGIN
;;============================================================

;; for file changes on disk (e.g. on git checkout)
(global-auto-revert-mode)

;; comment-line
(global-set-key (kbd "C-\\") 'comment-line)
(global-set-key (kbd "C-/") 'comment-line)

;; fix TAB in evil-mode
(define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)

;; helm
(require 'helm-config)

;; ggtags settings
(require 'ggtags)

;; helm-gtags settings
(require 'helm-gtags)
(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)
(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-]") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-[") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

;; company settings
(global-company-mode)
(use-package company
  :config
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 3)
)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
)
;; for C/C++ auto-completion
(use-package company-irony
  :config
  (add-to-list 'company-backends 'company-irony)
  (add-to-list 'company-backends 'company-irony-c-headers)
  (add-to-list 'company-backends 'company-c-headers)
  (add-to-list 'company-backends 'company-jedi))
;;(setq c-c++-enable-clang-support nil)
;;(setq company-c-headers-path-system '("/usr/include/c++/9.2.0" "/usr/include" "/usr/local/include"))
(use-package irony
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))
(with-eval-after-load 'company
  (add-hook 'c++-mode-hook 'company-mode)
  (add-hook 'c-mode-hook 'company-mode))
;; for Python auto-completion
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-hook 'python-mode-hook 'jedi-mode)
(setq jedi:setup-keys t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:key-goto-definition (kbd "M-]"))
(setq jedi:key-goto-definition-pop-marker (kbd "M-["))
(setq python-shell-completion-native-enable nil)
;(setq python-shell-interpreter "python3")
;(define-key jedi-mode-map (kbd "C-c .") nil)
;(define-key jedi-mode-map (kbd "C-c ,") nil)
;(define-key jedi-mode-map (kbd "M-]") 'jedi:goto-definition)
;(define-key jedi-mode-map (kbd "M-[") 'jedi:goto-definition-pop-marker)
;(define-key jedi-mode-map (kbd "M-]") 'jedi:goto-definition)
;(define-key jedi-mode-map (kbd "M-[") 'jedi:goto-definition-pop-marker)

;; elpy, the python ide
(use-package elpy)
(elpy-enable)
(add-hook 'python-mode-hook 'elpy-mode)
(add-hook 'elpy-mode-hook 'flycheck-mode)
(add-hook 'pyenv-mode-hook 'elpy-rpc-restrat)
(setq elpy-rpc-backend "jedi")
(define-key elpy-mode-map (kbd "C-M-n") 'elpy-nav-forward-block)
(define-key elpy-mode-map (kbd "C-M-p") 'elpy-nav-backward-block)
(define-key elpy-mode-map (kbd "S-k") nil)
;; (setq elpy-rpc-python-command "python3.6")
;; (setq python-shell-interpreter "python3.6")

;; projectile
(setq projectile-project-search-path
      '(
        "~/Mahan/UC"
        )
      )

;; org-mode
;; (after! org
;;   (setq org-agenda-files '("~/Mahan/org"))
;;   (org-babel-do-load-languages
;;    'org-babel-load-languages
;;    '(
;;      (c++ . t)
;;      (python . t)
;;      (ditaa . t)
;;      (dot . t)
;;     )
;;   )
;; )

;; avy for all windows
(setq avy-all-windows t)

;; ispell dicionary
(ispell-change-dictionary "english")


;; common lisp
;(define-key sly-mode-map (kbd "<M-up>") 'sly-prev-completion)
;(define-key sly-mode-map (kbd "<M-down>") 'sly-next-completion)
;(define-key sly-mode-map (kbd "<M-RET>") 'sly-choose-completion)


;; go
;; FIXME: this is very nasty
(add-hook 'go-mode-hook (lambda () (progn
                                     (require 'go-autocomplete)
                                     (require 'auto-complete-config)
                                     (ac-config-default))))

;;============================================================
;; NOTE: Mahan added these: END
;;============================================================


