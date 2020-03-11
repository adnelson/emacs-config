; Turn off menu bar
(menu-bar-mode -1)

; Automatically revert changed buffers.
(global-auto-revert-mode 1)

; If there's no active region, C-w should delete a word.
(defadvice kill-region (before unix-werase activate compile)
      "When called interactively with no active region, delete a single word
       backwards instead."
      (interactive
       (if mark-active (list (region-beginning) (region-end))
         (list (save-excursion (backward-word 1) (point)) (point)))))

(put 'erase-buffer 'disabled nil)

;; Enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)

; Turn on ido-mode, this enables auto-completion when opening files.
(ido-mode t)

; Disable the splash screen; it's kinda pointless.
(setq inhibit-startup-message t)

; Remove whitespace at end of lines on save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; Don't warn when switching cases.
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

; Infinite scrollback with ansi-term
(setq term-buffer-maximum-size 0)

; Disable the abomination known as electric-indent-mode.
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

; If you don't specify this, the haskell mode yells at you incessantly. Great.
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

; Seems the same is true for purescript. BOOOO
(add-hook 'purescript-mode-hook 'turn-on-purescript-indentation)

; Disable show-paren-mode when using proof general (has a bug).
(add-hook 'proof-ready-for-assistant-hook (lambda () (show-paren-mode 0)))

; Make prompts work in ansi-term (maybe?)
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

; Disable tabs
(setq-default indent-tabs-mode nil)

; Scroll past end when using C-v or M-v
(setq scroll-error-top-bottom t)

; Indentation level for javascript
(setq js-indent-level 2)

;; disable lockfiles
;; see http://www.gnu.org/software/emacs/manual/html_node/emacs/Interlocking.html
(setq create-lockfiles nil)

;; store all backup files in the tmp dir
;; http://www.gnu.org/software/emacs/manual/html_node/emacs/Backup-Names.html
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

;; store all autosave files in the tmp dir
;; http://www.gnu.org/software/emacs/manual/html_node/emacs/Auto-Save-Files.html
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; autosave the undo-tree history
(setq undo-tree-history-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq undo-tree-auto-save-history t)

(load-file "~/.emacs.d/custom/clipboard.el")
