;; 加载主题
;; (load-file "~/.emacs.d/themes/oswald-theme.el")
(load-theme 'doom-one t)
;; 设置透明
(set-frame-parameter nil 'alpha '(95 .100))
;; 设置光标颜色
(set-cursor-color "green2")
;; 设置光标样式
(setq-default cursor-type 'box)
;; 去除默认启动界面
(setq inhibit-startup-message t)
;; 设置英文字体
;; (set-face-attribute 'default nil :font "Fira Code Retina 13")
(set-face-attribute 'default nil :font "Source Code Pro 9")
;; 设置中文字体
(set-fontset-font t 'han "Sarasa Mono SC 8")

(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
  :load-path "/home/rick/.emacs.d/site-lisp/all-the-icons-dired/"
  :hook
  ('dired-mode . 'all-the-icons-dired-mode))

(use-package emojify
  :hook 'after-init-hook #'global-emojify-mode
  :custom
  (emojify-emojis-dir "~/.doom.d/var/emojis"))

(use-package page-break-lines
  :ensure nil
  :config
  (turn-on-page-break-lines-mode))

(use-package 
  dashboard
  :ensure t 
  :config (dashboard-setup-startup-hook) 
  (dashboard-modify-heading-icons '((recents . "file-text") 
                                    (bookmarks . "book")))
  ;; 设置标题
  (setq dashboard-banner-logo-title "Life is fantastic!")
  ;; 设置banner
  ; (setq +doom-dashboard-banner-file (expand-file-name "~/.doom.d/banner/ue-colorful.png" doom-private-dir))
  (setq dashboard-startup-banner "/home/rick/.doom.d/var/banner/ue-colorful.png")
  (setq dashboard-center-content t) 
  (setq dashboard-set-heading-icons t) 
  (setq dashboard-set-file-icons t) 
  (setq dashboard-set-navigator t))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 5)
  (custom-set-faces
   '(mode-line ((t (:family "Source Code Pro 5" :height 25))))
   '(mode-line-inactive ((t (:family "Source Code Pro 5" :height 25))))))
(setq doom-modeline-bar-width 1)

(use-package posframe
  :ensure t)

(use-package 
  rainbow-delimiters
  :ensure t
  :config
  ;; 设置每一级括号的颜色
  (set-face-foreground 'rainbow-delimiters-depth-1-face "orange red")
  (set-face-foreground 'rainbow-delimiters-depth-2-face "gold")
  (set-face-foreground 'rainbow-delimiters-depth-3-face "yellow")
  (set-face-foreground 'rainbow-delimiters-depth-4-face "spring green")
  (set-face-foreground 'rainbow-delimiters-depth-5-face "cyan")
  (set-face-foreground 'rainbow-delimiters-depth-6-face "magenta")
  (set-face-foreground 'rainbow-delimiters-depth-7-face "goldenrod")
  (set-face-foreground 'rainbow-delimiters-depth-8-face "IndianRed1")
  (set-face-foreground 'rainbow-delimiters-depth-9-face "ivory1")

  (set-face-bold 'rainbow-delimiters-depth-1-face "orange red")
  (set-face-bold 'rainbow-delimiters-depth-2-face "gold")
  (set-face-bold 'rainbow-delimiters-depth-3-face "yellow")
  (set-face-bold 'rainbow-delimiters-depth-4-face "spring green")
  (set-face-bold 'rainbow-delimiters-depth-5-face "cyan")
  (set-face-bold 'rainbow-delimiters-depth-6-face "magenta")
  (set-face-bold 'rainbow-delimiters-depth-7-face "goldenrod")
  (set-face-bold 'rainbow-delimiters-depth-8-face "IndianRed1")
  (set-face-bold 'rainbow-delimiters-depth-9-face "ivory1")
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))


;; 为上层提供 init-ui 模块
(provide 'init-ui)
