;;; thoughtstream.el --- Emacs Package to interact with thoughtstream.io
;;; Commentary:

;;; Code:

(require 'request)

(defun thoughtstream-prompt ()
  (interactive)
  (let ((msg (read-from-minibuffer "Enter Thought: ")))
    (save-excursion
      (goto-char (region-beginning)))
    (save-excursion
      (goto-char (region-end)))
    (thoughtstream-post msg)))  ;; this won't do the thing

(defun thoughtstream-post ()
  (interactive)
  (request
   "https://ilcczukwub.localtunnel.me/signup"
   :type "POST"
   :params '(("email" . "zee.larson@gmail.com") ("password" . "password") ("displayName" . "Zachary"))
   ;;:data "gestalt=msg"
   :success (function*
             (lambda (&key data &allow-other-keys)
               (message "I sent: %s" (assoc-default 'args data))))))




;; quasi quotting, allowing `(("addresss" . ,address))


;; (thoughtstream-prompt)
;; (thoughtstream-post)                    

;;;; Cool Stuff re: Elisp HTTP requests
;; *** Rest Client - explore and test HTTP REST webservices in plain text qurey sheets, ***
;; display results as pretty-printed XML, JSON and images
;; https://github.com/pashky/restclient.el
;; http://jakemccrary.com/blog/2014/07/04/using-emacs-to-explore-an-http-api/

;; *** Emacs Web - Use callbacks to collect responses
;; https://github.com/nicferrier/emacs-web
;;
;; *** url.el - 
;; 
;; http://www.gnu.org/software/emacs/manual/html_mono/url.html
;; 

(provide 'thoughtstream)
;;; thoughtstream.el ends here
