(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'brightscript-mode)
(require 'php-mode)

(setq default-tab-width 4)
;;(global-set-key (kbd "TAB") 'tab-to-tab-stop);
;;(setq indent-tabs-mode t)
;;(setq-default indent-tabs-mode t)
;;(global-set-key (kbd "TAB") 'self-insert-command)
;;(setq default-tab-width 4)
;;(setq tab-width 4)
;;(setq c-basic-indent 4)
;;(setq tab-stop-list (number-sequence 4 200 4))

;; For PHP mode
(defun bill-set-indent-mode ()
	(c-set-style "java"))

(add-hook 'php-mode-hook 'bill-set-indent-mode)

