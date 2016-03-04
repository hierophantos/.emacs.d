;; example from <http://delysid.org/emacs/osc.html>



;; (setq my-client (osc-make-client "localhost" 7770))
;; (osc-send-message my-client "/osc/path" 1.5 1.0 5 "done")
;; (delete-process my-client)

;; (setq my-server
;;       (osc-make-server
;;        "localhost" 7770
;;        (lambda (path &rest args)
;;          (message "Unhandled: %s %S" path args))))
;; (osc-server-set-handler my-server "/a/b/c/d" (lambda (path &rest args) ...))
