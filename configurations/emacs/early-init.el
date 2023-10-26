;;; increase garbage collector when load
(setq gc-cons-threshold most-positive-fixnum gc-cons-percentage 0.6)
(setq read-process-output-max (* 10 1024 1024)) ;; 10 Mb
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq gc-cons-threshold (* 50 1000 1000) ;; 50 Mb
		  gc-cons-percentage 0.1 )))
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (message "Emacs loaded in %s with %d garbage collections."
		     (emacs-init-time) gcs-done)))

;;; def gui stuff
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(setq visible-bell t)
(unless (display-graphic-p)
  (setq ring-bell-function 'ignore))
