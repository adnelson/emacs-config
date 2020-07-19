(global-set-key (kbd "M-t") 'ansi-term)

(setq
  bash-path
  (if (eq system-type 'darwin)
    "/bin/bash"
    "/run/current-system/sw/bin/bash"))

(defun bash ()
  (interactive)
  (ansi-term bash-path))

(defun add-rename-buffer-key () (define-key term-raw-map (kbd "M-r") 'rename-buffer))
(add-hook 'term-mode-hook 'add-rename-buffer-key)

(defun add-bash-key () (define-key term-raw-map (kbd "M-b") 'bash))
(add-hook 'term-mode-hook 'add-bash-key)

;; Set globally as well as in terminal
(global-set-key (kbd "M-b") 'bash)

;; TODO restart term
