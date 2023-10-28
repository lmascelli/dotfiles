;; This script should setup the development environment for Visual Studio
;; in a running emacs session

(defun lm/vsenv ()
  (interactive)
  (unless (executable-find "vswhere.exe") ;; check if vswhere is installed
    (if (executable-find "scoop") ;; check if scoop is installed
      (shell-command "scoop install vswhere")
      (error "vswhere not installed and scoop neither")))
  (let ((shell-output (get-buffer-create "*vsenv-output*")))
    (shell-command "vswhere -prerelease -latest -property installationPath"
		   shell-output)
    (let ((installation-path (with-current-buffer shell-output (buffer-string))))
      (let ((batch-path
	     (replace-regexp-in-string "/" "\\\\" (concat
						   (string-trim installation-path)
						   "/Common7/Tools/vsdevcmd.bat"))))
	  (if (file-exists-p batch-path) (message (format "\"%s\"" batch-path)))))))
