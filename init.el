(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

; Disable the splash screen; it's kinda pointless.
(setq inhibit-startup-message t)

(set-default-font "Terminus-11")

; If you don't specify this, the haskell mode yells at you incessantly. Great.
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

; Remove whitespace at end of lines on save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; Don't warn when using upcase-region.
(put 'upcase-region 'disabled nil)

; Disable the abomination known as electric-indent-mode.
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

; Show column numbers.
(column-number-mode)

; Load up coq.
(load-file "~/.nix-profile/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el")

; Disable show-paren-mode when using proof general (has a bug).
(add-hook 'proof-ready-for-assistant-hook (lambda () (show-paren-mode 0)))

(defun add-to-load-path (path)
 "Add something to the load path, if it's not there already."
 (unless (member path load-path)
         (push path load-path)))

; Contains a lot of packages (though, frustratingly, not all).
(add-to-load-path "~/.nix-profile/share/emacs/site-lisp")

; For example, it seems this path needs to be explicitly added. :(
(add-to-load-path "~/.nix-profile/share/emacs/site-lisp/urweb-mode")
(require 'urweb-mode)

(defun elpa-packages-list ()
 "List all of the files in the nix emacs ELPA packages directory."
 ; The `t` argument says to return full paths. The regex will ignore dot files.
 (directory-files "~/.nix-profile/share/emacs/site-lisp/elpa" t "^[^.]"))

(defun elpa-packages-refresh ()
 "Adds all of the packages in the nix-package-list to the load path."
  (mapc 'add-to-load-path (nix-packages-list)))

; Keybindings to in/decrease font size.
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

; Quickening up this process...
(global-set-key (kbd "M-:") 'goto-line)

; Automatically revert changed buffers.
(global-auto-revert-mode 1)

; If there's no active region, C-w should delete a word.
(defadvice kill-region (before unix-werase activate compile)
      "When called interactively with no active region, delete a single word
       backwards instead."
      (interactive
       (if mark-active (list (region-beginning) (region-end))
         (list (save-excursion (backward-word 1) (point)) (point)))))
(put 'downcase-region 'disabled nil)
