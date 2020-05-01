(use-package awesome-pair
  :disabled
  :load-path "/home/rick/.emacs.d/site-lisp/awesome-pair"
  :config (dolist (hook (list 'c-mode-common-hook 'c-mode-hook 'c++-mode-hook 'java-mode-hook
                              'haskell-mode-hook 'emacs-lisp-mode-hook 'lisp-interaction-mode-hook
                              'lisp-mode-hook 'maxima-mode-hook 'ielm-mode-hook 'sh-mode-hook
                              'makefile-gmake-mode-hook 'php-mode-hook 'python-mode-hook
                              'js-mode-hook 'go-mode-hook 'qml-mode-hook 'jade-mode-hook
                              'css-mode-hook 'ruby-mode-hook 'coffee-mode-hook 'rust-mode-hook
                              'qmake-mode-hook 'lua-mode-hook 'swift-mode-hook
                              'minibuffer-inactive-mode-hook)) 
            (add-hook hook '(lambda () 
                              (awesome-pair-mode 1))))
  :bind (:map awesome-pair-mode-map
              ("(" . #'awesome-pair-open-round)
              ("(" . #'awesome-pair-open-round)
              ("[" . #'awesome-pair-open-bracket)
              ("{" . #'awesome-pair-open-curly)
              ("" . #'awesome-pair-close-round)
              ("]" . #'awesome-pair-close-bracket)
              ("}" . #'awesome-pair-close-curly)
              ("=" . #'awesome-pair-equal)
              ("%" . #'awesome-pair-match-paren)
              ("\"" . #'awesome-pair-double-quote)
              ("SPC" . #'awesome-pair-space)
              ("M-o" . #'awesome-pair-backward-delete)
              ("C-d" . #'awesome-pair-forward-delete)
              ("C-k" . #'awesome-pair-kill)
              ("M-\"" . #'awesome-pair-wrap-double-quote)
              ("M-[" . #'awesome-pair-wrap-bracket)
              ("M-{" . #'awesome-pair-wrap-curly)
              ("M-(" . #'awesome-pair-wrap-round)
              ("M-)" . #'awesome-pair-unwrap)
              ("M-p" . #'awesome-pair-jump-right)
              ("M-n" . #'awesome-pair-jump-left)
              ("M-:" . #'awesome-pair-jump-out-pair-and-newline)))
(use-package smartparens
  :ensure t
  :hook ('prog-mode . 'smartparens-global-mode))

(use-package company-english-helper
  :load-path "/home/rick/.emacs.d/site-lisp/company-english-helper"
  :config
  (define-key leader-key (kbd "t e") 'toggle-company-english-helper))

(use-package 
  telega
  :defer 2
  :init (setq telega-proxies 
              '((:server "localhost" 
                         :port 1080 
                         :enable t 
                         :type (:@type "proxyTypeSocks5")))) 
  (setq telega-chat-fill-column 65) 
  (setq telega-emoji-use-images nil) 
  :config
  (set-fontset-font t 'unicode (font-spec :family "Symbola") nil 'prepend) 
  (with-eval-after-load 'company (add-hook 'telega-chat-mode-hook (lambda () 
                                                                    (make-local-variable
                                                                     'company-backends) 
                                                                    (dolist (it
                                                                             '(telega-company-botcmd
                                                                               telega-company-emoji)) 
                                                                      (push it company-backends))))) 
  (with-eval-after-load 'all-the-icons (add-to-list 'all-the-icons-mode-icon-alist
                                                    '(telega-root-mode all-the-icons-fileicon
                                                                       "telegram" 
                                                                       :heigt 1.0 
                                                                       :v-adjust -0.2 
                                                                       :face all-the-icons-yellow)) 
                        (add-to-list 'all-the-icons-mode-icon-alist '(telega-chat-mode
                                                                      all-the-icons-fileicon
                                                                      "telegram" 
                                                                      :heigt 1.0 
                                                                      :v-adjust -0.2 
                                                                      :face all-the-icons-blue))) 
  (telega-notifications-mode 1) 
  (telega-mode-line-mode 1))

(use-package vterm
  :defer 2
  :config
  :bind (:map leader-key
              ("o t" . 'vterm)))

(use-package youdao-dictionary
  :defer 2
  :ensure t
  :config
  (setq url-automatic-caching t)
  (which-key-add-key-based-replacements "C-x y" "有道翻译")
  :bind 
  (("C-x y t" . 'youdao-dictionary-search-at-point-tooltip)
   ("C-x y p" . 'youdao-dictionary-play-voice-at-point)
   ("C-x y r" . 'youdao-dictionary-search-and-replace)
   ("C-x y i" . 'youdao-dictionary-search-from-input)))

(use-package bongo
  :defer 2
  :config (defun bongo-init () 
            (interactive) 
            (let ((buffer (current-buffer))) 
              (bongo)
              (setq bongo-insert-whole-directory-trees "ask") 
              (bongo-insert-file "~/Music") 
              (bongo-insert-enqueue-region (point-min) 
                                           (point-max)) 
              (bongo-play-random) 
              (switch-to-buffer buffer)))
  :bind (:map leader-key                    
              ("b RET" . 'bongo-dwim) 
              ("b i" . 'bongo-init) 
              ("b x" . 'bongo-kill-region) 
              ("b d" . 'bongo-kill-line) 
              ("b _" . 'bongo-undo) 
              ("b SPC" . 'bongo-pause/resume) 
              ("b TAB" . 'bongo-toggle-collapsed) 
              ("b h" . 'bongo-seek-backward-10) 
              ("b l" . 'bongo-seek-forward-10) 
              ("b a" . 'bongo-insert-enqueue) 
              ("b n" . 'bongo-play-next) 
              ("b p" . 'bongo-play-previous) 
              ("b r" . 'bongo-play-random) 
              ("b s" . 'bongo-sprinkle)))

(use-package pdf-tools
  :ensure t
  :hook
  ('doc-view-mode 'pdf-view-mode-hook))

(use-package windmove
  :ensure t
  :init (windmove-default-keybindings)
  :config
  :bind (:map leader-key
              ("w f" . #'windmove-right)
              ("w b" . #'windmove-left)
              ("w p" . #'windmove-up)
              ("w n" . #'windmove-down)))
(use-package hideshow
  :ensure nil
  :diminish hs-minor-mode
  :bind (:map prog-mode-map
              ("C-c TAB" . hs-toggle-hiding)
              ("C-c p +" . hs-show-all))
  :hook (prog-mode . hs-minor-mode))

(use-package try
  :ensure t)

;; 谷歌翻译
(use-package google-translate
  :ensure t
  :config
  (setq google-translate--tkk-url "http://translate.google.cn/"
        google-translate-base-url "http://translate.google.cn/translate\_a/single"
        google-translate-listen-url "https://translate.google.cn/translate\_tts"
        google-translate-default-target-language "zh-CN"
        google-translate-default-source-language "en"))

(use-package perspeen
  :ensure t
  :init
  (setq perspeen-use-tab t)
  (setq perspeen-keymap-prefix (kbd "C-."))
  :config
  (perspeen-mode))

(use-package eaf
  :ensure nil
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
  :custom
        (eaf-find-alternate-file-in-dired t)
        (eaf-proxy-type "http")
        (eaf-proxy-host "127.0.0.1")
        (eaf-proxy-port "1080")
        :config
        (eaf-setq eaf-browser-dark-mode "true")
        (eaf-setq eaf-mindmap-dark-mode "true")
        (eaf-setq eaf-pdf-dark-mode "true")
        (eaf-setq eaf-browser-default-zoom "1.5")
        (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
        (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
        (eaf-bind-key take_photo "p" eaf-camera-keybinding))

(provide 'init-tools)
