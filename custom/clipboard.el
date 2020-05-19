(defun copy-to-clipboard ()
  (interactive)
  (if (display-graphic-p)
      (progn
        (message "Yanked region to x-clipboard!")
        (call-interactively 'clipboard-kill-ring-save)
        )
    (if (region-active-p)
        (progn
          (shell-command-on-region
            (region-beginning)
            (region-end)
            (if (eq system-type 'darwin) "pbcopy" "xsel -i -b")
          )
          (message "Yanked region to clipboard!")
          (deactivate-mark))
      (message "No region active; can't yank to clipboard!")))
    )

(defun paste-from-clipboard ()
  (interactive)
  (if (display-graphic-p)
      (progn
        (clipboard-yank)
        (message "graphics active")
        )
    (insert
      (shell-command-to-string
        (if (eq system-type 'darwin) "pbpaste" "xsel -o -b")))
    )
  )

(fmakunbound 'copy-from-ubuntu)
