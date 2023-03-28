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

(aa/require-local-packages-in "~/.emacs.d/local-packages/")

;;
;; end of file
;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(fontawesome projectile doom-themes git-gutter-fringe git-gutter savehist ligature blackout zenburn-theme vertico use-package orderless color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized))
 '(warning-suppress-types '((use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
