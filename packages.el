;;; packages.el --- rogue Layer packages File for Spacemacs

(defconst rogue-packages
  '(all-the-icons
    (authinfo :location local)
    beacon
    browse-at-remote
    cricbuzz
    calfw
    calfw-org
    colormaps
    dired-subtree
    doom-themes
    (elnode :location (recipe :fetcher github :repo "lepisma/elnode"))
    enlive
    (esi :location (recipe :fetcher github :repo "lepisma/esi"))
    focus
    gscholar-bibtex
    hackernews
    hyperbole
    (mpm :location local)
    multiple-cursors
    nov
    ob-async
    org-cliplink
    (org-expand :location (recipe :fetcher github :repo "lepisma/org-expand"))
    org-gcal
    (org-pretty-table :location (recipe :fetcher github :repo "Fuco1/org-pretty-table"))
    (org-make :location local)
    parinfer
    pretty-mode
    (read-lyrics :location (recipe :fetcher github :repo "lepisma/read-lyrics.el"))
    (rogue-ui :location local)
    (rogue-utils :location local)
    shell-switcher
    snakemake-mode
    solaire-mode
    (spaceline-all-the-icons :location local)
    swiper
    (viz :location local)
    vue-mode
    (weather-amherst :location local)
    writegood-mode))

;; Initialize packages
(defun rogue/init-all-the-icons ()
  (use-package all-the-icons))

(defun rogue/init-authinfo ()
  (use-package authinfo
    :after (s dash-functional)))

