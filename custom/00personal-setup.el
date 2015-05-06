;; Miscellaneous preference variables
(setq
 calendar-latitude 40.71
 calendar-longitude -74.00
 calendar-location-name "Manhattan, NY"
 column-number-mode t
 completion-ignore-case t
 confirm-kill-emacs 'y-or-n-p
 default-fill-column 79
 default-input-method "latin-1-postfix"
 default-tab-width 4
 display-time-24hr-format t
 display-time-day-and-date t
 font-lock-maximum-decoration t
 frame-title-format '("%f")
 grep-command "grep -inr "
 hourglass-delay 2
 inhibit-default-init t
 inhibit-startup-echo-area-message user-login-name
 inhibit-startup-message t
 kill-whole-line t
 magic-mode-alist '()
 message-signature-separator "^-- *$"
 mouse-wheel-progressive-speed nil
 mouse-yank-at-point t
 read-file-name-completion-ignore-case t
 require-final-newline t
 ring-bell-function (lambda () nil)
 save-abbrevs nil
 scroll-conservatively 20
 sentence-end "[.?!][]\"')}]*\\($\\|[ \t]\\)[ \t\n]*"
 sentence-end-double-space nil
 speedbar-show-unknown-files t
 speedbar-use-images nil
 use-dialog-box nil
 woman-use-own-frame nil
 magit-last-seen-setup-instructions "1.4.0"
 uniquify-buffer-name-style 'forward)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
 '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

;; Minor mode and buffer-local variable setup for all buffers corresponding to
;; actual files (i.e. not "*Buffer List*" et al.)
(add-hook 'find-file-hooks
          (lambda ()
            (show-paren-mode t)
            (setq indent-tabs-mode nil
                  indicate-empty-lines t
                  show-trailing-whitespace t
                  truncate-lines t)))

;;http://www.how-i-work.com/workbenches/30-working-with-os-x-and-emacs
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; Set the starting position and width and height of Emacs Window
(add-to-list 'default-frame-alist '(left . 0))
(add-to-list 'default-frame-alist '(top . 0))
(add-to-list 'default-frame-alist '(height . 45))
(add-to-list 'default-frame-alist '(width . 175))

;; To get rid of Weird color escape sequences in Emacs.
;; Instruct Emacs to use emacs term-info not system term info
;; http://stackoverflow.com/questions/8918910/weird-character-zsh-in-emacs-terminal
(setq system-uses-terminfo nil)

;; Prefer utf-8 encoding
(prefer-coding-system 'utf-8)

;; Use windmove bindings
;; Navigate between windows using Alt-1, Alt-2, Shift-left, shift-up, shift-right
(windmove-default-keybindings)

(set-frame-font "-apple-Fira_Mono-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1")

;; Display continuous lines
(setq-default truncate-lines nil)
;; Do not use tabs for indentation
(setq-default indent-tabs-mode nil)
(menu-bar-mode -1)
(enable-theme 'solarized-dark)

;; trucate even even when screen is split into multiple windows
(setq-default truncate-partial-width-windows nil)

;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

(set-cursor-color "red")

(setq default-frame-alist
      '((cursor-color . "red")))

;; Highlight incremental search
(setq search-highlight t)
(transient-mark-mode t)

(global-visual-line-mode 1)

(display-time)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;(scroll-bar-mode nil)

;; Enable copy and pasting from clipboard
(setq x-select-enable-clipboard t)

;; Disable backups
(setq backup-inhibited t)
;;disable auto save
(setq auto-save-default nil)

;;some custom functions, stolen for internet
(defun geosoft-forward-word ()
   ;; Move one word forward. Leave the pointer at start of word
   ;; instead of emacs default end of word. Treat _ as part of word
   (interactive)
   (forward-char 1)
   (backward-word 1)
   (forward-word 2)
   (backward-word 1)
   (backward-char 1)
   (cond ((looking-at "_") (forward-char 1) (geosoft-forward-word))
         (t (forward-char 1))))
(defun geosoft-backward-word ()
 ;; Move one word backward. Leave the pointer at start of word
 ;; Treat _ as part of word
  (interactive)
  (backward-word 1)
  (backward-char 1)
  (cond ((looking-at "_") (geosoft-backward-word))
        (t (forward-char 1))))

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;(require 'feature-mode)
;(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq path-to-ctags "/usr/local/bin/ctags") ;; <- you're ctags path here

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -e -R %s" path-to-ctags dir-name dir-name))
  )

(defun recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  ;; TODO: remove elpa-to-submit once everything's submitted.
  (byte-recompile-directory dotfiles-dir 0))


(define-key isearch-mode-map (kbd "C-o") ; occur easily inside isearch
  (lambda ()
    (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(defun colorize-compilation-buffer ()
  (interactive)
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

 (require 'auto-complete-config)
 (add-to-list 'ac-dictionary-directories
     "~/.emacs.d/.cask/24.5.1/elpa/auto-complete-20150408.1132/dict")
 (ac-config-default)
 (setq ac-ignore-case nil)
 (add-to-list 'ac-modes 'enh-ruby-mode)
 (add-to-list 'ac-modes 'web-mode)

 (require 'smartparens-config)
 (require 'smartparens-ruby)
 (smartparens-global-mode)
 (show-smartparens-global-mode t)
 (sp-with-modes '(rhtml-mode)
   (sp-local-pair "<" ">")
   (sp-local-pair "<%" "%>"))

(require 'grizzl)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'grizzl)

(require 'highlight-indentation)
 (add-hook 'enh-ruby-mode-hook
           (lambda () (highlight-indentation-mode)))

 (add-hook 'coffee-mode-hook
           (lambda () (highlight-indentation-mode)))

(autoload 'ibuffer "ibuffer" "List buffers." t)

(require 'flyspell)
(setq flyspell-issue-message-flg nil)
(add-hook 'enh-ruby-mode-hook
          (lambda () (flyspell-prog-mode)))

(add-hook 'web-mode-hook
          (lambda () (flyspell-prog-mode)))
;; flyspell mode breaks auto-complete mode without this.
(ac-flyspell-workaround)

(setq ispell-program-name "/usr/local/bin/ispell")

(global-undo-tree-mode)

(delete-selection-mode t)

(transient-mark-mode t)
