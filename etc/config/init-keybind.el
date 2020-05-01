(define-prefix-command 'leader-key) 
(which-key-add-key-based-replacements
  "M-SPC b" "音乐"
  "M-SPC o" "开启"
  "M-SPC t" "切换"
  "M-SPC w" "窗口"
  "M-SPC c" "代码")
(global-set-key (kbd "M-SPC") 'leader-key) 
(global-set-key (kbd "C-(") 'backward-sexp) 
(global-set-key (kbd "C-)") 'forward-sexp)

(bind-key "t T" #'+evan/toggle-transparency leader-key)

(provide 'init-keybind)
