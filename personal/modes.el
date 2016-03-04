;;; Modes --- Some Modes for Hierophantos' Emacs
;;; Commentary:


;; *****************************************************************************
;;; Code:



;; *****************************************************************************
;; JS2 Modes


(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

(setq js2-highlight-level 3)

(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))
;; -----------------------------------------------------------------------------




;; ********************************************************************
;; jsx mode mods
;; ********************************************************************

;; TODO: http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(flycheck-define-checker jsxhint-checker
  "A JSX syntax and style checker based on JSXHint."

  :command ("jsxhint" source)
  :error-patterns
  ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
  :modes (web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (equal web-mode-content-type "jsx")
              ;; enable flycheck
              (flycheck-select-checker 'jsxhint-checker)
              (flycheck-mode))))


;; (require 'jsx-mode)
;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))

;; (require 'flycheck)
;; (flycheck-define-checker jsxhint-checker
;;   "A JSX syntax and style checker based on JSXHint."

;;   :command ("jsxhint" source)
;;   :error-patterns
;;   ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
;;   :modes (jsx-mode))

;; (add-hook 'jsx-mode-hook
;;           (lambda ()
;;             (flycheck-select-checker 'jsxhint-checker)
;;             (flycheck-mode)
;;             (auto-complete-mode 1)
;;             (tern-mode t)
;;             (electric-pair-mode t)
;;             (rainbow-delimiters-mode t)))
            

(setq jsx-indent-level 2)



;; end jsx mode
;; -----------------------------------------------------------------------------



;; https://truongtx.me/2013/01/06/config-yasnippet-and-autocomplete-on-emacs/
;; ;;; yasnippet
;; ;;; should be loaded before auto complete so that they can work together
;; (require 'yasnippet)
;; (yas-global-mode 1)


;; ;;; auto complete mode
;; ;;; should be loaded after yasnippet so that they can work together
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)
;; ;;; set the trigger key so that it can work together with yasnippet on tab key,
;; ;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;; ;;; activate, otherwise, auto-complete will
;; (ac-set-trigger-key "TAB")
;; (ac-set-trigger-key "<tab>")







;; Set up Javascript Dev
;; https://truongtx.me/2014/02/23/set-up-javascript-development-environment-in-emacs/
;; Setup JSX Mode
;; https://truongtx.me/2014/03/10/emacs-setup-jsx-mode-and-jsx-syntax-checking/
;; Javascript Completion and Refactoring set-up
;; https://truongtx.me/2014/04/20/emacs-javascript-completion-and-refactoring/









(provide 'modes)
;;; modes.el ends here
