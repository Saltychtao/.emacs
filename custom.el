(let ((default-directory "~/projects/emacs/"))
  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "~/projects/emacs")

;; misc
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))
(fset 'yes-or-no-p 'y-or-n-p)
(setq user-full-name "Saltychtao"
      user-mail-address "lijh@nlp.nju.edu.cn")


(require 'ox-latex)
;; (add-to-list 'org-latex-packages-alist '("" "minted"))
;; (setq org-latex-listings 'minted)


;;; org agenda
(with-eval-after-load 'org
  (setq org-agenda-files (file-expand-wildcards "~/org/gtd.org"))
  (setq org-latex-to-pdf-process
        '("pdflatex -shell-escape -interaction nonstopmode %f"
          "pdflatex -shell-escape -interaction nonstopmode %f"
          "pdflatex -shell-escape -interaction nonstopmode %f")))


;; org capture
(with-eval-after-load 'org
  :config
  (setq org-capture-templates nil)
  (push '("t" "TODO items")
        org-capture-templates)

  (push '("tl" "TODO items for Life" entry
          (file+headline "~/org/gtd.org" "Life")
          "* TODO %?\n"
          )
        org-capture-templates)

  (push '("tw" "TODO items for Work" entry
          (file+headline "~/org/gtd.org" "Work")
          "* TODO %?\n"
          )
        org-capture-templates)

  (push '("to" "TODO items for Emacs and others" entry
          (file+headline "~/org/gtd.org" "Emacs and others")
          "* TODO %?\n"
          )
        org-capture-templates)

  (push '("L" "Useful Links" entry
          (file+headline "~/org/gtd.org" "Useful Links")
          "* [[%^{url}][%^{name}]]"
          )
        org-capture-templates)

  (push '("l" "Logs" entry
          (file+headline "~/org/gtd.org" "Daily Logs")
          "* Done %t %?\n"
          )
        org-capture-templates)

  (push '("c" "Useful Commands" entry
          (file+headline "~/org/note.org" "Useful Commands")
          "** %?\n %i\n"
          )
        org-capture-templates)
)

;; Tramp config
(setq tramp-default-method "ssh")


;; global pop mark ring
(global-unset-key (kbd "C-'"))
(global-set-key (kbd "C-'") 'pop-global-mark)

(use-package prog-mode
  :hook
  (prog-mode
   . (lambda ()
       (font-lock-add-keywords
        nil '(("\\<\\(FIXME\\|DEBUG\\|TODO\\):"
               1 font-lock-warning-face prepend)))))

  :defer t)

;; Enable Auto deploy on python-mode
(require 'jh)

;; (use-package python
;;   :config
;;   (defun python-auto-deploy ()
;;    (interactive)
;;    (when (eq major-mode 'python-mode)
;;      (jh-deploy-current-project)))
;;   (define-key python-mode-map (kbd "<f5>") (lambda () (interactive) (python-auto-deploy))))

(require 'arxiv-mode)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))


;; rebind C-x C-b to ivy-switch-buffer
(global-unset-key (kbd "C-x C-b"))
(global-set-key (kbd "C-x C-b") 'ivy-switch-buffer)
(global-set-key (kbd "<f5>") (lambda () (interactive) (jh-deploy-current-project)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (highlight-indent-guides volatile-highlights gif-screencast keycast counsel swiper ace-window ivy undo-tree which-key diff-hl crux super-save imenu-anywhere zop-to-char hl-todo company cask-mode yaml-mode adoc-mode markdown-mode web-mode haskell-mode erlang elixir-mode flycheck-joker cider clojure-mode inf-ruby rainbow-mode rainbow-delimiters move-text exec-path-from-shell easy-kill anzu paredit elisp-slime-nav expand-region pt projectile ag git-timemachine magit avy zenburn-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
