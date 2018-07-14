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
     php
     c-c++
     common-lisp
     emacs-lisp
     games
     html
     javascript
     (markdown :variables markdown-live-preview-engine 'vmd)
     (org :variables
          org-enable-github-support t
          org-enable-reveal-js-support t)
     python
     ruby
     shell
     shell-scripts
     sql
     typescript
     ;; Assists
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-private-snippets-directory "~/.emacs.d/private/rogue/snippets")
     better-defaults
     colors
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
   dotspacemacs-verbose-loading t
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-startup-recent-list-size 5
   dotspacemacs-scratch-mode 'text-mode
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
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
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
)

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place you code here."

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))

(add-to-list 'default-frame-alist '(ns-appearance . dark))
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (typit mmt sudoku pacmacs 2048-game yapfify xterm-color xkcd web-mode web-beautify vmd-mode utop unfill typo tuareg caml tide typescript-mode tagedit swiper ivy sql-indent spotify solaire-mode smeargle slime-company slime slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restclient-helm rbenv ranger rake rainbow-mode rainbow-identifiers racket-mode faceup pyvenv pytest pyenv-mode py-isort pug-mode prodigy pretty-mode pip-requirements phpunit phpcbf php-extras php-auto-yasnippets pdf-tools tablist ox-reveal ox-gfm orgit org-projectile org-category-capture org-pretty-table org-present org-pomodoro org-mime org-expand enlive org-download org-cliplink ocp-indent ob-restclient ob-http nov esxml nlinum-relative nlinum mwim multi-term mu4e-maildirs-extension mu4e-alert alert log4e gntp mmm-mode minitest merlin markdown-toc markdown-mode magit-gitflow magit-gh-pulls livid-mode skewer-mode simple-httpd live-py-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc intero insert-shebang imenu-list ibuffer-projectile hy-mode htmlize hlint-refactor hindent helm-spotify-plus multi helm-pydoc helm-hoogle helm-gitignore helm-dash helm-css-scss helm-company helm-c-yasnippet haskell-snippets haml-mode graphviz-dot-mode gnuplot gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache ht gh-md geiser fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip flycheck-haskell flycheck fish-mode evil-magit magit magit-popup git-commit ghub with-editor ess-smart-equals ess-R-data-view ctable ess julia-mode eshell-z eshell-prompt-extras esh-help erlang emmet-mode drupal-mode php-mode disaster dired-subtree dired-hacks-utils diff-hl dash-at-point cython-mode csv-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-shell company-restclient restclient know-your-http-well company-quickhelp pos-tip company-ghci company-ghc ghc haskell-mode company-cabal company-c-headers company-auctex company-anaconda company common-lisp-snippets color-identifiers-mode coffee-mode cmm-mode cmake-mode clang-format chruby bundler inf-ruby auto-yasnippet yasnippet auto-dictionary auctex anaconda-mode pythonic ac-ispell auto-complete doom-themes ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#1a001db72525"))))
 '(cfw:face-annotation ((t (:foreground "#7bdb8852a140"))))
 '(cfw:face-day-title ((t (:foreground "#7bdb8852a140"))))
 '(cfw:face-default-content ((t (:foreground "#5E81AC"))))
 '(cfw:face-default-day ((t (:foreground "#ECEFF4"))))
 '(cfw:face-disable ((t (:foreground "#7bdb8852a140"))))
 '(cfw:face-grid ((t (:foreground "#50925b2c7060"))))
 '(cfw:face-header ((t (:foreground "#BF616A" :weight bold))))
 '(cfw:face-holiday ((t (:foreground "#D08770"))))
 '(cfw:face-periods ((t (:foreground "#5E81AC"))))
 '(cfw:face-saturday ((t (:foreground "#7bdb8852a140" :weight bold))))
 '(cfw:face-select ((t (:background "#434C5E"))))
 '(cfw:face-sunday ((t (:foreground "#7bdb8852a140"))))
 '(cfw:face-title ((t (:height 2.0 :inherit variable-pitch :weight bold :foreground "#7bdb8852a140"))))
 '(cfw:face-today ((t (:background "#434C5E" :weight bold))))
 '(cfw:face-today-title ((t (:background "#BF616A" :foreground "#ECEFF4"))))
 '(cfw:face-toolbar ((t (:inherit default))))
 '(cfw:face-toolbar-button-off ((t (:foreground "#7bdb8852a140"))))
 '(cfw:face-toolbar-button-on ((t (:foreground "#8FBCBB" :weight bold))))
 '(company-scrollbar-bg ((t (:background "#1C2028"))))
 '(company-scrollbar-fg ((t (:background "#50925b2c7060"))))
 '(company-tooltip ((t (:background "#1C2028" :foreground "#7bdb8852a140"))))
 '(company-tooltip-common ((t (:foreground "#BF616A"))))
 '(company-tooltip-mouse ((t (:background "#81A1C1"))))
 '(company-tooltip-selection ((t (:background "#248a29c33434"))))
 '(company-tootip-annotation ((t (:foreground "#8FBCBB"))))
 '(cursor ((t (:background "#BF616A"))))
 '(dired-subtree-depth-1-face ((t (:background nil))))
 '(dired-subtree-depth-2-face ((t (:background nil))))
 '(dired-subtree-depth-3-face ((t (:background nil))))
 '(dired-subtree-depth-4-face ((t (:background nil))))
 '(dired-subtree-depth-5-face ((t (:background nil))))
 '(dired-subtree-depth-6-face ((t (:background nil))))
 '(doom-neotree-data-file-face ((t (:height 1.0 :foreground "#7bdb8852a140"))))
 '(doom-neotree-dir-face ((t (:foreground "#BF616A" :height 1.0))))
 '(doom-neotree-file-face ((t (:height 1.0))))
 '(doom-neotree-hidden-file-face ((t (:height 1.0 :foreground "#50925b2c7060"))))
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
 '(font-lock-comment-face ((t (:foreground "#7bdb8852a140" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "#B48EAD"))))
 '(font-lock-doc-face ((t (:foreground "#7bdb8852a140"))))
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
 '(helm-selection ((t (:background "#248a29c33434"))))
 '(helm-separator ((t (:foreground "#BF616A"))))
 '(highlight ((t (:background "#205324f12e2e" :foreground "#ECEFF4"))))
 '(hl-line ((t (:background "#205324f12e2e"))))
 '(ido-first-match ((t (:foreground "#B48EAD"))))
 '(link ((t (:foreground "#81A1C1"))))
 '(magit-branch-current ((t (:foreground "#B48EAD"))))
 '(magit-branch-local ((t (:foreground "#5E81AC"))))
 '(magit-branch-remote ((t (:foreground "#A3BE8C"))))
 '(magit-diff-added ((t (:background "#2569289322b7" :foreground "#8977ac406bd6"))))
 '(magit-diff-added-highlight ((t (:background "#3222365e2e85" :foreground "#A3BE8C"))))
 '(magit-diff-hunk-heading ((t (:background "#434C5E" :foreground "#7bdb8852a140"))))
 '(magit-diff-hunk-heading-highlight ((t (:background "#434C5E" :foreground "#ECEFF4"))))
 '(magit-diff-lines-heading ((t (:background "#D08770" :weight bold :foreground "#1a001db72525"))))
 '(magit-diff-removed ((t (:background "#2b26292c295c" :foreground "#a95544974e3c"))))
 '(magit-diff-removed-highlight ((t (:background "#383f35ac35eb" :foreground "#BF616A"))))
 '(magit-header-line ((t (:background nil :foreground "#1a001db72525" :box nil))))
 '(magit-log-author ((t (:foreground "#D08770"))))
 '(magit-log-date ((t (:foreground "#5E81AC"))))
 '(magit-section-heading ((t (:foreground "#BF616A"))))
 '(magit-section-heading-selection ((t (:foreground "#EBCB8B"))))
 '(minibuffer-prompt ((t (:foreground "#BF616A"))))
 '(mode-line ((t (:background "#1C2028"))))
 '(mode-line-inactive ((t (:background "#1a001db72525"))))
 '(mu4e-header-highlight-face ((t (:underline nil :background "#248a29c33434"))))
 '(mu4e-header-key-face ((t (:foreground "#7bdb8852a140"))))
 '(mu4e-header-value-face ((t (:foreground "#81A1C1"))))
 '(neo-root-dir-face ((t (:foreground "#ECEFF4" :background "#205324f12e2e" :box (:line-width 6 :color "#205324f12e2e")))))
 '(nlinum-current-line ((t (:foreground "#D08770"))))
 '(org-agenda-current-time ((t (:foreground "#81A1C1"))))
 '(org-agenda-date ((t (:foreground "#7bdb8852a140" :inherit variable-pitch))))
 '(org-agenda-date-today ((t (:height 1.5 :foreground "#BF616A" :inherit variable-pitch))))
 '(org-agenda-date-weekend ((t (:inherit org-agenda-date))))
 '(org-agenda-done ((t (:inherit nil :strike-through t :foreground "#7bdb8852a140"))))
 '(org-agenda-structure ((t (:height 1.3 :foreground "#7bdb8852a140" :weight normal :inherit variable-pitch))))
 '(org-block ((t (:background "#1a001db72525"))))
 '(org-block-begin-line ((t (:background "#1a001db72525"))))
 '(org-block-end-line ((t (:background "#1a001db72525"))))
 '(org-code ((t (:foreground "#D08770"))))
 '(org-date ((t (:foreground "#7bdb8852a140"))))
 '(org-document-info ((t (:foreground "#7bdb8852a140" :slant italic))))
 '(org-document-info-keyword ((t (:foreground "#50925b2c7060"))))
 '(org-document-title ((t (:inherit variable-pitch :height 1.3 :weight normal :foreground "#7bdb8852a140"))))
 '(org-done ((t (:inherit variable-pitch :foreground "#5E81AC" :background "#1a001db72525"))))
 '(org-ellipsis ((t (:underline nil :background "#1a001db72525" :foreground "#50925b2c7060"))))
 '(org-headline-done ((t (:strike-through t))))
 '(org-indent ((t (:inherit org-hide))))
 '(org-level-1 ((t (:inherit variable-pitch :height 1.3 :weight bold :foreground "#BF616A" :background "#1a001db72525"))))
 '(org-level-2 ((t (:inherit variable-pitch :weight bold :height 1.2 :foreground "#7bdb8852a140" :background "#1a001db72525"))))
 '(org-level-3 ((t (:inherit variable-pitch :weight bold :height 1.1 :foreground "#7bdb8852a140" :background "#1a001db72525"))))
 '(org-level-4 ((t (:inherit variable-pitch :weight bold :height 1.1 :foreground "#7bdb8852a140" :background "#1a001db72525"))))
 '(org-level-5 ((t (:inherit variable-pitch :weight bold :height 1.1 :foreground "#7bdb8852a140" :background "#1a001db72525"))))
 '(org-level-6 ((t (:inherit variable-pitch :weight bold :height 1.1 :foreground "#7bdb8852a140" :background "#1a001db72525"))))
 '(org-level-7 ((t (:inherit variable-pitch :weight bold :height 1.1 :foreground "#7bdb8852a140" :background "#1a001db72525"))))
 '(org-level-8 ((t (:inherit variable-pitch :weight bold :height 1.1 :foreground "#7bdb8852a140" :background "#1a001db72525"))))
 '(org-link ((t (:underline nil :weight normal :foreground "#81A1C1"))))
 '(org-list-dt ((t (:foreground "#88C0D0"))))
 '(org-quote ((t (:background "#1a001db72525"))))
 '(org-ref-cite-face ((t (:foreground "#D08770"))))
 '(org-scheduled ((t (:foreground "#7bdb8852a140"))))
 '(org-scheduled-previously ((t (:foreground "#81A1C1"))))
 '(org-scheduled-today ((t (:foreground "#ECEFF4"))))
 '(org-special-keyword ((t (:height 0.9 :foreground "#50925b2c7060"))))
 '(org-table ((t (:background nil :foreground "#7bdb8852a140"))))
 '(org-tag ((t (:foreground "#7bdb8852a140"))))
 '(org-time-grid ((t (:foreground "#50925b2c7060"))))
 '(org-todo ((t (:foreground "#D08770" :background "#1a001db72525"))))
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
 '(show-paren-match ((t (:background "#BF616A" :foreground "#1a001db72525"))))
 '(sldb-restartable-frame-line-face ((t (:foreground "#A3BE8C"))))
 '(slime-repl-inputed-output-face ((t (:foreground "#BF616A"))))
 '(solaire-default-face ((t (:background "#205324f12e2e"))))
 '(solaire-hl-line-face ((t (:background "#205324f12e2e"))))
 '(sp-pair-overlay-face ((t (:background "#205324f12e2e"))))
 '(sp-show-pair-match-face ((t (:background "#50925b2c7060" :foreground "#EBCB8B"))))
 '(sp-wrap-overlay-face ((t (:background "#205324f12e2e"))))
 '(spacemacs-emacs-face ((t (:background "#1a001db72525" :foreground "#ECEFF4"))))
 '(spacemacs-evilified-face ((t (:background "#1a001db72525" :foreground "#ECEFF4"))))
 '(spacemacs-hybrid-face ((t (:background "#1a001db72525" :foreground "#ECEFF4"))))
 '(spacemacs-lisp-face ((t (:background "#1a001db72525" :foreground "#ECEFF4"))))
 '(spacemacs-motion-face ((t (:background "#1a001db72525" :foreground "#ECEFF4"))))
 '(spacemacs-normal-face ((t (:background "#1a001db72525" :foreground "#ECEFF4"))))
 '(spacemacs-visual-face ((t (:background "#1a001db72525" :foreground "#ECEFF4"))))
 '(swiper-line-face ((t (:background "#434C5E" :foreground "#ECEFF4"))))
 '(swiper-match-face-2 ((t (:background "#D08770"))))
 '(tooltip ((t (:foreground "#7bdb8852a140" :background "#1C2028"))))
 '(variable-pitch ((t (:family "Source Sans Pro"))))
 '(vertical-border ((t (:background "#434C5E" :foreground "#434C5E"))))
 '(which-key-command-description-face ((t (:foreground "#8FBCBB"))))
 '(which-key-key-face ((t (:foreground "#A3BE8C")))))
