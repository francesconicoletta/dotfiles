;; ------------------------------
;; Package Management & Use-Package
;; ------------------------------
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Ensure use-package is installed for clean package configuration.
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t) ; Automatically install missing packages

;; ------------------------------
;; General UI & Behavior Settings
;; ------------------------------

;; Disable the bell
(setq ring-bell-function 'ignore)

;; Soft wrap
(global-visual-line-mode t)

;; Remove tool-bar buttons
(tool-bar-mode -1)

;; Display line numbers globally
(global-display-line-numbers-mode t)

;; Theme & Fonts (using your custom font and Modus Operandi theme)
(load-theme 'modus-operandi t)

;; Centralized storage for backups and autosaves
(setq backup-directory-alist `((".*" . "~/.emacs.d/tmp/backup")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/tmp/autosave/" t)))
(make-directory "~/.emacs.d/tmp/backup" t)
(make-directory "~/.emacs.d/tmp/autosave" t)

;; Enable desktop-save-mode with lazy restoration
(setq desktop-lazy-restore t          ; Restore desktop buffers lazily
      desktop-restore-eager 5)         ; Restore 5 buffers immediately (adjust as needed)
;; Reopen session after closing Emacs
(desktop-save-mode 1)

;; ------------------------------
;; Org Mode Configuration
;; ------------------------------
;; Create and define Org directories
(make-directory "~/Documents/org/" t)
(setq org-directory "~/Documents/org/")
(setq org-agenda-files (directory-files-recursively org-directory "\\.org$"))

;; Org mode display & task management
(setq org-columns-default-format "%50ITEM(Task) %10CLOCKSUM %16TIMESTAMP_IA")
(setq org-todo-keywords
      '((sequence "TODO(t)" "IN-PROGRESS(p)" "WAITING(w@/!)" "|" "DONE(d!)" "CANCELLED(c@)")))
(setq org-todo-keyword-faces
      '(("TODO" . "red")
        ("IN-PROGRESS" . "orange")
        ("WAITING" . "yellow")
        ("DONE" . "green")
        ("CANCELLED" . "gray")))
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(setq org-startup-indented t)

;; Org keybindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c b") 'org-iswitchb)

;; ------------------------------
;; Which-Key Configuration
;; ------------------------------
(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.5))

;; ------------------------------
;; Helm Configuration
;; ------------------------------
(use-package helm
  :config
  (helm-mode 1)
  ;; Keybindings for helm
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks))

;; ------------------------------
;; Magit Configuration
;; ------------------------------
(use-package magit
  :bind ("C-x g" . magit-status))

;; ------------------------------
;; Projectile & Projectile-Ripgrep Configuration
;; ------------------------------
(use-package projectile
  :config
  (projectile-mode +1)
  (setq projectile-project-search-path '("~/Developer"))
  (projectile-discover-projects-in-search-path)
  ;; Keybindings for projectile
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map) ; macOS
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map) ; Windows/Linux
  (setq projectile-indexing-method 'alien)
  (setq projectile-enable-caching t))

(use-package projectile-ripgrep
  :after projectile
  :bind (:map projectile-mode-map
              ("C-c p s r" . projectile-ripgrep)))

;; ------------------------------
;; Company Configuration (for LSP completions)
;; ------------------------------
(use-package company
  :config
  (global-company-mode 1)
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0))

;; ------------------------------
;; Yasnippet Configuration
;; ------------------------------
(use-package yasnippet
  :hook ((text-mode prog-mode conf-mode snippet-mode) . yas-minor-mode-on)
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets")))

;; ------------------------------
;; Flycheck Configuration
;; ------------------------------
(use-package flycheck
  :init (global-flycheck-mode))

;; ------------------------------
;; Evil configuration
;; ------------------------------
(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t      ;; Enable Vim-like scrolling with C-u
        evil-want-C-i-jump t        ;; Enable jump list with C-i
        evil-want-Y-yank-to-eol t   ;; Make Y behave like D (yank to end of line)
        evil-want-fine-undo t       ;; More granular undo (like Vim)
        evil-want-keybinding nil)   ;; Avoid conflicts with evil-collection
  :config
  (global-set-key (kbd "C-c e") 'evil-mode)  ;; Toggle Evil mode with C-c e
  (evil-mode 0))  ;; Don't enable by default

;; Improve Evil integration with many Emacs packages (Magit, Dired, etc.).
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))
