;;; package -- Summary:
;;; Commentary:
;;; Code:

;;; Color Themes


;;  Picks a random theme from loadpath:
(defun load-random-theme ()
  "Load any random theme from the available ones."
  (interactive)

  ;; disable any previously set theme
  (if (boundp 'theme-of-the-day)
      (progn
        (disable-theme theme-of-the-day)
        (makunbound 'theme-of-the-day)))

  (defvar themes-list (custom-available-themes))
  (defvar theme-of-the-day (nth (random (length themes-list))
				themes-list))
  (load-theme (princ theme-of-the-day) t))



;; (setq prelude-theme 'tangotango)
;;(setq prelude-theme 'spacegray)
;; (setq prelude-theme 'deeper-blue)    ;; saw on bruce haumann's demo
(setq prelude-theme 'base16-yesterdaybright-dark)
;; (setq prelude-theme 'sanityinc-tomorrow-eighties) ;; Tomorrow Never Comes
;; (setq prelude-theme 'monokai)    ;; sublime default colors
;; (setq prelude-theme 'heroku)     ;; nice grey
;; (setq prelude-theme 'aurora)     ;; looking at the northern lights
;; (setq prelude-theme 'deep-blue)  ;; wow
;; (setq prelude-theme 'dakrone)


(custom-set-variables
 '(term-default-fg-color (face-foreground 'default))
 '(term-default-bg-color (face-background 'default)))


;;----------------------
;; some cool themes:
;; **Light Themes:
;;  *Gandalf
;;  *Occidental
;;  *heroku
;;  *plan9
;;  *xp
;;  *tango
;;  *dichromacy
;;  
;; **Dark Themes:
;;  tango-dark
;;  *heroku
;;  *ampleflat
;;  *zenbun
;;  *cyberpunk
;;  *monokai
;;  *gnome2
;;  *desert
;;  *julie, a bit brown
;;  *grey30
;;  *railscast
;;  darkburn
;;  *deeperblue
;;  charcoal-black
;;
;;----------------------


;(global-set-key (kbd "C-h") 'delete-backward-char)
;(global-set-key [(hyper h)] 'help-command)

(provide 'preload-hierophantos)

;;; preload-hierophantos.el ends here

