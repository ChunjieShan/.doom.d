;; yes-or-no-p to y-or-n-p
(fset 'yes-or-no-p 'y-or-n-p)
(setq user-emacs-directory "~/.doom.d/var")
;; 设置最近打开文件缓存的路径
(setq recentf-save-file "~/.doom.d/var/recentf")
;; 设置书签文件路径
(setq bookmark-default-file "~/.doom.d/var/bookmarks")
(setq bookmark-file "~/.doom.d/var/bookmarks")
;; 设置amx保存文件的路径
(setq amx-save-file "~/.doom.d/var/amx-items")
;; 设置自动保存路径
(setq auto-save-list-file-prefix "~/.doom.d/var/auto-save-list/.saves-")
;; 设置eshell历史记录
(setq eshell-history-file-name "~/.doom.d/var/eshell/history")
;; 关闭滚动条
(scroll-bar-mode -1)

;; 关闭工具栏
(tool-bar-mode -1)

;; 关闭菜单栏
(menu-bar-mode -1)

;; 关闭GUI功能
(setq use-file-dialog nil use-dialog-box nil inhibit-startup-screen t inhibit-startup-message t)

;; 关闭备份
(setq make-backup-files nil auto-save-default nil)

;; 关闭锁文件
(setq create-lockfiles nil)

;; 总是加载最新的文件
(setq load-prefer-newer t)

;; 关闭字体缓存gc
(setq inhibit-compacting-font-caches nil)

;; 关闭烦人的提示
(setq ring-bell-function 'ignore blink-cursor-mode nil)

;; 任何地方都使用UTF-8
(set-charset-priority 'unicode) 
(setq locale-coding-system   'utf-8)    ; pretty
(set-terminal-coding-system  'utf-8)    ; pretty
(set-keyboard-coding-system  'utf-8)    ; pretty
(set-selection-coding-system 'utf-8)    ; please
(prefer-coding-system        'utf-8)    ; with sugar on top
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;; 更友好和平滑的滚动
(setq scroll-step 2
  scroll-margin 2
  hscroll-step 2
  hscroll-margin 2
  scroll-conservatively 101
  scroll-up-aggressively 0.01
  scroll-down-aggressively 0.01
  scroll-preserve-screen-position 'always)

;; 关闭自动调节行高
(setq auto-window-vscroll nil)

;; 创建新行的动作
(global-set-key (kbd "RET") 'newline-and-indent) 
(global-set-key (kbd "S-<return>") 'comment-indent-new-line)

;; 让光标无法离开视线
(setq mouse-yank-at-point nil)

;; 行宽
(setq-default fill-column 80)

;; 让'_'被视为单词的一部分
(add-hook 'after-change-major-mode-hook (lambda () 
                                          (modify-syntax-entry ?_ "w")))
;; "-" 同上)
(add-hook 'after-change-major-mode-hook (lambda () 
                                          (modify-syntax-entry ?- "w")))
;; 没有制表符
(setq-default indent-tabs-mode nil) 
(setq-default tab-width 4)

;; 高亮括号
(show-paren-mode 1)

(use-package which-key
  :ensure t
  :custom
  (which-key-popup-type 'side-window)
  :config
  (which-key-mode))

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0 :foreground "red")))))))

(use-package swiper
  :bind
  (("C-s" . swiper)
   ("C-r" . swiper)
   ("C-c C-r" . ivy-resume)
   ("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)))

(use-package 
  counsel
  :hook
  ('counsel-mode . 'dashboard-mode)
  :ensure t
  :bind
  (("C-x C-r" . 'counsel-recentf) 
   ("C-x d" . 'counsel-dired)))

(use-package avy 
  :ensure t 
)

(use-package rime
  :ensure t
  :custom
  (default-input-method "rime")
  :config
  (setq rime-user-data-dir "~/.config/fcitx/rime")

  (setq rime-posframe-properties
        (list :background-color "#333333"
              :foreground-color "#dcdccc"
              :font "Sarasa Mono SC-16"
              :internal-border-width 10))
  (setq default-input-method "rime"
        rime-show-candidate 'posframe))


(provide 'init-basic)
