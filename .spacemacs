;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     phpbibtex
     c-c++
     common-lisp
     csv
     erlang
     emacs-lisp
     ess
     graphviz
     haskell
     html
     javascript
     (latex :variables
            latex-enable-folding t
            latex-enable-auto-fill t)
     (markdown :variables markdown-live-preview-engine 'vmd)
     ocaml
     (org :variables
          org-enable-github-support t
          org-enable-reveal-js-support t)
     python
     racket
     ruby
     scheme
     shell
     shell-scripts
     sql
     typescript
     yaml
     ;; Assists
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-private-snippets-directory "~/.emacs.d/private/rogue/snippets")
     better-defaults
     colors
     dash
     ;; (elfeed :variables
     ;;         rmh-elfeed-org-files '("~/.emacs.d/private/rogue/feeds.org")
     ;;         elfeed-enable-web-interface t)
     git
     github
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     imenu-list
     (mu4e :variables mu4e-installation-path "/usr/share/emacs/site-lisp/mu4e")
     nlinum
     pdf-tools
     prodigy
     (ranger :variables ranger-show-preview t)
     restclient
     rogue
     (spell-checking :variables spell-checking-enable-by-default nil)
     spotify
     (syntax-checking :variables syntax-checking-enable-by-default nil)
     theming
     typography
     (version-control :variables
                      version-control-diff-tool 'git-gutter
                      version-control-global-margin t
                      version-control-diff-side 'left)
     xkcd)
   dotspacemacs-additional-packages '()
   dotspacemacs-excluded-packages '(vi-tilde-fringe ess-R-object-popup)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-startup-recent-list-size 5
   dotspacemacs-scratch-mode 'org-mode
   dotspacemacs-themes '(doom-molokai spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state nil
   dotspacemacs-default-font '("Fura Code Regular Nerd Font"
                               :size 12
                               :weight regular
                               :width normal
                               :powerline-scale 1.0)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts t
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header t
   dotspacemacs-helm-position 'bottom
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar nil
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; Directories
  (defconst user-layer-dir (file-name-as-directory "~/.emacs.d/private/rogue"))
  (defconst user-secrets-dir (file-name-as-directory (concat user-layer-dir "secrets")))
  (defconst user-project-dir (file-name-as-directory (getenv "PROJECTS_DIR")))

  (defconst user-project-file (concat user-project-dir "dev/projects.org"))
  ;; Separate custom stuff
  (setq custom-file "~/.emacs-custom.el")
  (load custom-file))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place you code here."

  (setq user-full-name "Abhinav Tushar"
        browse-url-generic-program (executable-find (getenv "BROWSER"))
        browse-url-browser-function 'browse-url-generic)

  ;; Language specific settings
  (setq-default web-mode-markup-indent-offset 2
                web-mode-css-indent-offset 2
                web-mode-code-indent-offset 2
                css-indent-offset 2
                js2-basic-offset 2
                js-indent-level 2
                js2-strict-missing-semi-warning nil
                js2-missing-semi-one-line-override nil
                typescript-indent-level 2)

  (setq inferior-lisp-program "ros -Q run")

  (slime-setup '(slime-asdf
                 slime-company
                 slime-fancy
                 slime-indentation
                 slime-sbcl-exts
                 slime-scratch
                 slime-tramp)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ob-async org-gcal zeal-at-point yapfify yaml-mode xterm-color xkcd ws-butler writegood-mode winum vue-mode edit-indirect ssass-mode vue-html-mode volatile-highlights vmd-mode uuidgen utop unfill typo tuareg caml toc-org tide typescript-mode swiper sql-indent spotify spaceline powerline solaire-mode snakemake-mode smeargle slime-company slime shell-switcher shell-pop rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restclient-helm restart-emacs read-lyrics rbenv ranger rake rainbow-mode rainbow-identifiers rainbow-delimiters racket-mode faceup pyvenv pytest pyenv-mode py-isort prodigy pretty-mode popwin pip-requirements persp-mode parinfer paradox spinner pandoc-mode ox-reveal ox-pandoc ox-gfm orgit org-ref pdf-tools key-chord ivy tablist org-projectile org-category-capture org-pretty-table org-present org-pomodoro org-journal request-deferred deferred org-expand org-download org-cliplink org-bullets org-books emojify open-junk-file ocp-indent ob-restclient ob-http org-plus-contrib nov esxml nlinum-relative nlinum neotree mwim multi-term mu4e-maildirs-extension mu4e-alert move-text mmm-mode minitest merlin markdown-toc markdown-mode magit-gitflow magit-gh-pulls lorem-ipsum live-py-mode link-hint intero insert-shebang info+ indent-guide imenu-list ibuffer-projectile hyperbole hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt helm-spotify multi helm-pydoc helm-hoogle helm-gitignore helm-dash helm-company helm-c-yasnippet helm-bibtex parsebib haskell-snippets hackernews gscholar-bibtex graphviz-dot-mode google-translate golden-ratio gnuplot gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache ht gh-md geiser fuzzy focus flyspell-correct-helm flyspell-correct flycheck-pos-tip flycheck-haskell flycheck flx-ido fish-mode fill-column-indicator fancy-battery eyebrowse expand-region evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit ghub let-alist with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-ediff evil-args evil-anzu anzu eval-sexp-fu highlight ess-smart-equals ess-R-data-view ctable ess julia-mode esi request alert log4e gntp eshell-z eshell-prompt-extras esh-help erlang elnode db fakir creole kv noflet web dumb-jump disaster dired-subtree dired-hacks-utils diff-hl define-word cython-mode csv-mode cricbuzz enlive company-web web-completion-data company-tern dash-functional tern company-statistics company-shell company-restclient restclient know-your-http-well company-quickhelp pos-tip company-ghci company-ghc ghc haskell-mode company-cabal company-c-headers company-auctex company-anaconda company common-lisp-snippets column-enforce-mode colormaps color-identifiers-mode cmm-mode cmake-mode clean-aindent-mode clang-format chruby calfw-org calfw bundler inf-ruby browse-at-remote biblio biblio-core beacon seq auto-yasnippet auto-highlight-symbol auto-dictionary auctex anaconda-mode pythonic f aggressive-indent adaptive-wrap ace-link ac-ispell auto-complete doom-themes which-key web-mode web-beautify use-package tagedit slim-mode scss-mode sass-mode pug-mode pcre2el macrostep livid-mode less-css-mode json-mode js2-refactor js-doc hydra help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-css-scss helm-ag exec-path-from-shell evil-visualstar evil-escape emmet-mode elisp-slime-nav diminish coffee-mode bind-map auto-compile ace-window ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#191d25"))))
 '(cfw:face-annotation ((t (:foreground "#7b87a0"))))
 '(cfw:face-day-title ((t (:foreground "#7b87a0"))))
 '(cfw:face-default-content ((t (:foreground "#5E81AC"))))
 '(cfw:face-default-day ((t (:foreground "#ECEFF4"))))
 '(cfw:face-disable ((t (:foreground "#7b87a0"))))
 '(cfw:face-grid ((t (:foreground "#505a6f"))))
 '(cfw:face-header ((t (:foreground "#BF616A" :weight bold))))
 '(cfw:face-holiday ((t (:foreground "#D08770"))))
 '(cfw:face-periods ((t (:foreground "#5E81AC"))))
 '(cfw:face-saturday ((t (:foreground "#7b87a0" :weight bold))))
 '(cfw:face-select ((t (:background "#434C5E"))))
 '(cfw:face-sunday ((t (:foreground "#7b87a0"))))
 '(cfw:face-title ((t (:height 2.0 :inherit variable-pitch :weight bold :foreground "#7b87a0"))))
 '(cfw:face-today ((t (:background "#434C5E" :weight bold))))
 '(cfw:face-today-title ((t (:background "#BF616A" :foreground "#ECEFF4"))))
 '(cfw:face-toolbar ((t (:inherit default))))
 '(cfw:face-toolbar-button-off ((t (:foreground "#7b87a0"))))
 '(cfw:face-toolbar-button-on ((t (:foreground "#8FBCBB" :weight bold))))
 '(company-scrollbar-bg ((t (:background "#1C2028"))))
 '(company-scrollbar-fg ((t (:background "#505a6f"))))
 '(company-tooltip ((t (:background "#1C2028" :foreground "#7b87a0"))))
 '(company-tooltip-common ((t (:foreground "#BF616A"))))
 '(company-tooltip-mouse ((t (:background "#81A1C1"))))
 '(company-tooltip-selection ((t (:background "#242934"))))
 '(company-tootip-annotation ((t (:foreground "#8FBCBB"))))
 '(cursor ((t (:background "#BF616A"))))
 '(dired-subtree-depth-1-face ((t (:background nil))))
 '(dired-subtree-depth-2-face ((t (:background nil))))
 '(dired-subtree-depth-3-face ((t (:background nil))))
 '(dired-subtree-depth-4-face ((t (:background nil))))
 '(dired-subtree-depth-5-face ((t (:background nil))))
 '(dired-subtree-depth-6-face ((t (:background nil))))
 '(doom-neotree-data-file-face ((t (:height 1.0 :foreground "#7b87a0"))))
 '(doom-neotree-dir-face ((t (:foreground "#BF616A" :height 1.0))))
 '(doom-neotree-file-face ((t (:height 1.0))))
 '(doom-neotree-hidden-file-face ((t (:height 1.0 :foreground "#505a6f"))))
 '(doom-neotree-media-file-face ((t (:height 1.0 :foreground "#8FBCBB"))))
 '(doom-neotree-text-file-face ((t (:height 1.0))))
 '(eval-sexp-fu-flash ((t (:background "#5E81AC" :foreground "#ECEFF4"))))
 '(eval-sexp-fu-flash-error ((t (:background "#BF616A" :foreground "#ECEFF4"))))
 '(flycheck-error ((t (:background nil))))
 '(flycheck-warning ((t (:background nil))))
 '(font-latex-sectioning-0-face ((t (:foreground "#8FBCBB" :height 1.2))))
 '(font-latex-sectioning-1-face ((t (:foreground "#8FBCBB" :height 1.1))))
 '(font-latex-sectioning-2-face ((t (:foreground "#8FBCBB" :height 1.1))))
 '(font-latex-sectioning-3-face ((t (:foreground "#8FBCBB" :height 1.0))))
 '(font-latex-sectioning-4-face ((t (:foreground "#8FBCBB" :height 1.0))))
 '(font-latex-sectioning-5-face ((t (:foreground "#8FBCBB" :height 1.0))))
 '(font-latex-verbatim-face ((t (:foreground "#D08770"))))
 '(font-lock-builtin-face ((t (:foreground "#D08770"))))
 '(font-lock-comment-face ((t (:foreground "#7b87a0" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "#B48EAD"))))
 '(font-lock-doc-face ((t (:foreground "#7b87a0"))))
 '(font-lock-function-name-face ((t (:foreground "#88C0D0"))))
 '(font-lock-keyword-face ((t (:foreground "#BF616A"))))
 '(font-lock-string-face ((t (:foreground "#A3BE8C"))))
 '(font-lock-type-face ((t (:foreground "#8FBCBB"))))
 '(font-lock-variable-name-face ((t (:foreground "#EBCB8B"))))
 '(git-gutter-fr:added ((t (:foreground "#A3BE8C"))))
 '(git-gutter-fr:modified ((t (:foreground "#5E81AC"))))
 '(hackernews-comment-count ((t (:foreground "#A3BE8C"))))
 '(hackernews-link ((t (:foreground "#81A1C1"))))
 '(header-line ((t (:background nil :inherit nil))))
 '(helm-M-x-key ((t (:foreground "#D08770"))))
 '(helm-ff-directory ((t (:foreground "#D08770"))))
 '(helm-ff-dotted-symlink-directory ((t (:background nil))))
 '(helm-ff-prefix ((t (:foreground "#BF616A"))))
 '(helm-ff-symlink ((t (:foreground "#81A1C1"))))
 '(helm-grep-match ((t (:foreground "#B48EAD"))))
 '(helm-match ((t (:foreground "#BF616A"))))
 '(helm-selection ((t (:background "#242934"))))
 '(helm-separator ((t (:foreground "#BF616A"))))
 '(highlight ((t (:background "#20242e" :foreground "#ECEFF4"))))
 '(hl-line ((t (:background "#20242e"))))
 '(ido-first-match ((t (:foreground "#B48EAD"))))
 '(link ((t (:foreground "#81A1C1"))))
 '(magit-branch-current ((t (:foreground "#B48EAD"))))
 '(magit-branch-local ((t (:foreground "#5E81AC"))))
 '(magit-branch-remote ((t (:foreground "#A3BE8C"))))
 '(magit-diff-added ((t (:background "#252822" :foreground "#88ab6b"))))
 '(magit-diff-added-highlight ((t (:background "#31362e" :foreground "#A3BE8C"))))
 '(magit-diff-hunk-heading ((t (:background "#434C5E" :foreground "#7b87a0"))))
 '(magit-diff-hunk-heading-highlight ((t (:background "#434C5E" :foreground "#ECEFF4"))))
 '(magit-diff-lines-heading ((t (:background "#D08770" :weight bold :foreground "#191d25"))))
 '(magit-diff-removed ((t (:background "#2a2828" :foreground "#a8444d"))))
 '(magit-diff-removed-highlight ((t (:background "#373535" :foreground "#BF616A"))))
 '(magit-header-line ((t (:background nil :foreground "#191d25" :box nil))))
 '(magit-log-author ((t (:foreground "#D08770"))))
 '(magit-log-date ((t (:foreground "#5E81AC"))))
 '(magit-section-heading ((t (:foreground "#BF616A"))))
 '(magit-section-heading-selection ((t (:foreground "#EBCB8B"))))
 '(minibuffer-prompt ((t (:foreground "#BF616A"))))
 '(mode-line ((t (:background "#1C2028"))))
 '(mode-line-inactive ((t (:background "#191d25"))))
 '(mu4e-header-highlight-face ((t (:underline nil :background "#242934"))))
 '(mu4e-header-key-face ((t (:foreground "#7b87a0"))))
 '(mu4e-header-value-face ((t (:foreground "#81A1C1"))))
 '(neo-root-dir-face ((t (:foreground "#ECEFF4" :background "#20242e" :box (:line-width 6 :color "#20242e")))))
 '(nlinum-current-line ((t (:foreground "#D08770"))))
 '(org-agenda-current-time ((t (:foreground "#81A1C1"))))
 '(org-agenda-date ((t (:foreground "#7b87a0" :inherit variable-pitch))))
 '(org-agenda-date-today ((t (:height 1.5 :foreground "#BF616A" :inherit variable-pitch))))
 '(org-agenda-date-weekend ((t (:inherit org-agenda-date))))
 '(org-agenda-done ((t (:inherit nil :strike-through t :foreground "#7b87a0"))))
 '(org-agenda-structure ((t (:height 1.3 :foreground "#7b87a0" :weight normal :inherit variable-pitch))))
 '(org-block ((t (:background "#191d25"))))
 '(org-block-begin-line ((t (:background "#191d25"))))
 '(org-block-end-line ((t (:background "#191d25"))))
 '(org-code ((t (:foreground "#D08770"))))
 '(org-date ((t (:foreground "#7b87a0"))))
 '(org-document-info ((t (:foreground "#7b87a0" :slant italic))))
 '(org-document-info-keyword ((t (:foreground "#505a6f"))))
 '(org-document-title ((t (:inherit variable-pitch :height 1.3 :weight normal :foreground "#7b87a0"))))
 '(org-done ((t (:inherit variable-pitch :foreground "#5E81AC" :background "#191d25"))))
 '(org-ellipsis ((t (:underline nil :background "#191d25" :foreground "#505a6f"))))
 '(org-headline-done ((t (:strike-through t))))
 '(org-indent ((t (:inherit org-hide))))
 '(org-level-1 ((t (:inherit variable-pitch :height 1.3 :weight bold :foreground "#BF616A" :background "#191d25"))))
 '(org-level-2 ((t (:inherit variable-pitch :weight bold :height 1.2 :foreground "#7b87a0" :background "#191d25"))))
 '(org-level-3 ((t (:inherit variable-pitch :weight bold :height 1.1 :foreground "#7b87a0" :background "#191d25"))))
 '(org-level-4 ((t (:inherit variable-pitch :weight bold :height 1.1 :foreground "#7b87a0" :background "#191d25"))))
 '(org-level-5 ((t (:inherit variable-pitch :weight bold :height 1.1 :foreground "#7b87a0" :background "#191d25"))))
 '(org-level-6 ((t (:inherit variable-pitch :weight bold :height 1.1 :foreground "#7b87a0" :background "#191d25"))))
 '(org-level-7 ((t (:inherit variable-pitch :weight bold :height 1.1 :foreground "#7b87a0" :background "#191d25"))))
 '(org-level-8 ((t (:inherit variable-pitch :weight bold :height 1.1 :foreground "#7b87a0" :background "#191d25"))))
 '(org-link ((t (:underline nil :weight normal :foreground "#81A1C1"))))
 '(org-list-dt ((t (:foreground "#88C0D0"))))
 '(org-quote ((t (:background "#191d25"))))
 '(org-ref-cite-face ((t (:foreground "#D08770"))))
 '(org-scheduled ((t (:foreground "#7b87a0"))))
 '(org-scheduled-previously ((t (:foreground "#81A1C1"))))
 '(org-scheduled-today ((t (:foreground "#ECEFF4"))))
 '(org-special-keyword ((t (:height 0.9 :foreground "#505a6f"))))
 '(org-table ((t (:background nil :foreground "#7b87a0"))))
 '(org-tag ((t (:foreground "#7b87a0"))))
 '(org-time-grid ((t (:foreground "#505a6f"))))
 '(org-todo ((t (:foreground "#D08770" :background "#191d25"))))
 '(org-upcoming-deadline ((t (:foreground "#BF616A"))))
 '(org-warning ((t (:foreground "#D08770"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#5E81AC"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#BF616A"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#B48EAD"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#D08770"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#81A1C1"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#A3BE8C"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#88C0D0"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#EBCB8B"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#8FBCBB"))))
 '(region ((t (:background "#434C5E"))))
 '(show-paren-match ((t (:background "#BF616A" :foreground "#191d25"))))
 '(sldb-restartable-frame-line-face ((t (:foreground "#A3BE8C"))))
 '(slime-repl-inputed-output-face ((t (:foreground "#BF616A"))))
 '(solaire-default-face ((t (:background "#20242e"))))
 '(solaire-hl-line-face ((t (:background "#20242e"))))
 '(sp-pair-overlay-face ((t (:background "#20242e"))))
 '(sp-show-pair-match-face ((t (:background "#505a6f" :foreground "#EBCB8B"))))
 '(sp-wrap-overlay-face ((t (:background "#20242e"))))
 '(spacemacs-emacs-face ((t (:background "#191d25" :foreground "#ECEFF4"))))
 '(spacemacs-evilified-face ((t (:background "#191d25" :foreground "#ECEFF4"))))
 '(spacemacs-hybrid-face ((t (:background "#191d25" :foreground "#ECEFF4"))))
 '(spacemacs-lisp-face ((t (:background "#191d25" :foreground "#ECEFF4"))))
 '(spacemacs-motion-face ((t (:background "#191d25" :foreground "#ECEFF4"))))
 '(spacemacs-normal-face ((t (:background "#191d25" :foreground "#ECEFF4"))))
 '(spacemacs-visual-face ((t (:background "#191d25" :foreground "#ECEFF4"))))
 '(swiper-line-face ((t (:background "#434C5E" :foreground "#ECEFF4"))))
 '(swiper-match-face-2 ((t (:background "#D08770"))))
 '(tooltip ((t (:foreground "#7b87a0" :background "#1C2028"))))
 '(variable-pitch ((t (:family "Source Sans Pro"))))
 '(vertical-border ((t (:background "#434C5E" :foreground "#434C5E"))))
 '(which-key-command-description-face ((t (:foreground "#8FBCBB"))))
 '(which-key-key-face ((t (:foreground "#A3BE8C")))))
