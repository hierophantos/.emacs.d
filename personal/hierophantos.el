;;; package --- Summary
;;; Commentary:

;;; My Personal Emacs Customizations

;;; Code:
;;; My Key Bindings
(global-set-key (kbd "C-h") 'delete-backward-char)

(global-set-key [C-tab] 'switch-to-next-buffer)
(global-set-key [C-M-tab] 'switch-to-prev-buffer)
(global-set-key [s-right] 'switch-to-next-buffer)
(global-set-key [s-left] 'switch-to-prev-buffer)

(global-set-key [s-right] 'switch-to-next-buffer)
(global-set-key [C-M-u] 'switch-to-prev-buffer)

(global-set-key [C-s-left] 'shrink-window-horizontally)
(global-set-key [C-s-right] 'enlarge-window-horizontally)
(global-set-key [C-s-down] 'shrink-window)
(global-set-key [C-s-up] 'enlarge-window)

;; (global-set-key [C-M-u] 'shrink-window-horizontally)
;; (global-set-key [M-right] 'shrink-window-horizontally)
;; (global-set-key [M-down] 'shrink-window)
;; (global-set-key [M-up] 'enlarge-window) 

;; (global-set-key (kbd "C-c C-u") 'cider-eval-print-last-sexp)
;; (global-set-key [C-c C-u] 'cider-eval-print-handler)

(global-set-key [C-s-o] 'project-explorer-mode)

;; Command->meta, alt->super
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Move Window with Mouse
(global-set-key [M-wheel-down] 'shrink-window)
(global-set-key [M-wheel-up] 'enlarge-window)
(global-set-key [M-wheel-left] 'shrink-window-horizontally)
(global-set-key [M-wheel-right] 'enlarge-window-horizontally)


;;; Mouse Input
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t))

;;; My Modes:
;; (add-to-list 'load-path "/Users/Sophia/.emacs.d/elpa/newlisp-mode")
;; (require 'newlisp-mode)

(require 'golden-ratio)
;; (golden-ratio-mode nil)

(add-hook 'prelude-prog-mode-hook 'indent-guide-mode)

(defun disable-guru-mode ()
  (guru-mode -1))

(add-hook 'prelude-prog-mode-hook 'disable-guru-mode t)

(scroll-bar-mode -1)

;; turn off whitespace mode
;; (add-hook 'prog-mode-hook 'prelude-turn-off-whitespace t)
(setq prelude-whitespace nil)

;; one day, young padawan... <this doesn't work>
;(add-hook 'prelude-prog-mode-hook 'enable-linum-mode t)


;; thesaurus api key
(setq thesaurus-bhl-api-key "93daf90302a27348144b0c6a945eea62")




;;; Macro Macro from Bryan Maass
;; C-( C-) F4
(defun save-macro (name)
  ;; Save a macro.
  ;; Take a name as argument
  ;; and save the last defined macro under
  ;; this name at the end of user.el
  (interactive "Name of the macro: ")
  (kmacro-name-last-macro name)
  (find-file "~/.emacs.d/personal/saved-macros.el") ;; user-init-file
  (goto-char (point-max))
  (newline)
  (insert-kbd-macro name)
  (newline)
  (switch-to-buffer nil))
