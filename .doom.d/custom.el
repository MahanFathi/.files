(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-backends '(company-clang company-clang))
 '(lisp-mode-hook
   '(+lookup--init-lisp-mode-handlers-h rainbow-delimiters-mode +evil-embrace-lisp-mode-hook-h sly-editing-mode))
 '(package-selected-packages '(company-lsp)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
