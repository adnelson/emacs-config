; Keybindings to in/decrease font size.
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "M-;") 'goto-line)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

; If we can successfully require smex, set it to the M-x key.
(when (require 'smex nil 'noerror)
  (global-set-key (kbd "M-x") 'smex))


(global-set-key (kbd "M-n") 'windmove-down)
(global-set-key (kbd "M-p") 'windmove-up)
(global-set-key (kbd "M-i") 'windmove-left)
(global-set-key (kbd "M-o") 'windmove-right)

(global-set-key (kbd "C-M-<left>") 'backward-word)
(global-set-key (kbd "C-M-<right>") 'forward-word)
