(setq-default tab-width 4
              c-basic-offset 4
              indent-tabs-mode nil
              js-indent-level 2)
(setq ns-command-modifier 'meta)

(global-set-key (kbd "M-`") 'other-frame)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")
(add-to-list 'load-path "~/.emacs.d/evil")

(setq org-startup-truncated nil)

;(require 'haml-mode)
(require 'esv)
;(require 'full-screen)
;(require 'evil)

;(evil-mode 1)
