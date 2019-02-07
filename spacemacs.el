;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
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
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     typescript
     octave
     python
     yaml
     javascript
     docker
     react
     osx
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (auto-completion :variables
                      auto-completion-return-key-behavior nil
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-enable-help-tooltip t)
     ;; better-defaults
     emacs-lisp
     git
     markdown
     (org :variables
          org-enable-github-support t)
     (shell :variables
            shell-default-shell 'eshell
            shell-default-position 'bottom)
     (spell-checking :variables =enable-flyspell-auto-completion= t)
     syntax-checking
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(eslint-fix rainbow-mode editorconfig mocha string-inflection)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

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
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
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
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
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
   dotspacemacs-whitespace-cleanup nil
   ))

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
you should place your code here."

  ;; from https://github.com/syl20bnr/spacemacs/blob/develop/layers/%2Bspacemacs/spacemacs-editing/packages.el
  (defun spacemacs-editing/init-string-inflection ()
    (use-package string-inflection
      :init
      (progn
        (spacemacs|define-transient-state string-inflection
          :title "String Inflection Transient State"
          :doc "\n [_i_] cycle"
          :bindings
          ("i" string-inflection-all-cycle))
        (spacemacs/declare-prefix "xi" "inflection")
        (spacemacs/set-leader-keys
          "xic" 'string-inflection-lower-camelcase
          "xiC" 'string-inflection-camelcase
          "xii" 'spacemacs/string-inflection-transient-state/body
          "xi-" 'string-inflection-kebab-case
          "xik" 'string-inflection-kebab-case
          "xi_" 'string-inflection-underscore
          "xiu" 'string-inflection-underscore
          "xiU" 'string-inflection-upcase))))

  (setq projectile-project-search-path '("/Volumes/Dev/"))
  (setq projectile-switch-project-action 'magit-status)
  (setq delete-by-moving-to-trash nil) ;; trash is evil

  (use-package compile
    :config

    (defcustom
      compose-service-file
      nil
      "The path to docker-compose.yml"
      :type string-chars-consed)
    (setq compose-service-file "/Volumes/Dev/dev-env/docker-compose.yml")

    (defcustom
      compose-service-name
      nil
      "The docker-compose service name"
      :type string-chars-consed)

    (defun jest-walk-up-to-it (node)
      "Recursively walk up the ast from the js2-node NODE.
Stops when we find a call node named 'describe' or 'it' or reach the root.
If we find the name node we are looking for, return the first argument of the call node.
If we reach the root without finding what we are looking for return nil."
      (if (and (js2-node-p node) (not (js2-ast-root-p node)))
          (if (and
               ;; If the node is an expression or statement
               (js2-expr-stmt-node-p node)
               ;; And the expression is a function calL
               (js2-call-node-p (js2-expr-stmt-node-expr node))
               ;; And the call target is a name node
               (js2-name-node-p (js2-call-node-target (js2-expr-stmt-node-expr node)))
               ;; And the name of the name node is what we are looking for
               (member (js2-name-node-name (js2-call-node-target (js2-expr-stmt-node-expr node)))
                       '("describe" "id")))
              ;; Get the first argument, check it is a string and return its value
              (let ((first-arg (car (js2-call-node-args (js2-expr-stmt-node-expr node)))))
                (if (js2-string-node-p first-arg)
                    (js2-string-node-value first-arg)
                  nil))
            (jest-walk-up-to-it (js2-node-parent-stmt node)))
        nil))

    (defun jest-find-current-test ()
      "Try to find the innermost 'describe' or 'it' using js2-mode.

When a 'describe' or 'it' is found, return the first argument of that call.
If js2-mode is not enabled in the buffer, returns nil.
If there is no wrapping 'describe' or 'it' found, return nil."
      (let ((node (js2-node-at-point nil t)))
        (jest-walk-up-to-it node)))

    ;; TODO: handle jest's console.* indicators
    ;; TODO: handle jest's test suite indicators:  FAIL  apps/data-collector/handlers/__tests__/javascriptPayload.test.js (14.78s)

    (defvar node-error-regexp
      "^[  ]+at \\(?:[^\(\n]+ \(\\)?\\(\\(?:[a-zA-Z]:\\)?[a-zA-Z\.0-9_/\\-]+\\):\\([0-9]+\\):\\([0-9]+\\)\)?"
      "Regular expression to match NodeJS errors.
From http://benhollis.net/blog/2015/12/20/nodejs-stack-traces-in-emacs-compilation-mode/")

    (defvar node-error-regexp-alist
      `((,node-error-regexp 1 2 3 nil 1)))

    (defun jest-test-filter ()
      "Filter function for compilation output."
      (ansi-color-apply-on-region compilation-filter-start (point-max))
      (save-excursion
        (while (re-search-forward "^[\\[[0-9]+[a-z]" nil t)
          (replace-match ""))))

    (define-compilation-mode jest-test-mode "Jest Test"
      "Jest test mode."
      (progn
        (set (make-local-variable 'compilation-error-regexp-alist) node-error-regexp-alist)
        (add-hook 'compilation-filter-hook 'jest-test-filter nil t)
        ))

    ;; test configuration
    (defun jest-run (compose-file service debug jest-args &optional test-suite test)
      "Run jest in a compilation buffer"

      (let* ((file (if (eq test-suite nil) nil (file-relative-name test-suite (projectile-project-root))))
             (debug-flag (if (eq debug t) "-n --inspect=0.0.0.0:9230" ""))
             (test-flag (if (eq test nil) "" (concat " -t \"" test "\"")))
             (compose-file-flag (if (eq compose-file nil) "" (concat "-f " compose-file)))
             (command (concat "docker-compose " compose-file-flag " exec -e TERM=$TERM " service " npx " debug-flag " jest --colors " jest-args " " file test-flag))
             ;; (command (concat "env && echo container && docker exec -t " container " env"))
             )
        (compile command 'jest-test-mode)))

    (defun jest-test-project ()
      "Test the current project."
      (interactive)
      (jest-run compose-service-file compose-service-name nil nil))

    (defun jest-test-file ()
      "Test the current file"
      (interactive)
      (jest-run compose-service-file compose-service-name nil nil (buffer-file-name)))

    (defun jest-test-file-debug ()
      "Test the current file"
      (interactive)
      (jest-run compose-service-file compose-service-name t nil (buffer-file-name)))

    (defun jest-test-file-snapshot ()
      "Test the current file"
      (interactive)
      (jest-run compose-service-file compose-service-name nil "-u" (buffer-file-name)))

    (defun jest-test-file-coverage ()
      "Test the current file"
      (interactive)
      (jest-run compose-service-file compose-service-name nil "--coverage" (buffer-file-name)))

    (defun jest-test-at-point ()
      "Test the current test"
      (interactive)
      (jest-run compose-service-file compose-service-name nil nil (buffer-file-name) "rotates format"))
    )

  ;; Use eslint from node_modules when available
  ;; https://gist.github.com/julianusti/83646d8c147f62825e6eed1eba087110
  (defun my/eslint-path ()
    (let ((root (locate-dominating-file
                 (or (buffer-file-name) default-directory)
                 (lambda (dir)
                   (let ((eslint (expand-file-name "node_modules/eslint/bin/eslint.js" dir)))
                     (and eslint (file-executable-p eslint)))))))
      (if root (expand-file-name "node_modules/eslint/bin/eslint.js" root) "eslint")))

  ;; docker shortcuts
  (setq active-docker-container "dev-env_decision-engine_1")
  (defun eshell/dl (&optional name tail follow)
    "Show the logs from a docker container"
    (eshell-command "echo hello")
    )

  (defun d-logs (&optional name tail follow)
    "Show the logs from a docker container"
    (interactive)
    (start-process "docker-logs" "*Logs*" "sh" "-c" (format "docker logs %s --tail %s %s | bunyan" name tail (if follow "-f"))))
  ;; (start-process "docker-logs" "*Logs*" "docker" "logs" name "--tail" tail (if follow "-f")))
  ;; (async-shell-command (format "docker logs %s %s --tail %s" name (if follow "-f" "") tail)))

  (defun my/docker-logs (&optional tail follow container-name)
    "Show the logs from container NAME. If FOLLOW is set, run in `async-shell-command'."
    ;; (interactive (list (docker-container-read-name)))
    (let (
          (should-follow (or follow (and (booleanp tail) tail)))
          (name (if container-name container-name active-docker-container))
          )
      (let ((tail-length (if (numberp tail) tail (if should-follow 0 10))))
        (if follow
            (async-shell-command (format "%s logs --tail %s -f %s" docker-command tail-length name) (format "* docker logs %s *" name))
          (docker-utils-with-buffer (format "logs %s" name)
                                    (insert (docker-run "logs" name "--tail" tail-length)))))
      ))



  ;; Use eslint from node_modules when available
  ;; https://gist.github.com/julianusti/83646d8c147f62825e6eed1eba087110
  (when (and (memq window-system '(mac ns))
             (require 'exec-path-from-shell nil t))
    ;; (setq exec-path-from-shell-debug t)
    (exec-path-from-shell-initialize)
    (exec-path-from-shell-copy-envs '("LANG" "LC_ALL"))
    (message "Initialized PATH and other variables from SHELL."))

  (add-hook 'flycheck-mode-hook (lambda () (setq-local flycheck-javascript-eslint-executable (my/eslint-path))))
  (add-hook 'js2-mode-hook (lambda ()
                             (setq-local eslint-fix-executable (my/eslint-path))
                             (add-hook 'after-save-hook 'eslint-fix nil t)
                             ))
  (add-hook 'react-mode-hook (lambda ()
                             (setq-local eslint-fix-executable (my/eslint-path))
                             (add-hook 'after-save-hook 'eslint-fix nil t)
                             ))

  (add-hook 'js2-mode-hook 'rainbow-mode)
  (add-hook 'react-mode-hook 'rainbow-mode)
  (add-hook 'typescript-mode-hook (lambda ()
                                    (setq-local flycheck-typescript-tslint-executable (concat (projectile-project-root) "node_modules/.bin/tslint"))
                                    ))

  ;; Disable this because we use eslint instead
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)
  (editorconfig-mode 1)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (tide typescript-mode string-inflection mocha reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl context-coloring treepy graphql editorconfig yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic ox-gfm rainbow-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data dockerfile-mode docker tablist docker-tramp let-alist evil-ediff xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help helm-company helm-c-yasnippet fuzzy company-tern dash-functional tern company-statistics company auto-yasnippet ac-ispell auto-complete eslint-fix yaml-mode smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mmm-mode markdown-toc markdown-mode magit-gitflow htmlize helm-gitignore gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit ghub with-editor diff-hl auto-dictionary web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js2-mode js-doc coffee-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(safe-local-variable-values
   (quote
    ((compose-service-name . "precog-ba-data-collector")
     (compose-service-name . "decision-ai-decision-engine")
     (compose-service-name . "precog-ba-external-api")
     (compose-service-name . "klepto")
     (compose-service-name . "adaptive-id-external-api")
     (docker-container-name . "dev-env_adaptive-id-external-api_1_77f9175ba5c4")
     (docker-container-name . "dev-env_adaptive-id-external-api_1")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
