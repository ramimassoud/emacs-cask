;;; init.el --- Initial config hook
;;; Commentary:

;;; Code:
(add-to-list 'load-path "~/.cask/")
(require 'cask)
(cask-initialize)
(require 'pallet)
(pallet-mode t)
(add-to-list 'load-path "~/.emacs.d/custom/")

(require 'package)
(add-to-list 'package-archives
             '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(defmacro after (mode &rest body)
  "`eval-after-load' MODE evaluate BODY.
This allows us to define configuration for features that aren't
always installed and only eval that configuration after the feature is loaded.
ELPA packages usually provide an -autoloads feature which we can
use to determine if the package is installed/loaded."
  (declare (indent defun))
  `(eval-after-load (symbol-name ,mode)
     '(progn ,@body)))

(setq rbenv-installation-directory "~/.rbenv/bin/rbenv")
(after 'rbenv-autoloads
 (require 'rbenv)
 (global-rbenv-mode))

(load "00personal-setup.el")
(load "01ruby.el")
(load "02keybindings.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
 '(backup-directory-alist '((".*" . "~/.emacs.d/backups/")))
 '(package-selected-packages
   '(gnu-elpa-keyring-update php-mode minitest nginx-mode flycheck terraform-mode go-mode docker-compose-mode dockerfile-mode dotenv-mode protobuf-mode yasnippet yaml-mode web-mode undo-tree textmate solarized-theme smartparens rubocop rspec-mode robe rinari rbenv rainbow-delimiters projectile-rails pallet multiple-cursors markdown-mode magit-gh-pulls magit-filenotify highlight-indentation grizzl exec-path-from-shell enh-ruby-mode date-at-point auto-complete ag)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
