(use-package flycheck
        :ensure t
        :init (global-flycheck-mode)
        :bind (:map leader-key
                    ("t t" . global-flycheck-mode))
        :config
        (which-key-add-key-based-replacements
          "M-SPC t t" "开关flycheck"))

(use-package lsp-ui
        :ensure t
        :hook
        ((lsp . lsp-ui-sideline-mode-hook)
         (lsp . lsp-ui-doc-mode-hook)
         (lsp . lsp-ui-imenu-mode-hook)
         (lsp . lsp-ui-peek-mode-hook)
         )
        :custom
        (lsp-ui-doc-delay 1))

(use-package company-lsp
        :ensure t
        :config
        (push 'company-lsp company-backends))

(use-package lsp-python-ms
        :ensure t
        :hook (python-mode . (lambda ()
                               (require 'lsp-python-ms)
                               (lsp)))
        :custom
        (lsp-python-ms-executable "~/.emacs.d/var/python-language-server/output/bin/Release/linux-x64/publish/Microsoft.Python.LanguageServer"))

(use-package insert-translated-name
  :load-path "~/.emacs.d/site-lisp/insert-translated-name"
  :bind (:map leader-key
              ("c n i" . #'insert-translated-name-insert)
              ("c n r" . #'insert-translated-name-replace))
  :config
  (which-key-add-prefix-title
    "M-SPC c n" "insert-translated-name"))

(use-package yasnippet-snippets
  :ensure t)



(provide 'init-prog)
