;;; hierophantos-org.el --- Summary

;;; Commentary:


;;; Code:

;; MobileOrg Directories:
(setq org-directory "~/org")
(setq org-mobile-files '("~/org"))
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

;; use org-mobile-push to push docs to Mobile
;; and org-mobile-pull to pull them
;;; --------------------------------------------------------

(setq org-agenda-custom-commands
      '(("w" todo "TODO")
        ("h" agenda "" ((org-agenda-show-all-dates nil)))
        ("W" agenda "" ((org-agenda-ndays 21)
                        (org-agenda-show-all-dates nil)))
        ("A" agenda ""
         ((org-agenda-ndays 1)
          (org-agenda-overriding-header "Today")))))


(provide 'hierophantos-org)
;;; hierophantos-org.el ends here
