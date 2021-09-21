;;; org-roam-conf --- Org Roam Configurations

;;; Commentary:
;; All the setup for using Org Roam

;;; Code:

(setq org-roam-v2-ack t)

(require 'org-roam)

(add-hook 'after-init-hook #'org-roam-mode)

(setq org-roam-directory "~/roam_notes")
(setq org-roam-db-location "~/roam_notes/org-roam.db")
(setq org-id-locations-file "~/roam_notes/.org-id-locations")
(setq org-roam-completion-everywhere t)

(setq org-roam-capture-templates
      '(
        ("d" "default" plain
         "%?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+created_at: %U\n")
         :unnarrowed t)
        ("w" "web snippet" plain (file "~/roam_notes/templates/web_snippet.org")
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+created_at: %U\n")
         :unnarrowed t)
        )
      )

(define-key global-map (kbd "C-c n l") 'org-roam-buffer-toggle)
(define-key global-map (kbd "C-c n f") 'org-roam-node-find)
(define-key global-map (kbd "C-c n i") 'org-roam-node-insert)

(org-roam-setup)

(provide '03org-roam-conf)
;;; 03org-roam-conf.el ends here
