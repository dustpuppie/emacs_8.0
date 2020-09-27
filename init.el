;;; init.el --- dustpuppie's emacs.d init file -*- lexical-binding: t -*-
;;; Commentary:
;; Copyright (c) 2004-2020 dustpuppie
;;; Code:

;;------------------------------------------------------------------------------
;; Turn on debugging and increase logging for init stage
;;------------------------------------------------------------------------------
(setq-default debug-on-error t
	      message-log-max t)
(add-hook 'after-init-hook '(lambda ()
			      (setq-default debug-on-error nil)))

;;------------------------------------------------------------------------------
;; Initialize straight.el
;;------------------------------------------------------------------------------
(defvar straight-recipes-gnu-elpa-use-mirror)
(defvar straight-repository-branch)
(defvar straight-vc-git-default-clone-depth)
(defvar straight-enable-use-package-integration)
(defvar straight-check-for-modifications)

(setq straight-recipes-gnu-elpa-use-mirror     t
      straight-repository-branch               "master"
      straight-vc-git-default-protocol         'ssh
      straight-vc-git-default-clone-depth      1
      straight-enable-use-package-integration  nil
      straight-check-for-modifications         '(find-when-checking))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el"
			 user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;------------------------------------------------------------------------------
;; setup use-package
;;------------------------------------------------------------------------------
(straight-use-package 'use-package)

;;------------------------------------------------------------------------------
;; Change default scratch message
;;------------------------------------------------------------------------------
(setq initial-scratch-message ";; ╔═╗┌─┐┬─┐┌─┐┌┬┐┌─┐┬ ┬\n;; ╚═╗│  ├┬┘├─┤ │ │  ├─┤\n;; ╚═╝└─┘┴└─┴ ┴ ┴ └─┘┴ ┴\n")

;;------------------------------------------------------------------------------
;; Tangle real config
;;------------------------------------------------------------------------------
(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))

(provide 'init)
(message "Finished")
;;; init.el ends here

;; (use-package which-key)

;; (use-package lsp-mode
;;   :hook
;;     (lsp-mode . lsp-enable-which-key-integration))
;; (use-package lsp-ui
;;   :commands lsp-ui-mode)
