;;
;; use-packages.el
;;

;;
;; Vertico
;;   
(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  (setq vertico-scroll-margin 2);; Different scroll margin
  (setq vertico-count 10) 	;; Show more candidates
  (setq vertico-resize nil)	;; Grow and shrink the minibuffer
  (setq vertico-cycle nil)	;; Enable cycling 
)

(use-package savehist
  :ensure t
  :init
  (savehist-mode))


(use-package emacs
  :init
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  (setq read-extended-command-predicate
         #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;;
;; Orderless
;;
(use-package orderless
  :ensure t
  :config
  (setq orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch)
	orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;;
;; blackout
;;
(use-package blackout
    :ensure t)

;;
;; git-gutter
;; taken from https://ianyepan.github.io/posts/emacs-git-gutter/
;; 
(use-package git-gutter
  :ensure t
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))

(package-install 'git-gutter-fringe)
(use-package git-gutter-fringe
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))

;;
;; Projectile
;;
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("H-p" . projectile-command-map))
  :custom
  (projectile-mode-line-prefix " ")
  (projectile-project-search-path '("~/Hyland/src"))
  (projectile-indexing-method 'hybrid)
  (projectile-generic-command "rg --files --hidden --null"))


(use-package gptel
  :ensure t)

(provide 'use-packages)
