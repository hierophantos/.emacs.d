;;; hierophantos-mu --- Summary
;;;  Config for mu mail client

;;; Commentary:


;;; Code:
;; reference: https://www.emacswiki.org/emacs/mu4e


;; from here: https://gist.github.com/areina/3879626
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(require 'mu4e)

;; default
(setq mu4e-maildir (expand-file-name "~/Maildir"))

(setq mu4e-drafts-folder "/[Gmail].Drafts")
(setq mu4e-sent-folder   "/[Gmail].Sent Mail")
(setq mu4e-trash-folder  "/[Gmail].Trash")

;; don't save message to Sent Messages, GMail/IMAP will take care of this
(setq mu4e-sent-messages-behavior 'delete)

;; setup some handy shortcuts
(setq mu4e-maildir-shortcuts
      '(("/INBOX"             . ?i)
        ("/[Gmail].Sent Mail" . ?s)
        ("/[Gmail].Trash"     . ?t)))

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap -q")
(setq mu4e-attachment-dir  "~/downloads")

(setq
 mu4e-get-mail-command "offlineimap -q"   ;; or fetchmail, or ...
 mu4e-update-interval (* 5 60))              ;; update every x seconds

;; something about ourselves
;; I don't use a signature...
(setq
 user-mail-address "zee.larson@gmail.com"
 user-full-name  "Zachary Larson"
 message-signature
  (concat
    "Zachary Larson\n"
    "928.380.8156\n"
    ))


;;; formal/informal signatures
;; (defun my-mu4e-choose-signature ()
;;   "Insert one of a number of sigs"
;;   (interactive)
;;   (let ((message-signature
;;          (mu4e-read-option "Signature:"
;;                            '(("formal" .
;;                               (concat
;;                                "Joe Bloggs\n"
;;                                "Department, Company Name, Country\n"
;;                                "W: http://www.example.com\n"))
;;                              ("informal" .
;;                               "Joe\n")))))
;;     (message-insert-signature)))

;; (add-hook 'mu4e-compose-mode-hook
;;           (lambda () (local-set-key (kbd "C-c C-w") #'my-mu4e-choose-signature)))




;; sending mail -- replace USERNAME with your gmail username
;; also, make sure the gnutls command line utils are installed
;; package 'gnutls-bin' in Debian/Ubuntu, 'gnutls' in Archlinux.

(require 'smtpmail)

(setq message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      smtpmail-starttls-credentials
      '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials
      (expand-file-name "~/.authinfo.gpg")
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-debug-info t)


;; enable inline images
(setq mu4e-view-show-images t)
;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))


;; spell check
(add-hook 'mu4e-compose-mode-hook
          (defun my-do-compose-stuff ()
            "My settings for message composition."
            (set-fill-column 72)
            (flyspell-mode)))

(setq mu4e-html2text-command
      "textutil -stdin -format html -convert txt -stdout")

;; change lumosity for dark themes
(setq shr-color-visible-luminance-min 80)

(add-hook 'mu4e-view-mode-hook
          (lambda ()
            (visual-line-mode t)))


;; Actions
;; activate using aV
(add-to-list 'mu4e-view-actions
             '("ViewInBrowser" . mu4e-action-view-in-browser) t)


;; gpg
(add-hook 'mu4e-compose-mode-hook 'epa-mail-mode)
(add-hook 'mu4e-view-mode-hook 'epa-mail-mode)


(provide 'hierophantos-mu)
;;; hierophantos-mu ends here
