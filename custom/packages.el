; Add a few package repos in addition to the default, which doesn't have much.
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

; Load up coq.
; (load-file "~/.nix-profile/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el")

(defun add-to-load-path (path)
 "Add something to the load path, if it's not there already."
 (unless (member path load-path)
         (push path load-path)))

; Contains a lot of packages (though, frustratingly, not all).
(add-to-load-path "~/.nix-profile/share/emacs/site-lisp")

; For example, it seems this path needs to be explicitly added. :(
(add-to-load-path "~/.nix-profile/share/emacs/site-lisp/urweb-mode")
(require 'urweb-mode nil 'noerror)

(defun elpa-packages-list ()
 "List all of the files in the nix emacs ELPA packages directory."
 ; The `t` argument says to return full paths. The regex will ignore dot files.
 (directory-files "~/.nix-profile/share/emacs/site-lisp/elpa" t "^[^.]"))

(defun elpa-packages-refresh ()
 "Adds all of the packages in the nix-package-list to the load path."
  (mapc 'add-to-load-path (nix-packages-list)))
