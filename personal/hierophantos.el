;;; package --- Summary
;;; Commentary:

;;; My Personal Emacs Customizations

;;; Code:
;;; -----------------------------------------------------------------
;;;      My Key Bindings
;;; -----------------------------------------------------------------
(global-set-key (kbd "C-h") 'delete-backward-char)

;; Command->meta, alt->super, fn->hyper
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
(setq ns-function-modifier 'hyper)

;; Switching Buffers
(global-set-key [C-tab] 'switch-to-next-buffer)
(global-set-key [C-M-tab] 'switch-to-prev-buffer)
(global-set-key [M-right] 'switch-to-next-buffer)
(global-set-key [M-left] 'switch-to-prev-buffer)

(global-set-key [C-s-right] 'shrink-window-horizontally)
(global-set-key [C-s-left] 'enlarge-window-horizontally)
(global-set-key [C-s-up] 'shrink-window)
(global-set-key [C-s-down] 'enlarge-window)

;; Splitting and manipulating windows
(global-set-key (kbd "s-2") 'split-window-below)
(global-set-key (kbd "s-3") 'split-window-right)
(global-set-key (kbd "s-1") 'delete-other-windows)
;; Move Window with Mouse
(global-set-key [s-wheel-down] 'shrink-window)
(global-set-key [s-wheel-up] 'enlarge-window)
(global-set-key [s-wheel-left] 'shrink-window-horizontally)
(global-set-key [s-wheel-right] 'enlarge-window-horizontally)

;; cycle to next frame (detached "window")
(global-set-key [s-tab] 'ns-next-frame)

;; (global-set-key [wheel-right] 'scroll-left)
;; (global-set-key [wheel-left] 'scroll-right)

(global-set-key [C-return] 'helm-M-x)
(global-set-key [M-return] 'other-window)
(global-set-key [M-return] 'neotree-toggle)
;; (global-set-key [s-return] 'speedbar)
(global-set-key (kbd "C-;") 'mc/mark-all-like-this-dwim)

(global-unset-key [M-h])
(global-set-key [M-h] 'backward-kill-word)
(global-unset-key [M-d])
(global-set-key [M-d] 'kill-word)

(global-set-key [S s])

;; (global-unset-key [C-w])           
;; (global-set-key [C-w] 'delete-window)

(global-set-key (kbd "s-`") 'scroll-restore-mode)
(global-set-key (kbd "C-c T") 'get-term) ;; create new term

(global-set-key (kbd "M-`") 'other-window)

(global-set-key (kbd "C-c g") 'helm-google)

;;; ---------- End My Keybindings ------------------------------------

;; (setq-default truncate-lines 1)

;; (global-set-key (kbd "wheel-right") '(lambda ()
;;                                      (interactive)
;;                                      (scroll-left 1)))
;; (global-set-key (kbd "wheel-left") '(lambda ()
;;                                      (interactive)
;;                                      (scroll-right 1)))

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
                                        ;(setq mouse-sel-mode t)
  )


;;; ------------------------------------------------------------------
;;; My Modes:
;;; ------------------------------------------------------------------
;; (add-to-list 'load-path "/Users/Sophia/.emacs.d/elpa/newlisp-mode")
;; (require 'newlisp-mode)

;; (require 'golden-ratio)
;; (golden-ratio-mode nil)

;; popwin allows temp buffers to go away with a C-g
;; (require 'popwin)
;; (popwin-mode 1)

;; Dvorak nicety, regardless of loading settings
(define-key key-translation-map "\C-t" "\C-x")
;; Load use-package, used for loading packages
(require 'use-package)

(require 'helm-fuzzy-find)


;;; Sublime Like mode for smooth scrolling
(sublimity-mode 1)
;; (setq sublimity-scroll-drift-length 1)
;; (setq sublimity-scroll-weight 4)


(tramp-set-completion-function "ssh"
                               '((tramp-parse-sconfig "~/.ssh/config")))

;; (tramp-parse-sconfig "/etc/ssh_config")


(defun last-term-buffer (l)
  "Return most recently used term buffer."
  (when l
    (if (eq 'term-mode (with-current-buffer (car l) major-mode))
        (car l) (last-term-buffer (cdr l)))))

(defun get-term ()
  "Switch to the term buffer last used, or create a new one if
    none exists, or if the current buffer is already a term."
  (interactive)
  (let ((b (last-term-buffer (buffer-list))))
    (if (or (not b) (eq 'term-mode major-mode))
        (multi-term)
      (switch-to-buffer b))))


;; gives colors to unique vars passed into fns; useful for misspelled variables
;; (use-package 'color-identifiers)

;; (require 'which-key)
;; (which-key-mode t)
;; (which-function-mode t)

(require 'scroll-restore)
(scroll-restore-mode t)

;; Elixir
(add-hook 'elixir-mode-hook 'alchemist-mode)
(add-hook 'alchemist-iex-mode-hook
          '(lambda()
             (local-set-key (kbd "<tab>") 'company-complete))
          (local-unset-key [M-h])
          (local-set-key [M-h] 'alchemist-help-at-point))


;; prog-mode hooks
(add-hook 'prelude-prog-mode-hook 'disable-guru-mode t)
(add-hook 'prelude-prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prelude-prog-mode-hook 'linum-mode)
;(add-hook 'prelude-prog-mode-hook 'aggressive-indent-mode)

;; (add-hook 'prelude-prog-mode-hook 'indent-guide-mode)


(add-hook 'prelude-prog-mode-hook 'hs-minor-mode)
(global-set-key (kbd "<f2>") 'hs-toggle-hiding)

;; (add-hook 'prelude-prog-mode-hook 'iedit-mode)

(add-hook 'org-mode 'org-bullets-mode)


;; initial window
(setq initial-frame-alist
      '((width . 200) (height . 65) (left . 50) (top . 50)))

;; default/sebsequent window
(setq default-frame-alist
      '((width . 170) (height . 50) (left . 300) (top . 100)))






;;;============================================================================
;;     CLOJURE MODS
;;;============================================================================
;; syntax highlighting for function (not recommended)7a
(eval-after-load 'clojure-mode '(require 'clojure-mode-extra-font-locking))

;; (add-hook 'cider-mode-hook 'ac-nrepl-setup)
;; (add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
;; (add-to-list 'ac-modes 'cider-mode)
;; (add-to-list 'ac-modes 'cider-repl-mode)

(require 'ac-cider)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-mode))

;;; Clojurerscript REPL

(defun cljs-node-repl ()
  (interactive)
  (run-clojure "java -cp cljs.jar clojure.main repl.clj"))

;; (defun cljs-node-repl ()
;;   (interactive)
;;   (run-clojure "lein trampoline run -m clojure.main repl.clj"))

(defun figwheel-repl ()
  (interactive)
  (run-clojure "lein figwheel"))

;; (add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)

;;;============================================================================



;; show system name and current buffer's full file path in window
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(defun show-file-name ()
  "Show the full path file name in the minibuffer"
  (interactive)
  (message (buffer-file-name)))

(global-set-key [C-f1] 'show-file-name)


(require 'doc-view-fit-page)
(add-hook 'doc-view-mode-hook
          '(lambda ()
             (local-set-key "f" 'doc-view-fit-page)
             (local-set-key "w" 'doc-view-fit-width)
             (local-set-key "h" 'doc-view-fit-height)))


(defun disable-guru-mode ()
  (guru-mode -1))

(scroll-bar-mode -1)

;; turn off whitespace mode
;; (add-hook 'prog-mode-hook 'prelude-turn-off-whitespace t)
(setq prelude-whitespace nil)


(require 'neotree)


;;; tramp customization
;; (add-to-list 'tramp-default-proxies-alist
;;              '("52\\.32\\.70\\.249" "\\`root\\'" "/ssh:ubuntu@%h:"))


;; (require 'sr-speedbar)
;; (setq sr-speedbar-right-side nil)
;; (setq sr-speedbar-max-width 20)
;; (global-set-key [C-return] 'sr-speedbar-toggle)

;; Suppress bell sound
(setq ring-bell-function 'ignore)

;; thesaurus api key
(setq thesaurus-bhl-api-key "93daf90302a27348144b0c6a945eea62")


;; emacs torrent thing; haven't looked into it yet
;; (require 'mentor)
;; (setq mentor-rtorrent-url "scgi://localhost:5000")

;; mail client
(setq mail-user-agent 'mu4e-user-agent)


;; wee-chat using matrix.org (webrtc signalling)
;;(require 'weechat)  ;; mraaauuuhh! not working! >:-[

(global-pabbrev-mode)


;;; Macro Macro from Bryan Maass
;; C-( C-) F4
(defun save-macro (name)
  ;; Save a Take.
  ;; macro3 a name as argument
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


;;;=======================================================
;;            Transparency
;;;=======================================================

(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))

(eval-when-compile (require 'cl))
(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha))
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(90 70))))

(global-set-key (kbd "C-c h") 'toggle-transparency)

;; Set transparency of emacs
(defun transparency (value)
  "Sets the transparency of the frame window. 0 = transparent, 100 = opaque"
  (interactive "nTransparency Value 0 - 100 opaque: ")
  (set-frame-parameter (selected-frame) 'alpha value))

;;;=======================================================



;;=======================================================
;; start the emacsserver that listens to emacsclient
(server-start)
;; from
;; http://stackoverflow.com/questions/10171280/how-to-launch-gui-emacs-from-command-line-in-osx
;;=======================================================




(defun insert-color-hex ()
  "Select a color and insert its hexadecimal format."
  (interactive "*")
  (let ((buf (current-buffer)))
    (list-colors-display
     nil nil `(lambda (name)
                (interactive)
                (quit-window)
                (with-current-buffer ,buf
                  (insert (apply 'color-rgb-to-hex
                                 (color-name-to-rgb name))))))))


(defun open-atom ()
  (interactive)
  (call-process
   "atom" nil t nil buffer-file-name))

(defun open-in-browser ()
  (interactive)
  (let ((filename (buffer-file-name)))
    (browse-url (concat "file://" filename))))


;; (defun ecb-activated-in-selected-frame ()
;;   "A hack to use ECB in multiple frames. It first deactivates ECB, then
;;     activate it in current frame."
;;   (interactive)
;;   (let ((current-frame (selected-frame)))
;;                                         ; The frame foucs change when activating or deactivating ECB is weird, so
;;                                         ; activate current selected frame explicitly.
;;     (if (and (boundp 'ecb-minor-mode) (ecb-minor-mode))
;;         (ecb-deactivate)
;;       )
;;     (select-frame current-frame)
;;     (ecb-activate)))



;;


(setq-default indent-tabs-mode nil)


(provide 'hierophantos)
;;; hierophantos.el ends here