(defun rogue/init-beacon ()
  :config
  (beacon-mode +1)
  (setq beacon-color (face-attribute 'region :background nil t)
        beacon-blink-when-buffer-changes t
        beacon-blink-when-point-moves-vertically 10))

(defun rogue/init-browse-at-remote ()
  (use-package browse-at-remote
    :defer t))

(defun rogue/init-cricbuzz ()
  (use-package cricbuzz
    :defer t))

(defun rogue/init-calfw ()
  (use-package calfw
    :bind (("C-c q" . cfw:open-org-calendar))
    :config
    (setq cfw:fchar-junction ?┼
          cfw:fchar-vertical-line ?│
          cfw:fchar-horizontal-line ?─
          cfw:fchar-left-junction ?├
          cfw:fchar-right-junction ?┤
          cfw:fchar-top-junction ?┬
          cfw:fchar-top-left-corner ?┌
          cfw:fchar-top-right-corner ?┐)
    (setq cfw:render-line-breaker 'cfw:render-line-breaker-none)
    (setq cfw:face-item-separator-color nil)))

(defun rogue/init-calfw-org ()
  (use-package calfw-org
    :after calfw
    :config
    (setq cfw:org-face-agenda-item-foreground-color "#BF616A")))

(defun rogue/init-colormaps ()
  (use-package colormaps
    :defer t))

(defun rogue/init-dired-subtree ()
  (use-package dired-subtree :ensure t
    :after ranger
    :config
    (bind-key "<tab>" 'dired-subtree-toggle ranger-mode-map)
    (bind-key "<backtab>" 'dired-subtree-cycle ranger-mode-map)))

(defun rogue/init-doom-themes ()
  (use-package doom-themes
    :config
    (setq doom-themes-enable-bold t
          doom-themes-enable-italic t)

    (doom-themes-neotree-config)
    (setq doom-neotree-enable-variable-pitch t
          doom-neotree-file-icons 'simple
          doom-neotree-line-spacing 4)
    (doom-themes-org-config)))

(defun rogue/init-elnode ()
  (use-package elnode))

(defun rogue/init-enlive ()
  (use-package enlive))

(defun rogue/init-esi ()
  (use-package esi
    :config
    (setq esi-music-directory (file-name-as-directory "~/Desktop"))))

(defun rogue/init-focus ()
  (use-package focus))

(defun rogue/init-gscholar-bibtex ()
  (use-package gscholar-bibtex
    :config
    (setq gscholar-bibtex-database-file "~/library.bib"
          gscholar-bibtex-default-source "Google Scholar")))

(defun rogue/init-hackernews ()
  (use-package hackernews
    :bind ("C-c h" . hackernews)))

(defun rogue/init-hyperbole ()
  (use-package hyperbole
    :demand t))

(defun rogue/init-mpm ()
  (use-package mpm
    :after org-cliplink))

(defun rogue/init-multiple-cursors ()
  (use-package multiple-cursors
    :bind (("C->" . mc/mark-next-like-this)
           ("C-<" . mc/mark-previous-like-this)
           ("C-M-<mouse-1>" . mc/add-cursor-on-click))))

(defun rogue/init-nov ()
  (use-package nov
    :config
    (push '("\\.epub\\'" . nov-mode) auto-mode-alist)
    (setq nov-text-width 80)))

(defun rogue/init-ob-async ()
  (use-package ob-async))

(defun rogue/init-org-cliplink ()
  (use-package org-cliplink
    :bind (("C-c y" . org-cliplink))))

(defun rogue/init-org-expand ()
  (use-package org-expand
    :bind (("C-c x" . helm-org-expand))))

(defun rogue/init-org-gcal ()
  (use-package org-gcal
    :ensure t
    :after (org calfw calfw-org)
    :hook ((org-agenda-mode . org-gcal-sync)
           (org-capture-after-finalize . org-gcal-sync)
           (cfw:calendar-mode . org-gcal-sync))
    :config
    (setq org-gcal-file-alist `(("abhinav.tushar.vs@gmail.com" . ,user-gcal-file)))
    ;; Secret file
    ;; (setq org-gcal-client-id "<>"
    ;;       org-gcal-client-secret "<>")
    (load-file (concat user-secrets-dir "gcal.el"))))

(defun rogue/init-org-pretty-table ()
  (use-package org-pretty-table
    :demand t
    :init
    (add-hook 'org-mode-hook (lambda () (org-pretty-table-mode 1)))))

(defun rogue/init-org-make ()
  (use-package org-make
    :after org))

(defun rogue/init-parinfer ()
  (use-package parinfer
    :ensure t
    :bind (("C-," . parinfer-toggle-mode))
    :hook ((clojure-mode . parinfer-mode)
           (emacs-lisp-mode . parinfer-mode)
           (common-lisp-mode . parinfer-mode)
           (racket-mode . parinfer-mode)
           (lisp-mode . parinfer-mode)
           (scheme-mode . parinfer-mode)
           (hy-mode . parinfer-mode))
    :init
    (setq parinfer-extensions '(defaults
                                pretty-parens
                                smart-tab
                                smart-yank))))

(defun rogue/init-pretty-mode ()
  (use-package pretty-mode
    :config
    (global-pretty-mode t)
    (global-prettify-symbols-mode 1)

    (pretty-deactivate-groups
     '(:equality
       :ordering
       :ordering-double
       :ordering-triple
       :arrows
       :arrows-twoheaded
       :punctuation
       :logic
       :sets
       :sub-and-superscripts
       :subscripts
       :arithmetic-double
       :arithmetic-triple))

    (pretty-activate-groups
     '(:greek :arithmetic-nary))))

(defun rogue/init-read-lyrics ()
  (use-package read-lyrics
    :commands (read-lyrics-read-lyrics)
    :after (s spotify)))

(defun rogue/init-rogue-ui ()
  (use-package rogue-ui
    :after rogue-utils
    :config
    (rogue-ui-setup)))

(defun rogue/init-rogue-utils ()
  (use-package rogue-utils))

(defun rogue/init-shell-switcher ()
  (use-package shell-switcher
    :demand t
    :config (setq shell-switcher-mode t)
    :bind (("C-'" . shell-switcher-switch-buffer)
           ("C-\"" . shell-switcher-new-shell))))

(defun rogue/init-snakemake-mode ()
  (use-package snakemake-mode
    :defer t))

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

(defun rogue/init-swiper ()
  (use-package swiper
    :bind (("C-s" . swiper)
           ("C-r" . swiper))))

(defun rogue/init-viz ()
  (use-package viz
    :defer t))

(defun rogue/init-vue-mode ()
  (use-package vue-mode
    :mode ("\\.vue\\'" . vue-mode)))

(defun rogue/init-writegood-mode ()
  (use-package writegood-mode
    :defer t))

(defun rogue/init-weather-amherst ()
  (use-package weather-amherst
    :bind (("C-c w" . weather-amherst))))
