(global-set-key (kbd "M-t") 'ansi-term)

(setq
  bash-path
  (if (eq system-type 'darwin)
    "/bin/bash"
    "/run/current-system/sw/bin/bash"))

(defun bash ()
  (interactive)
  (ansi-term bash-path))

;; This comes up a lot
(define-key term-raw-map (kbd "M-r") 'rename-buffer)

;; Set globally as well as in terminal
(global-set-key (kbd "M-b") 'bash)
(define-key term-raw-map (kbd "M-b") 'bash)

;; TODO restart term
