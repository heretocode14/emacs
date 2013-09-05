(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'brightscript-mode)
(require 'php-mode)

;; binding my own key combos
; similar to vim's o 
(global-set-key (kbd "C-c o") (lambda()
	(interactive)
	(move-end-of-line nil)
	(newline nil)
	(indent-for-tab-command)))

; similar to vim's O
(global-set-key (kbd "C-c O") (lambda()
	(interactive)
	(move-beginning-of-line nil)
	(newline nil)
	(previous-line nil)))

;; line numbers
(global-linum-mode t)

;; Nicer buffer switching
(iswitchb-mode 1)
(setq iswitchb-buffer-ignore '("^ " "*Completions*" "*Shell Command Output*"
               "*Messages*" "Async Shell Command"))

;; Actionscript mode
(autoload 'actionscript-mode "actionscript-mode" "Major mode for actionscript." t)
(add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))

(setq default-tab-width 4)
;;(global-set-key (kbd "TAB") 'tab-to-tab-stop);
;;(setq indent-tabs-mode t)
;;(setq-default indent-tabs-mode t)
;;(global-set-key (kbd "TAB") 'self-insert-command)
;;(setq default-tab-width 4)
;;(setq tab-width 4)
;;(setq c-basic-indent 4)
;;(setq tab-stop-list (number-sequence 4 200 4))

;; PHP mode
(defun bill-set-indent-mode ()
	(c-set-style "java"))

(add-hook 'php-mode-hook 'bill-set-indent-mode)

;; filladapt
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (featurep 'filladapt)
	      (c-setup-filladapt))))

;; YASnippet
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1) 

;; autopair
;;(add-to-list 'load-path "/path/to/autopair") ;; comment if autopair.el is in standard load path 
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

;; Add config scripts that depend on .emacs.d/plugins are already loaded
(add-to-list 'load-path "~/.emacs.d/plugins-post")

;; Will update buffers when the corresponding file is updated on disc
(global-auto-revert-mode t)

;; JsHint
;;(add-to-list 'load-path "~/.emacs.d/plugins/jshint")
;;(require 'flymake-jshint)
;;(add-hook 'javascript-mode-hook
;;     (lambda () (flymake-mode t)))

;; Auto-complete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
; Load the default configuration
(require 'auto-complete-config)
; Make sure we can find the dictionaries
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/dict")
; Use dictionaries by default
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;;(flymake-mode t) 
;;(require 'flymake-easy)

(require 'flymake-jslint)
(add-hook 'js-mode-hook 'flymake-jslint-load)
;; set to ultra strict
(setq flymake-jslint-args nil)

;; Flymake cursor for JsLint
(require 'flymake-cursor)

;; vi emulation
;;(require 'viper)

