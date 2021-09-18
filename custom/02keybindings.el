;;; keybindings --- All custom keybindings

;;; Commentary:
;; Global bindings

;;; Code:
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; Press Command-p for fuzzy find in project
(global-set-key (kbd "s-p") 'projectile-find-file)
;; Press Command-b for fuzzy switch buffer
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)
(global-set-key "\C-ct" 'visit-tags-table)
(global-set-key "\C-cd" 'create-tags)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
(global-set-key [C-right] 'geosoft-forward-word)
(global-set-key [C-left] 'geosoft-backward-word)
(global-set-key [f2] 'comment-region)
(global-set-key [f3] 'uncomment-region)
(global-set-key [f5] 'indent-region)
(global-set-key "\C-w" 'kill-region)
(global-set-key "\C-l" 'end-of-line)

(global-set-key "\C-x\C-k" 'backward-kill-word)
(global-set-key "\C-xt" 'select-frame-by-name)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-xy" 'revert-buffer)

;; Ivy/Counsel keys
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x b") 'counsel-ibuffer)
(global-set-key (kbd "C-c a") 'counsel-ag)


;; The rest of these keybindings are either already free or attached by
;; default to functions I rarely or never use
(define-key global-map (kbd "M-g")         'goto-line)
(define-key global-map (kbd "C-c w")       'delete-trailing-whitespace)
(define-key global-map (kbd "C-c \\")      'toggle-truncate-lines)
(define-key global-map (kbd "C-c q")       'query-replace-string)
(define-key global-map (kbd "C-c M-q")     'query-replace-regexp)
(define-key global-map (kbd "C-c r")       'replace-string)
(define-key global-map (kbd "C-c M-r")     'replace-regexp)
(define-key global-map (kbd "C-c C-x C-f") 'find-file-at-point)
(define-key global-map (kbd "C-c l")       'linum-mode)
(define-key global-map (kbd "C-x g")       'uncomment-region)
(define-key global-map (kbd "C-c g")       'comment-region)

(provide '02keybindings)
;;; 02keybindings.el ends here
