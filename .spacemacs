;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(octave
     ruby
     yaml
     python
     clojure
     haskell
     rust
     javascript
     sql
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup nil
                      auto-completion-enable-help-tooltip t
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      :disabled-for org)
     better-defaults

     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support t
            )
     cscope

     clojure
     ;; dash
     emacs-lisp
     (git :variables
          git-enable-github-support t)
     (haskell :variables
              haskell-process-type 'stack-ghci
              haskell-completion-backend 'intero)
     html
     ;; (ibuffer :variables
     ;;          ibuffer-group-buffers-by 'projects)
     ;; javascript
     org
     ;; purescript
     ranger
     react
     ;; rust
     ;; (scala :variables
     ;;        scala-use-javadoc-style t)
     (shell :variables
            shell-default-shell 'ansi-term
            shell-default-height 30
            shell-default-position 'bottom)
     semantic
     syntax-checking
     (theming :variables
              theming-headings-inherit-from-default 'all
              theming-headings-same-size 'all)
              ;; theming-headings-bold 'all)

     lsp
     (typescript :variables

                 ;; typescript-backend 'lsp

                 ;; creates a bunch of _flycheck files which cause recompile which breaks watch with TS 3.9
                 typescript-backend 'tide
                 typescript-linter 'eslint

                 typescript-fmt-tool 'prettier
                 ;; typescript-fmt-on-save t
                 )

     ;; platform specific
     osx
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      f
                                      color-theme-approximate
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '( evil-unimpaired )
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         darkokai

                         dracula

                         monokai
                         molokai

                         toxi
                         spolsky

                         soothe
                         spacegray

                         material
                         ;; gotham
                         darktooth
                         gruvbox
                         ;; firebelly
                         ;; labburn
                         ;; gruvbox-dark

                         ;; dakrone        ;; 6
                         ;; cyberpunk      ;; 6
                         ;; cherry-blossom ;; 7

                         ample          ;; 8
                         ample-zen      ;; 8

                         ;; jazz
                         ;; niflheim
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Hack"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 10
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize t
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header t
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 100
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 100
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."
  ;; Restore window position
  ;; (desktop-save-mode 1)

  ;; pin ensime to stable
  ;; (push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer--elpa-archives)
  ;; (push '(ensime . "melpa-stable") package-pinned-packages)

  ;; (setq-default flycheck-scalastylerc "/usr/local/etc/scalastyle_config.xml")

  (setq-default rust-enable-racer t)

  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)

  ;; store all backup and autosave files in the tmp dir
  (setq backup-directory-alist
        `((".*" . ,temporary-file-directory)))
  (setq auto-save-file-name-transforms
        `((".*" ,temporary-file-directory t)))

  ;; do not create lockfiles (.#[name])
  (setq create-lockfiles nil)

  ;; Make haskell mode reset indent
  (defun haskell-indentation-advice ()
    (when (and (< 1 (line-number-at-pos))
               (save-excursion
                 (forward-line -1)
                 (string= "" (s-trim (buffer-substring (line-beginning-position) (line-end-position))))))
      (delete-region (line-beginning-position) (point))))

  (advice-add 'haskell-indentation-newline-and-indent
              :after 'haskell-indentation-advice)

  ;; These seem to cause errors?  I need to hook them?
  ;; (haskell-mode)
  ;; (ac-config-default)
  ;; (add-to-list 'company-backends 'company-ghc)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  (setq powerline-default-separator nil)

  ;; https://github.com/syl20bnr/spacemacs/issues/5435
  ;; This problem may be related with wid-edit.el and mouse-1-click-follows-link.
  (add-hook 'spacemacs-buffer-mode-hook (lambda ()
                                          (set (make-local-variable 'mouse-1-click-follows-link) nil)))

  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
  (add-hook 'typescript-mode-hook (lambda () (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))) t)

  ;; does this do anything?
  ;; (global-set-key (kbd "<ESC>") 'evil-escape)

  (setq-default
   dotspacemacs-mode-line-unicode-symbols nil

   require-final-newline t

   evil-want-C-i-jump t

   avy-all-windows 'all-frames

   ranger-override-dired t
   ranger-show-dotfiles t

   which-key-idle-secondary-delay nil

   spaceline-buffer-encoding-abbrev-p nil
   spaceline-version-control-p nil
   spaceline-workspace-numbers-unicode nil
   spaceline-window-numbers-unicode nil

   ;; other stuff
   global-hl-line-mode t
   global-linum-mode t

   helm-mode t

   semantic-mode 1

   tab-width 2

   indent-tabs-mode nil

   ;; Clojure don't show error buffer on errors
   cider-show-error-buffer nil

   company-dabbrev-code-ignore-case t
   company-dabbrev-ignore-case t
   company-etags-ignore-case t

   js2-basic-offset 2
   js-indent-level 2

   company-idle-delay 0.08)

  (global-flycheck-mode)
  (global-company-mode)

  (setq tab-width 2)

  ;; Better SPC-p-f projectile finding
  ;; (spacemacs-base/init-helm-projectile)

  ;; Changes SPC-SPC to timeout search
  ;; (spacemacs/set-leader-keys "SPC" 'avy-goto-char-timer)

  ;; Allows for type showing w/ ghc-mod, without ghci-ng
  (spacemacs/set-leader-keys-for-major-mode 'haskell-mode
    "mht"  'ghc-show-type)

  (color-theme-approximate-on)
  (evil-declare-not-repeat `write-file)
  (evil-declare-not-repeat `evil-write)

  (add-to-list 'write-file-functions 'delete-trailing-whitespace)

  (setq
   company-dabbrev-code-ignore-case t
   company-dabbrev-ignore-case t
   company-etags-ignore-case t)


  ;; control right/left arrow
  ;; (define-key evil-insert-state-map (kbd "C-right") 'evil-forward-word)
  ;; (define-key evil-insert-state-map (kbd "C-left") 'evil-backward-word)
  )


;; '(company-backends
;;   (quote
;;    (company-tide company-capf company-files
;;                  (company-dabbrev-code company-gtags company-etags company-keywords)
;;                  company-oddmuse company-dabbrev)))


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-term-color-vector
   [unspecified "#151718" "#CE4045" "#9FCA56" "#DCCD69" "#55B5DB" "#A074C4" "#55B5DB" "#D4D7D6"] t)
 '(company-backends
   (quote
    ((company-tide company-files)
     company-semantic company-files
     (company-gtags company-etags company-keywords))))
 '(company-dabbrev-code-ignore-case t)
 '(company-dabbrev-ignore-case t)
 '(company-etags-ignore-case t)
 '(company-ghc-show-info t)
 '(company-idle-delay 0.1)
 '(eclim-executable "/Applications/Eclipse.app/Contents/Eclipse/eclim")
 '(eclimd-default-workspace "~/beam/eclimd-workspace")
 '(eclimd-executable "/Applications/Eclipse.app/Contents/Eclipse/eclimd")
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-character-color "#202020")
 '(flycheck-pos-tip-timeout 20)
 '(fringe-mode 4 nil (fringe))
 '(global-vi-tilde-fringe-mode nil)
 '(haskell-process-suggest-remove-import t)
 '(helm-buffers-fuzzy-matching t)
 '(helm-recentf-fuzzy-match t)
 '(hl-sexp-background-color "#1c1f26")
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(mac-drawing-use-gcd t)
 '(magit-commit-arguments (quote ("--allow-empty" "--verbose")))
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style (quote chamfer))
 '(package-selected-packages
   (quote
    (gntp org-mime parent-mode gitignore-mode flx ghub let-alist web-completion-data pos-tip peg eval-sexp-fu epl popup goto-chg org-category-capture ghc diminish log4e winum unfill fuzzy sublime-themes toxi-theme spacegray-theme soothe-theme reverse-theme color-theme-sanityinc-tomorrow grandshell-theme color-theme-sanityinc-tomorrow-night-theme color-theme-sanityinc-tomorrow-theme molokai-theme psci purescript-mode psc-ide evil avy ample-zen-theme ample-theme material-theme simple-httpd json-snatcher json-reformat dash-functional packed bind-key tern alert haml-mode mmm-mode markdown-toc markdown-mode gh-md powerline hydra seq spinner company bind-map request skewer-mode company-emacs-eclim eclim noflet ensime sbt-mode scala-mode org pcache auto-complete highlight gruvbox-dark-theme rust-mode dash sql-indent pug-mode hide-comnt anzu yasnippet magit-popup async f web-mode racer persp-mode org-plus-contrib neotree macrostep js2-refactor intero help-fns+ helm-themes helm-projectile helm-ag haskell-snippets flycheck-rust evil-mc eshell-prompt-extras cmake-mode clj-refactor cider auto-yasnippet ace-window ace-link ace-jump-helm-line iedit smartparens undo-tree haskell-mode helm helm-core projectile magit git-commit with-editor js2-mode s typescript-mode flycheck xterm-color ws-butler window-numbering which-key web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toml-mode toc-org tide tagedit stickyfunc-enhance srefactor spacemacs-theme spaceline smeargle slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder restart-emacs ranger rainbow-delimiters queue quelpa popwin pkg-info pcre2el pbcopy paredit paradox osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro org-download org-bullets open-junk-file mwim multiple-cursors multi-term move-text magit-gitflow lorem-ipsum livid-mode linum-relative link-hint less-css-mode launchctl labburn-theme json-mode js-doc jade-mode info+ inflections indent-guide ido-vertical-mode ibuffer-projectile hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation helm-swoop helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet gruvbox-theme gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link flycheck-pos-tip flycheck-haskell flx-ido firebelly-theme fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eshell-z esh-help emmet-mode elisp-slime-nav edn dumb-jump disaster dash-at-point darktooth-theme darkokai-theme dakrone-theme company-web company-tern company-statistics company-quickhelp company-ghci company-ghc company-cabal company-c-headers column-enforce-mode color-theme-approximate coffee-mode cmm-mode clojure-snippets clojure-mode clean-aindent-mode clang-format cider-eval-sexp-fu cargo auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ac-ispell)))
 '(powerline-color1 "#1E1E1E")
 '(powerline-color2 "#111111")
 '(psc-ide-add-import-on-completion t t)
 '(psc-ide-rebuild-on-save nil t)
 '(rainbow-identifiers-choose-face-function (quote rainbow-identifiers-cie-l*a*b*-choose-face) t)
 '(rainbow-identifiers-cie-l*a*b*-color-count 1024 t)
 '(rainbow-identifiers-cie-l*a*b*-lightness 80 t)
 '(rainbow-identifiers-cie-l*a*b*-saturation 25 t)
 '(standard-indent 2)
 '(tide-tsserver-executable "/Users/gm/.nvm/versions/node/v8.6.0/bin/tsserver")
 '(tooltip-mode nil)
 '(typescript-indent-level 2)
 '(web-mode-attr-indent-offset 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(which-key-idle-delay 0.4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#f8fbfc" :background "#242728")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C"))))
 '(company-tooltip-annotation-selection ((t (:background "#66d9ef"))))
 '(font-latex-sectioning-0-face ((t (:inherit default :height 1.0))))
 '(font-latex-sectioning-1-face ((t (:inherit default :height 1.0))))
 '(font-latex-sectioning-2-face ((t (:inherit default :height 1.0))))
 '(font-latex-sectioning-3-face ((t (:inherit default :height 1.0))))
 '(font-latex-sectioning-4-face ((t (:inherit default :height 1.0))))
 '(font-latex-sectioning-5-face ((t (:inherit default :height 1.0))))
 '(font-latex-slide-title-face ((t (:inherit default :height 1.0))))
 '(helm-prefarg ((t (:foreground "PaleGreen"))))
 '(info-title-1 ((t (:inherit default :height 1.0 :weight bold))))
 '(info-title-2 ((t (:inherit default :height 1.0 :weight bold))))
 '(info-title-3 ((t (:inherit default :height 1.0 :weight bold))))
 '(info-title-4 ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face ((t (:inherit default :height 1.0))))
 '(markdown-header-face-1 ((t (:inherit default :height 1.0))))
 '(markdown-header-face-2 ((t (:inherit default :height 1.0))))
 '(markdown-header-face-3 ((t (:inherit default :height 1.0))))
 '(markdown-header-face-4 ((t (:inherit default :height 1.0))))
 '(markdown-header-face-5 ((t (:inherit default :height 1.0))))
 '(markdown-header-face-6 ((t (:inherit default :height 1.0))))
 '(org-document-title ((t (:inherit default :height 1.0))))
 '(org-level-1 ((t (:inherit default :height 1.0))))
 '(org-level-2 ((t (:inherit default :height 1.0))))
 '(org-level-3 ((t (:inherit default :height 1.0))))
 '(org-level-4 ((t (:inherit default :height 1.0))))
 '(org-level-5 ((t (:inherit default :height 1.0))))
 '(org-level-6 ((t (:inherit default :height 1.0))))
 '(org-level-7 ((t (:inherit default :height 1.0))))
 '(org-level-8 ((t (:inherit default :height 1.0))))
 '(spacemacs-transient-state-title-face ((t (:background nil :foreground nil :inherit font-lock-warning-face))))
 '(term ((t (:foreground nil :background nil))))
 '(web-mode-html-tag-bracket-face ((t (:inherit web-mode-html-tag-face :foreground nil)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-term-color-vector
   [unspecified "#151718" "#CE4045" "#9FCA56" "#DCCD69" "#55B5DB" "#A074C4" "#55B5DB" "#D4D7D6"] t)
 '(company-backends
   '((company-tide company-files)
     company-semantic company-files
     (company-gtags company-etags company-keywords)))
 '(company-dabbrev-code-ignore-case t)
 '(company-dabbrev-ignore-case t)
 '(company-etags-ignore-case t)
 '(company-ghc-show-info t)
 '(company-idle-delay 0.1)
 '(eclim-executable "/Applications/Eclipse.app/Contents/Eclipse/eclim")
 '(eclimd-default-workspace "~/beam/eclimd-workspace")
 '(eclimd-executable "/Applications/Eclipse.app/Contents/Eclipse/eclimd")
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-character-color "#202020")
 '(flycheck-pos-tip-timeout 20)
 '(fringe-mode 4 nil (fringe))
 '(global-vi-tilde-fringe-mode nil)
 '(haskell-process-suggest-remove-import t)
 '(helm-buffers-fuzzy-matching t)
 '(helm-recentf-fuzzy-match t)
 '(hl-sexp-background-color "#1c1f26")
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(mac-drawing-use-gcd t)
 '(magit-commit-arguments '("--allow-empty" "--verbose"))
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style 'chamfer)
 '(package-selected-packages
   '(yapfify yaml-mode pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc helm-cscope xcscope transient cython-mode company-anaconda lv sesman parseedn parseclj a anaconda-mode pythonic gntp org-mime parent-mode gitignore-mode flx ghub let-alist web-completion-data pos-tip peg eval-sexp-fu epl popup goto-chg org-category-capture ghc diminish log4e winum unfill fuzzy sublime-themes toxi-theme spacegray-theme soothe-theme reverse-theme color-theme-sanityinc-tomorrow grandshell-theme color-theme-sanityinc-tomorrow-night-theme color-theme-sanityinc-tomorrow-theme molokai-theme psci purescript-mode psc-ide evil avy ample-zen-theme ample-theme material-theme simple-httpd json-snatcher json-reformat dash-functional packed bind-key tern alert haml-mode mmm-mode markdown-toc markdown-mode gh-md powerline hydra seq spinner company bind-map request skewer-mode company-emacs-eclim eclim noflet ensime sbt-mode scala-mode org pcache auto-complete highlight gruvbox-dark-theme rust-mode dash sql-indent pug-mode hide-comnt anzu yasnippet magit-popup async f web-mode racer persp-mode org-plus-contrib neotree macrostep js2-refactor intero help-fns+ helm-themes helm-projectile helm-ag haskell-snippets flycheck-rust evil-mc eshell-prompt-extras cmake-mode clj-refactor cider auto-yasnippet ace-window ace-link ace-jump-helm-line iedit smartparens undo-tree haskell-mode helm helm-core projectile magit git-commit with-editor js2-mode s typescript-mode flycheck xterm-color ws-butler window-numbering which-key web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toml-mode toc-org tide tagedit stickyfunc-enhance srefactor spacemacs-theme spaceline smeargle slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder restart-emacs ranger rainbow-delimiters queue quelpa popwin pkg-info pcre2el pbcopy paredit paradox osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro org-download org-bullets open-junk-file mwim multiple-cursors multi-term move-text magit-gitflow lorem-ipsum livid-mode linum-relative link-hint less-css-mode launchctl labburn-theme json-mode js-doc jade-mode info+ inflections indent-guide ido-vertical-mode ibuffer-projectile hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation helm-swoop helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet gruvbox-theme gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link flycheck-pos-tip flycheck-haskell flx-ido firebelly-theme fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eshell-z esh-help emmet-mode elisp-slime-nav edn dumb-jump disaster dash-at-point darktooth-theme darkokai-theme dakrone-theme company-web company-tern company-statistics company-quickhelp company-ghci company-ghc company-cabal company-c-headers column-enforce-mode color-theme-approximate coffee-mode cmm-mode clojure-snippets clojure-mode clean-aindent-mode clang-format cider-eval-sexp-fu cargo auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ac-ispell))
 '(powerline-color1 "#1E1E1E")
 '(powerline-color2 "#111111")
 '(projectile-globally-ignored-directories
   '(".idea" ".vscode" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" ".ccls-cache" ".cache" ".clangd" "build" "automation-tests"))
 '(psc-ide-add-import-on-completion t t)
 '(psc-ide-rebuild-on-save nil t)
 '(rainbow-identifiers-choose-face-function 'rainbow-identifiers-cie-l*a*b*-choose-face t)
 '(rainbow-identifiers-cie-l*a*b*-color-count 1024 t)
 '(rainbow-identifiers-cie-l*a*b*-lightness 80 t)
 '(rainbow-identifiers-cie-l*a*b*-saturation 25 t)
 '(standard-indent 2)
 '(tide-tsserver-executable "/Users/gm/.config/yarn/global/node_modules/.bin/tsserver")
 '(tooltip-mode nil)
 '(typescript-indent-level 2)
 '(web-mode-attr-indent-offset 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(which-key-idle-delay 0.4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#f8fbfc" :background "#242728")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C"))))
 '(company-tooltip-annotation-selection ((t (:background "#66d9ef"))))
 '(font-latex-sectioning-0-face ((t (:inherit default :height 1.0))))
 '(font-latex-sectioning-1-face ((t (:inherit default :height 1.0))))
 '(font-latex-sectioning-2-face ((t (:inherit default :height 1.0))))
 '(font-latex-sectioning-3-face ((t (:inherit default :height 1.0))))
 '(font-latex-sectioning-4-face ((t (:inherit default :height 1.0))))
 '(font-latex-sectioning-5-face ((t (:inherit default :height 1.0))))
 '(font-latex-slide-title-face ((t (:inherit default :height 1.0))))
 '(helm-prefarg ((t (:foreground "PaleGreen"))))
 '(info-title-1 ((t (:inherit default :height 1.0 :weight bold))))
 '(info-title-2 ((t (:inherit default :height 1.0 :weight bold))))
 '(info-title-3 ((t (:inherit default :height 1.0 :weight bold))))
 '(info-title-4 ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face ((t (:inherit default :height 1.0))))
 '(markdown-header-face-1 ((t (:inherit default :height 1.0))))
 '(markdown-header-face-2 ((t (:inherit default :height 1.0))))
 '(markdown-header-face-3 ((t (:inherit default :height 1.0))))
 '(markdown-header-face-4 ((t (:inherit default :height 1.0))))
 '(markdown-header-face-5 ((t (:inherit default :height 1.0))))
 '(markdown-header-face-6 ((t (:inherit default :height 1.0))))
 '(org-document-title ((t (:inherit default :height 1.0))))
 '(org-level-1 ((t (:inherit default :height 1.0))))
 '(org-level-2 ((t (:inherit default :height 1.0))))
 '(org-level-3 ((t (:inherit default :height 1.0))))
 '(org-level-4 ((t (:inherit default :height 1.0))))
 '(org-level-5 ((t (:inherit default :height 1.0))))
 '(org-level-6 ((t (:inherit default :height 1.0))))
 '(org-level-7 ((t (:inherit default :height 1.0))))
 '(org-level-8 ((t (:inherit default :height 1.0))))
 '(spacemacs-transient-state-title-face ((t (:background nil :foreground nil :inherit font-lock-warning-face))))
 '(term ((t (:foreground nil :background nil))))
 '(web-mode-html-tag-bracket-face ((t (:inherit web-mode-html-tag-face :foreground nil)))))
)
