; This will stop a background color from being loaded, even if a theme
; would normally load one.
(defun unset-background ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))
(add-hook 'window-setup-hook 'unset-background)

; Set the default font (only matters for window mode)
(set-default-font "Terminus-11")

; Show column numbers.
(column-number-mode)

; Use the monokai theme without background
(require 'monokai-theme)
(unset-background)

; Menu bar seems pointless
(menu-bar-mode -1)
