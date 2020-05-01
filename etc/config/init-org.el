(use-package 
      org 
      :ensure t)

(use-package 
          org-bullets
          :ensure t
          :after org
          :config
          (add-hook 'org-mode-hook (lambda () 
                                     (org-bullets-mode t))))

(provide 'init-org)
