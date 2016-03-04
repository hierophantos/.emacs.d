;;; http://blog.josephwilk.net/


(require 'zone)
(require 'zone-matrix)
(require 'zone-matrix-settings)
(require 'zone-settings)

(setq zone-programs [zone-matrix])


(zone-when-idle (* 60 10))



(defun zone-choose (pgm)
  "Choose a PGM to run for `zone'."
  (interactive
   (list
    (completing-read
     "Program: "
     (mapcar 'symbol-name zone-programs))))
  (let ((zone-programs (list (intern pgm))))
    (zone)))



;; (defun zone-pgm-md5 ()
;;   "MD5 the buffer, then recursively checksum each hash."
;;   (let ((prev-md5 (buffer-substring-no-properties ;; Initialize.
;;                    (point-min) (point-max))))
;;     ;; Whitespace-fill the window.
;;     (zone-fill-out-screen (window-width) (window-height))
;;     (random t)
;;     (goto-char (point-min))
;;     (while (not (input-pending-p))
;;       (when (eobp)
;;         (goto-char (point-min)))
;;       (while (not (eobp))
;;         (delete-region (point) (line-end-position))
;;         (let ((next-md5 (md5 prev-md5)))
;;           (insert next-md5)
;;           (setq prev-md5 next-md5))
;;         (forward-line 1)
;;         (zone-park/sit-for (point-min) 0.1)))))


;; (eval-after-load "zone"
;;   '(unless (memq 'zone-pgm-md5 (append zone-programs nil))
;;      (setq zone-programs
;;            (vconcat zone-programs [zone-pgm-md5]))))



;;; set up an OSC server and define two call backs which change the color of the window
;;; face number:
;;; -----------------------------------------------------------------------------
;; (require 'osc)
;; (require 'cl)

;; (defvar osc-server nil "Connection to receive msgs")
;; (defvar flip-state t)

;; (defun osc-connect ()
;;   "Create an OSC server and bind our fallback functions"
;;   (when (not osc-server)
;;     (setq osc-server
;;           (osc-make-server
;;            "localhost" 4558
;;            (lambda (path &rest args)
;;              (cond
;;               ((string-match "/beat" path)
;;                (progn (if flip-state (on-beat) (off-beat))
;;                       (setq flip-state (not flip-state))))))))))

;; (defun osc-make-server (host port default-handler)
;;   "Settings for OSC server"
;;   (make-network-process
;;    :name "emacs OSC server"
;;    :host host
;;    :server t
;;    :service port
;;    :filter #'osc-filter
;;    :type 'datagram
;;    :family 'ipv4
;;    :plist (list :generic default-handler)))

;; (defun on-beat ()
;;   (custom-set-faces
;;    '(window-number-face ((t (:foreground "deeppink"))))))

;; (defun off-beat ()
;;   (custom-set-faces
;;    '(window-number-face ((t (:foreground "#FDDD0C"))))))

;; (osc-connect)
;; (provide 'osc-server)
;;; -----------------------------------------------------------------------------

;; In Overtone/Clojure
;; (defonce emacs-client (osc-client "localhost" 4558))
;; (def emacs-trigger    (on-beat-trigger 8 #(do (osc-send emacs-client "/beat"))))

(provide 'zone-out)
;;; zone-out.el ends here
