;;; hierophantos-js --- Summary

;;; Commentary:


;;; Code:

(autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)


;; moz keybindings:
;; • C-c C-s: open a MozRepl interaction buffer and switch to it
;; • C-c C-l: save the current buffer and load it in MozRepl
;; • C-M-x: send the current function (as recognized by c-mark-function) to MozRepl
;; • C-c C-c: send the current function to MozRepl and switch to the interaction buffer
;; • C-c C-r: send the current region to MozRepl
;; In the interaction buffer:

;; • C-c c: insert the current name of the REPL plus the dot operator (usually repl.)





(add-hook 'javascript-mode-hook 'javascript-custom-setup)
(defun javascript-custom-setup ()
  (moz-minor-mode 1))

(add-hook 'js2-mode-hook
          (lambda ()
            (tern-mode t)
            'moz-minor-mode) 1)

(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))


;; Interactive HTML Development in Emacs
(require 'moz)
(require 'json)

(defun moz-update (&rest ignored)
  "Update the remote mozrepl instance"
  (interactive)
  (comint-send-string (inferior-moz-process)
                      (concat "content.document.body.innerHTML="
                              (json-encode (buffer-string)) ";")))

(defun moz-enable-auto-update ()
  "Automatically the remote mozrepl when this buffer changes"
  (interactive)
  (add-hook 'after-change-functions 'moz-update t t))

(defun moz-disable-auto-update ()
  "Disable automatic mozrepl updates"
  (interactive)
  (remove-hook 'after-change-functions 'moz-update t))



;; Context Coloring
;; JavaScript:
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; (add-hook 'js2-mode-hook #'context-coloring-mode)

;; Emacs Lisp:
;; (add-hook 'emacs-lisp-mode-hook #'context-coloring-mode)

;; eval-expression:
;; (add-hook 'eval-expression-minibuffer-setup-hook #'context-coloring-mode)


(provide 'hierophantos-js)
;;; hierophantos-js ends here
