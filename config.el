;;; config/private/+ui.el -*- lexical-binding: t; -*-

(load! "+bindings")
;; (load! "+ui")
(load! "+org")

;; remove doom advice, I don't need deal with comments when newline
(advice-remove #'newline-and-indent #'doom*newline-indent-and-continue-comments)

(after! projectile
  (setq compilation-read-command nil)  ; no prompt in projectile-compile-project
  (projectile-register-project-type 'cmake '("CMakeLists.txt")
                                    :configure "cmake %s"
                                    :compile "cmake --build Debug"
                                    :test "ctest")

  (setq projectile-require-project-root t)
  (setq projectile-project-root-files-top-down-recurring
        (append '("compile_commands.json")
                projectile-project-root-files-top-down-recurring)))

(after! company
  (setq company-minimum-prefix-length 1
        company-idle-delay 0
        company-tooltip-limit 10
        company-show-numbers t
        company-global-modes '(not comint-mode erc-mode message-mode help-mode gud-mode)
        ))


(after! yasnippet
  (add-to-list 'yas-snippet-dirs #'+my-private-snippets-dir nil #'eq))



(after! format
  (set-formatter!
    'clang-format
    '("clang-format"
      ("-assume-filename=%S" (or (buffer-file-name) ""))
      "-style=Google"))
  :modes
  '((c-mode ".c")
    (c++-mode ".cpp")
    (java-mode ".java")
    (objc-mode ".m")
    ))

;; (after! ws-butler
;;   (setq ws-butler-global-exempt-modes
;;         (append ws-butler-global-exempt-modes
;;                 '(prog-mode org-mode))))


;; (after! tex
;;   (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))
;;   (setq-hook! LaTeX-mode TeX-command-default "XeLaTex")

;;   (setq TeX-save-query nil)

;;   (when (fboundp 'eaf-open)
;;     (add-to-list 'TeX-view-program-list '("eaf" TeX-eaf-sync-view))
;;     (add-to-list 'TeX-view-program-selection '(output-pdf "eaf"))))



;; (after! eshell
;;   (setq eshell-directory-name (expand-file-name "eshell" doom-etc-dir)))

(global-auto-revert-mode 0)

(after! lsp
  (setq lsp-auto-guess-root t))

(after! lsp-ui
  (add-hook! 'lsp-ui-mode-hook #'lsp-ui-doc-mode)
  (setq
   lsp-ui-doc-use-webkit nil
   lsp-ui-doc-max-height 20
   lsp-ui-doc-max-width 50
   lsp-ui-sideline-enable nil
   lsp-ui-peek-always-show t)
  (map!
   :map lsp-ui-peek-mode-map
   "h" #'lsp-ui-peek--select-prev-file
   "j" #'lsp-ui-peek--select-next
   "k" #'lsp-ui-peek--select-prev
   "l" #'lsp-ui-peek--select-next-file))

(after! ccls
  (setq ccls-initialization-options `(:cache (:directory ,(expand-file-name "~/Code/ccls_cache"))
                                             :compilationDatabaseDirectory "build"))

  (setq ccls-sem-highlight-method 'font-lock)
  (ccls-use-default-rainbow-sem-highlight)
  (evil-set-initial-state 'ccls-tree-mode 'emacs))


(use-package! visual-regexp
  :commands (vr/query-replace vr/replace))

(use-package! package-lint
  :commands (package-lint-current-buffer))

(use-package! auto-save
  :load-path +my-ext-dir
  :config
  (setq +my-auto-save-timer nil)
  (setq auto-save-slient t))

(use-package! openwith
  :load-path +my-ext-dir
  :config
  (setq openwith-associations
        '(
          ("\\.docx?\\'" "wps" (file))
          ("\\.pptx?\\'" "wpp" (file))
          ("\\.xlsx?\\'" "et" (file))))
  (add-hook! 'emacs-startup-hook :append #'openwith-mode))

;; (use-package eaf
;;   :load-path "~/.emacs.d/lisp/init-eaf.el" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
;;   :custom
;;   (eaf-find-alternate-file-in-dired t)
;;   :config
;;   ;; (setq eaf-proxy-type "socks5")
;;   ;; (setq eaf-proxy-host "127.0.0.1")
;;   ;; (setq eaf-proxy-port "1080")
;;   (eaf-setq eaf-browser-dark-mode "true")
;;   (eaf-setq eaf-mindmap-dark-mode "true")
;;   (eaf-setq eaf-pdf-dark-mode "true")
;;   (eaf-setq eaf-browser-default-zoom "1.5")
;;   (eaf-bind-key scroll_up "RET" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key scroll_down_page "DEL" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key take_photo "p" eaf-camera-keybinding))


;; (use-package company-english-helper
;;   :load-path "~/.emacs.d/site-lisp/company-english-helper")

;; (defun toggle-company-english-helper-e ()
;;   "Toggle company english helper."
;;   (interactive)
;;   (if company-english-helper-active-p
;;       (progn
;;         (setq company-backends (remove 'company-english-helper-search company-backends))
;;         ;; I need remove `company-english-helper-search' with `company-yasnippet',
;;         ;; it's not enough just remove `company-english-helper-search' from `company-backends'
;;         (setq company-backends (remove '(company-english-helper-search :with company-yasnippet) company-backends))
;;         (setq company-english-helper-active-p nil) ;;         (message "English helper has disable."))
;;     (if (not company-mode)
;;         (company-mode t))
;;     (add-to-list 'company-backends 'company-english-helper-search)
;;     (setq company-english-helper-active-p t)
;;     (message "English helper has enable.")))


;; (after! geiser
;;   (setq-default geiser-default-implementation 'chez))

;; (use-package! keyfreq)

;; (use-package! evil-matchit)

;; (use-package! nsis-mode
;;   :mode ("\.[Nn][Ss][HhIi]\'". nsis-mode))


;; server
;; (setq server-auth-dir (expand-file-name doom-etc-dir))
;; (setq server-name "emacs-server-file")
;; (server-start)

;; C Source Directory
(setq find-function-C-source-directory "/home/rick/.emacs.d/source/emacs-26.3")

;; 修改Emacs GC时间
(defvar k-gc-timer
  (run-with-idle-timer 15 t
                       'garbage-collect))

;; 动态修改下次GC的时间
(defmacro k-time (&rest body)
  "Measure and return the time it takes evaluating BODY."
  `(let ((time (current-time)))
     ,@body
     (float-time (time-since time))))

(defvar k-gc-timer
  (run-with-idle-timer 15 t
                       (lambda ()
                         (message "Garbage Collector has run for %.06fsec"
                                  (k-time (garbage-collect))))))

;; Defining some of my evil map.
(define-key evil-normal-state-map (kbd "H") (kbd "^"))
(define-key evil-normal-state-map (kbd "L") (kbd "$"))
(define-key evil-normal-state-map (kbd "K") (kbd "5k"))
(define-key evil-normal-state-map (kbd "J") (kbd "5j"))
(define-key evil-visual-state-map (kbd "H") (kbd "^"))
(define-key evil-visual-state-map (kbd "L") (kbd "$"))

;; Defining tab.
(setq-default tab-width 4)
(setq indent-tabs-mode nil)
(setq c-basic-offset 4)

(map!
 (:leader
   (:desc "run file" :gnv "rf" #'quickrun-shell)
   (:desc "Turn on neotree" :gnv "tt" #'neotree-toggle)
   (:desc "Vterm" :gnv "/" #'vterm)
   )
 )

;; Neotree Configuration
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(add-hook 'neotree-mode-hook
  (lambda ()
    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "l") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
    (define-key evil-normal-state-local-map (kbd "g") 'neotree-refresh)
    (define-key evil-normal-state-local-map (kbd "A") 'neotree-stretch-toggle)
    (define-key evil-normal-state-local-map (kbd "H") 'neotree-hidden-file-toggle)))

;; (use-package company-lsp
;;   :ensure t
;;   :config
;;   (push 'company-lsp company-backends))

;; (use-package lsp-python-ms
;;   :ensure t
;;   :hook
;;   (('python-mode-hook #'lsp)))
;; (use-package js2-mode
;;   :ensure t)
;; (use-package lsp-python-ms
;;   :ensure t
;;   :hook (python-mode . (lambda ()
;;                          (require 'lsp-python-ms)
;;                          (lsp)))
;;   :custom
;;   (lsp-python-ms-executable "~/.emacs.d/var/python-language-server/output/bin/Release/linux-x64/publish/Microsoft.Python.LanguageServer"))

;; 初始化各种包
;; (package-initialize)

;; 递归遍历加载路径
(defun add-subdirs-to-load-path(dir)
  "Recursive add directories to `load-path`"
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))

(let ((gc-cons-threshold most-positive-fixnum)
      (file-name-handler-alist nil))
  (add-subdirs-to-load-path "~/.doom.d/etc/"))

;; 性能测试
;;(load-file "~/.emacs.d/site-lisp/benchmark-init/benchmark.el")

(require 'init-config)
(require '+autoload)


;; (org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("0e8bac1e87493f6954faf5a62e1356ec9365bd5c33398af3e83cfdf662ad955f" "51956e440cec75ba7e4cff6c79f4f8c884a50b220e78e5e05145386f5b381f7b" "7220c44ef252ec651491125f1d95ad555fdfdc88f872d3552766862d63454582" "e1ecb0536abec692b5a5e845067d75273fe36f24d01210bf0aa5842f2a7e029f" default)))
 '(default-input-method "rime")
 '(eaf-find-alternate-file-in-dired t t)
 '(eaf-proxy-host "127.0.0.1")
 '(eaf-proxy-port "1080")
 '(eaf-proxy-type "http")
 '(emojify-emojis-dir "~/.doom.d/var/emojis" t)
 '(lsp-python-ms-executable
   "~/.doom.d/var/python-language-server/output/bin/Release/linux-x64/publish/Microsoft.Python.LanguageServer")
 '(lsp-ui-doc-delay 1)
 '(package-selected-packages
   (quote
    (all-the-icons-ivy-rich ivy-rich yasnippet-snippets yasnippet perspeen google-translate smartparens insert-tranlsated-name benchmark-init youdao-dictionary yaml-mode xah-fly-keys which-key w3m vterm use-package try toc-org telega solarized-theme snazzy-theme rime rainbow-delimiters pdf-tools ox-reveal org-bullets lsp-ui lsp-python-ms jsonrpc json-rpc-server json-rpc js2-mode ivy-posframe htmlize general flycheck esup emojify elisp-format doom-themes doom-modeline dired-icon dashboard dash-docs dakrone-light-theme counsel company-tabnine company-lsp bongo auto-complete amx all-the-icons-ivy all-the-icons-dired ace-window)))
 '(which-key-popup-type (quote side-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0 :foreground "red"))))
 '(mode-line ((t (:family "Source Code Pro" :height 80))))
 '(mode-line-inactive ((t (:family "Source Code Pro" :height 80)))))
