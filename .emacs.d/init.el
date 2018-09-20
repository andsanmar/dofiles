;;; package --- Summary:
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list
   'package-archives
   '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t))

(package-initialize)

;;(desktop-save-mode 1)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; (use-package powerline
;;   :ensure t
;;   :config (powerline-default-theme))

;; Rainbow delimeters
(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  )

;; Rainbow mode
(use-package rainbow-mode
  :ensure t
  :mode "\\.css\\'"
  )


;; Remove initial buffer
(setq inhibit-startup-screen t)

;; SmartParents
(use-package smartparens
  :ensure t
  :init (smartparens-global-mode t))

;; Auto complete
(use-package auto-complete
  :ensure t
  :config (ac-config-default))

;; Flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; Elpy
(use-package elpy
  :ensure t
  :config (elpy-enable)
  )

;; Haskell
(use-package haskell-mode
  :ensure t)

;; Magit
(use-package magit
  :ensure t
  :bind (("C-c g" . magit-status)
	 ("C-x M-g" . magit-dispatch-popup)))

;; Multiple cursors
(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this))
  )

;; Undo
(use-package undo-tree
  :ensure t
  :init
  (defalias 'redo 'undo-tree-redo)
  :config
  (global-undo-tree-mode 1)
  (global-set-key (kbd "C-z") 'undo)
  (global-set-key (kbd "C-S-z") 'redo)
  )

(global-hl-line-mode 1)

;; Spaceline all-the-icons
(require 'spaceline-all-the-icons)
(setq spaceline-all-the-icons-separator-type 'none)
(spaceline-all-the-icons-theme)
(spaceline-all-the-icons--setup-neotree)
(spaceline-toggle-all-the-icons-projectile-off)
(spaceline-toggle-all-the-icons-buffer-path-off)
(spaceline-toggle-all-the-icons-hud-off)
(spaceline-toggle-all-the-icons-time-off)
(spaceline-toggle-all-the-icons-buffer-position-on)

;; ;; Golden Ratio
;; (require 'golden-ratio)
;; (golden-ratio-mode 1)

;; Rust
(setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
(setq racer-rust-src-path "~/.doc/rust/src") ;; Rust source code PATH
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
(add-hook 'racer-mode-hook #'company-mode)
(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

;; Search improved
(setq completion-ignore-case  t)
(setq read-file-name-completion-ignore-case  t)
(setq read-buffer-completion-ignore-case  t)

;; smex
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
					; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Clean buffers
(defun kill-buffers()
  (let (buffer buffers)
    (setq buffers (buffer-list))
    (dotimes (i (length buffers))
      (setq buffer (pop buffers))
      (if (not (string-equal (buffer-name buffer) "*scratch*")) (kill-buffer buffer) nil))))

(defun clean-buffers()
       (interactive)
       (if (yes-or-no-p "Do you really want to clean all buffers? ")
           (kill-buffers) nil))

(global-set-key (kbd "C-x C-k") 'clean-buffers)

(provide 'clean-buffers)

;; I LOVE this ccommand
(global-set-key (kbd "C-c C-v") 'undo-tree-visualize)
(global-set-key (kbd "<f2>") 'undo-tree-visualize)
(global-set-key (kbd "<f5>") 'buffer-menu)
;;; init.el ends here


;;; Commentary:
;;; Code:

					; @begin(93709509)@ - Do not edit these lines - added automatically!

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(if (file-exists-p "~/.ciaoroot/master/ciao_emacs/elisp/ciao-site-file.el")
    (load-file "~/.ciaoroot/master/ciao_emacs/elisp/ciao-site-file.el"))
					; @end(93709509)@ - End of automatically added lines.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#1b182c" :foreground "#cbe3e7" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 122 :width normal :foundry "CYRE" :family "Inconsolata")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (challenger-deep)))
 '(custom-safe-themes
   (quote
    ("a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "f71859eae71f7f795e734e6e7d178728525008a28c325913f564a42f74042c31" default)))
 '(package-selected-packages
   (quote
    (select-themes use-package undo-tree tabbar sudo-edit stack-mode spaceline-all-the-icons smex smartparens rust-playground rainbow-mode rainbow-delimiters pdf-tools ob-prolog neotree multiple-cursors multi-term material-theme magit kooten-theme hideshow-org flycheck-rust emojify elpy doom-themes color-theme-sanityinc-tomorrow challenger-deep-theme cargo badwolf-theme autothemer all-the-icons-ivy all-the-icons-gnus all-the-icons-dired ac-racer))))
