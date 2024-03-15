;; FROM

;; :command `("/usr/bin/env" "sh" "-c"
;;                           ,(format "stty -nl echo rows %d columns \
;; %d sane 2>%s ; if [ $1 = .. ]; then shift; fi; exec \"$@\""
;;                                    (cdr size) (car size)
;;                                    null-device)
;;                           ".."
;;                           ,command ,@switches)

;; TO

;;                :command `("conhost.exe" "--headless" "--height" ,(number-to-string (cdr size)) "--width" ,(number-to-string (car size)) "--feature" "pty" ,command ,@switches)

;; FROM

;;  (eat-exec buffer (buffer-name) "/usr/bin/env" nil
;;                  (list "sh" "-c" program)))

;; TO

;; (eat-exec buffer (buffer-name) "powershell.exe" nil nil))
(use-package eat)
