(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'brightscript-mode)
(require 'php-mode)

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

(add-to-list 'load-path "~/.emacs.d/plugins/jshint")
(require 'flymake-jshint)
(add-hook 'javascript-mode-hook
     (lambda () (flymake-mode t)))
