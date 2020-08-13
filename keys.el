;; keys -*- lexical-binding: t -*-
;;; package --- Summary

;;; Code:
(require 'jh)
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))
(add-to-list 'load-path package-user-dir)
(require 'projectile)
(require 'crux)

(global-set-key (kbd "C-a") 'move-beginning-of-line)
(global-set-key (kbd "C-e") 'move-end-of-line)
(global-set-key (kbd "C-n") 'next-line)
(global-set-key (kbd "C-f") 'forward-char)
(global-set-key (kbd "C-p") 'previous-line)
(global-set-key (kbd "C-v") 'scroll-up-command)
(global-set-key (kbd "M-v") 'scroll-down-command)

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-n") 'next-line)
(global-set-key (kbd "C-c c") 'org-capture)

(global-set-key (kbd "C-c f f") 'crux-recentf-find-file)
(global-set-key (kbd "C-c f e d") 'jh-open-dotfile)

(global-set-key (kbd "C-c b n") 'jh-new-empty-buffer)
(global-set-key (kbd "C-c b r") 'revert-buffer)

(global-set-key (kbd "C-c s w") 'jh-copy-line-or-region)
(global-set-key (kbd "C-c s x") 'jh-cut-line-or-region)

(global-set-key (kbd "C-c s s") 'jh-select-line)

(global-set-key (kbd "C-SPC") 'jh-switch-to-last-buffer)

(global-set-key (kbd "C-c p f") 'projectile-find-file)

(provide 'keys)
;;; keys.el ends here
