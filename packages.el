;;; packages.el --- rogue Layer packages File for Spacemacs

(defconst rogue-packages
  '(all-the-icons
    (authinfo :location local)
    doom-themes
    org-re-reveal
    (rogue-ui :location local)
    (rogue-utils :location local)
    solaire-mode
    (spaceline-all-the-icons :location local)))

;; Initialize packages
(defun rogue/init-all-the-icons ()
  (use-package all-the-icons))

(defun rogue/init-authinfo ()
  (use-package authinfo
    :after (s dash-functional)))

(defun rogue/init-doom-themes ()
  (use-package doom-themes
    :config
    (setq doom-themes-enable-bold t
          doom-themes-enable-italic t)

    (doom-themes-neotree-config)
    (setq doom-neotree-enable-variable-pitch t
		  doom-neotree-enable-file-icons t
          doom-neotree-line-spacing 4)
    (doom-themes-org-config)))

(defun rogue/init-org-re-reveal ()
  (use-package org-re-reveal))

(defun rogue/init-rogue-ui ()
  (use-package rogue-ui
    :after rogue-utils
    :config
    (rogue-ui-setup)))

(defun rogue/init-rogue-utils ()
  (use-package rogue-utils))

(defun rogue/init-solaire-mode ()
  (use-package solaire-mode
    :hook ((prog-mode . turn-on-solaire-mode)
           (minibuffer-setup . solaire-mode-in-minibuffer)
           (ediff-prepare-buffer . solaire-mode))))

(defun rogue/init-spaceline-all-the-icons ()
  (progn
    (use-package spaceline-all-the-icons
      :after spaceline)
    (use-package spaceline
      :after powerline
      :config
      (setq-default mode-line-format '("%e" (:eval (spaceline-ml-ati)))))))

