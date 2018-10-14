(setq debug-on-error t)

;; navigation
(setq-default indent-tabs-mode nil)
(global-set-key (kbd "<home>") 'set-mark-command)
(global-set-key (kbd "C-c i") 'make-frame-command)
(global-set-key (kbd "C-c o") 'delete-frame)
(global-set-key (kbd "C-c p") 'org-insert-todo-heading)
(global-set-key "\C-x\C-l" 'buffer-menu)
(global-unset-key [(f10)])
(windmove-default-keybindings 'meta)

;; layout and winner mode C-c left/right
(split-window-vertically)
(other-window 1 1)
(split-window-vertically)
(delete-window)
(split-window-horizontally)
(winner-mode)

;; backups
(setq backup-dir "~/backup/emacs")
(setq 
 backup-by-copying t ; don't clobber symlinks
 backup-directory-alist `(("." . ,backup-dir))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t) ; use versioned backups
(setq auto-save-list-file-prefix backup-dir)

;; color
(menu-bar-mode -1)
(load-theme 'tango-dark t)
(global-hl-line-mode -1)
(setq column-number-mode t)

;; ;; functionality
;; (require 'crux)
;; (require 'smex)
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; (require 'undo-tree)
;; (global-undo-tree-mode)
;; (require 'uniquify)
;; (setq uniquify-buffer-name-style 'post-forward uniquify-separator ":")
;; (require 'company)
;; (global-company-mode)

