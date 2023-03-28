;;
;; appearance.el
;;

;;
;; Adding MELPA as package repository fo Emacs
;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-install 'use-package)
(setq make-backup-files nil) ; stop creating ~ files

;;
;; Color Themes
;;
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic nil)
;;  (load-theme 'doom-flatwhite t)
;;  (load-theme 'doom-henna t)
;;  (load-theme 'doom-laserwave t)
;;  (load-theme 'doom-nord t)
;;  (load-theme 'doom-nord-aurora t)
;;  (load-theme 'doom-nord-light t)
;;  (load-theme 'doom-material-dark t)
  (load-theme 'doom-moonlight t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (setq doom-themes-treemacs-theme "doom-atom")
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

;;
;; Global Appearence / Behaviour
;;
(setq inhibit-startup-message t)      ;; startup message OFF
(menu-bar-mode 1)                     ;; menu bar ON
(tool-bar-mode -1)                    ;; tool bar OFF
(scroll-bar-mode -1)                  ;; scroll bar OFF
(blink-cursor-mode 0)                 ;; cursor blick OFF
(global-display-line-numbers-mode 1)  ;; line numbers
(global-hl-line-mode 1)               ;; highlight the cursor line
(set-frame-font "Fira Code-15" nil t) ;; set default font
(set-default-coding-systems 'utf-8)
;;(set-face-foreground 'line-number "#454545")

;; when selecting a set of characters and typing a new sting
;; the default emacs behavior is to write after the selected text
;; if delete-selection-mode is not set.
(delete-selection-mode +1)

(use-package fontawesome
  :ensure t)

;;
;; ligature font
;;
(use-package ligature
  :ensure t
  :config
  (ligature-set-ligatures 't '("www"))
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                       "\\\\" "://"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

;; we want dired not not make always a new buffer if visiting a directory
;; but using only one dired buffer for all directories.
(defadvice dired-advertised-find-file (around dired-subst-directory activate)
  "Replace current buffer if file is a directory."
  (interactive)
  (let ((orig (current-buffer))
        (filename (dired-get-filename)))
    ad-do-it
    (when (and (file-directory-p filename)
               (not (eq (current-buffer) orig)))
      (kill-buffer orig))))


(provide 'appearance)
