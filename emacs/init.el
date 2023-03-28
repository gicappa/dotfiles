1;; _*_ lexical-binding: t _*_

;;;;;;;;;;;;;;;;;;;;;;
;; GK's Emacs Setup ;;
;;;;;;;;;;;;;;;;;;;;;;

;; a function to load local packages

(setq debug-on-error t)

(defun aa/register-conf-path (path)
  (add-to-list 'load-path path))

(defun aa/require-file-list (list) 
    (dolist(p package-file-list)
      (require (intern (file-name-sans-extension p)))))

(defun aa/require-local-packages-in(packages-dir)
  (let ((package-file-list (directory-files packages-dir nil "\.el$")))
    (aa/register-conf-path packages-dir)
    (aa/require-file-list package-file-list)))

(aa/require-local-packages-in (concat user-emacs-directory "local-packages/"))

;; By default, the customisation options are stored in the
;; .emacs configuration file.
;; These lines are moving the configuration automatically generated
;; by custom system in a separate file.
;; http://xahlee.info/emacs/emacs/emacs_custom_system.html
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

