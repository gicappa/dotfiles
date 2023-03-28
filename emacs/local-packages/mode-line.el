
;;
;; mode-line.el
;;

;;
;; Mode Line customization
;;

;; modeline 1b1c2b
;; background 212338
;; bckg light 383c62
;; foreground 7a88cf
;; light c8d3f5
(set-face-attribute 'mode-line nil :font "Monaco" :height 130)
(set-face-attribute 'mode-line-inactive nil :font "Monaco" :height 130)

(defadvice vc-mode-line (after strip-backend () activate)
  (when (stringp vc-mode)
    (let ((gitlogo (replace-regexp-in-string "^ Git." " " vc-mode)))
      (setq vc-mode gitlogo))))

;; return the EOL type for the modeline
(defun mode-line-eol ()
  (let* ((code (symbol-name buffer-file-coding-system))
	 (eol-type (coding-system-eol-type buffer-file-coding-system))
	 (eol (if (eq 0 eol-type) "LF"
		(if (eq 1 eol-type) "CR+LF"
		  (if (eq 2 eol-type) "CR"
		    "---")))))
    
    (concat " " eol " ")))


;; accept two functions (left and right) aligning result of the
;; first to the left and of the second to the right
(defun left-right-aligner (left right)
  (let* ((available-width (- (window-width) (length left) 2)))
    (format (format " %%s %%%ds " available-width) left right)))


(defun formatted-mode-line ()
  (left-right-aligner
   (format-mode-line '(:propertize "left"))
   (format-mode-line '(:propertize "right"))))

(setq-default mode-line-format
	      '((:eval (left-right-aligner
			(format-mode-line (left-side))
			(format-mode-line (right-side))))))

(defun left-side () '(
		      (:propertize " %b%* "
				   face (:background "#383c62" :foreground "#c8d3f5"))
       		      (:propertize mode-line-eol)))
       
(defun right-side () '(
		       (:propertize (vc-mode vc-mode)
				    face (:background "#212338" :foreground "#ffdf72" :weight bold))
		       (:propertize " "
				    face (:background "#212338" :foreground "#ffdf72"))
		       (:propertize " %m "
				   face (:background "#1b1c2b" :foreground "#7a88cf"))
		       (:propertize " %l:%C "
				    face (:background "#1b1c2b" :foreground "#7a88cf"))))

(provide 'mode-line)
