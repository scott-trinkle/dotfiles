(require 'org)
(org-babel-load-file
 (expand-file-name "scott.org"
                   user-emacs-directory))

;; ;;PACKAGE INITIALIZE
;; (package-initialize)
;; (require 'package)
;; (add-to-list 'package-archives
;; 	     '("melpa" . "http://melpa.org/packages/")
;; 	     '("elpy" . "http://jorgenschaefer.github.io/packages/"))
;; (setq package-enable-at-startup nil)

;; ;;ORG MODE

;; ;; Wrap lines
;; (setq org-startup-truncated nil)

;; (setq org-directory "/Users/scotttrinkle/GoogleDrive/org/")

;; (global-set-key (kbd "C-c l") 'org-store-link)
;; (global-set-key (kbd "C-c a") 'org-agenda)
;; (global-set-key (kbd "C-c c") 'org-capture)
;; (global-set-key (kbd "C-c b") 'org-iswitchb)

;; (add-hook 'org-load-hook
;;           (lambda ()
;;             (define-key org-mode-map (kbd "C-c n") 'org-next-link)
;;             (define-key org-mode-map (kbd "C-c p") 'org-previous-link)))

;; (setq org-todo-keywords
;;         '((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "WAITING(w)" "|" "CANCELED(c)" "DONE(d)")))

;; (setq org-todo-keyword-faces
;;       '(("TODO" . "pink")
;;         ("NEXT" . "blue")
;;         ("STARTED" . "yellow")
;;         ("WAITING" . "orange")
;;         ("CANCELED" . "red")
;;         ("DONE" . "green")))

;; (setq org-enforce-todo-dependencies t)
;; (setq org-log-done 'time)

;; (setq org-default-notes-file "projects.org")
;; (setq org-agenda-files (quote ("~/GoogleDrive/org/" "~/GoogleDrive/org/projects.org" "~/GoogleDrive/org/calendar.org" "~/GoogleDrive/org/someday.org")))

;; (setq org-deadline-warning-days 5)          

;; (setq org-capture-templates '(("t" "Todo [inbox]" entry
;;                                (file+headline "~/GoogleDrive/org/projects.org" "Inbox")
;;                                "* %i%?")))


;; (defun org-summary-todo (n-done n-not-done)
;;   "Switch entry to DONE when all subentries are done, to TODO otherwise."
;;   (let (org-log-done org-log-states)  ; turn off logging
;;     (org-todo (if (= n-not-done 0) "DONE" "TODO" ))))

;; (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; ;; (setq org-tag-alist '((:startgroup . nil)
;; ;;                       ("@work" . ?w) ("@home" . ?h) ("someday" . ?s)
;; ;;                       (:endgroup .nil)))

;; (setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("someday" . ?s)))

;; (setq org-tags-column 65)

;; (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
;; (setq org-refile-use-outline-path 'file)
;; ;;(setq org-outline-path-complete-in-steps nil)
;; (setq org-refile-allow-creating-parent-nodes 'confirm)

;; (setq org-archive-location "archive/datetree.org::datetree/* Finished Tasks")

;; (eval-after-load 'org
;;   '(progn
;;      (add-to-list 'org-structure-template-alist
;; 		  '("e" "#+BEGIN_SRC emacs-lisp :tangle yes \n?\n#+END_SRC"))))


;; ;; Personal INFORMATION
;; (setq user-full-name "Scott Trinkle")
;; (setq user-mail-address "tscott.trinkle@gmail.com")

;; ;;SHELL
;; ;; Shell load .bash_profile
;; ;; (setq explicit-shell-file-name "/usr/local/bin/bash")
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; (add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
;; (setenv "PATH" (shell-command-to-string "source ~/.bash_profile; echo -n $PATH"))
;; (setq shell-command-switch "-lc")
;; (global-set-key (kbd "C-x C-p") 'shell)
;; (global-set-key (kbd "C-x C-r") 'query-replace)

;; ;;MAGIT
;; (global-set-key (kbd "C-x g") 'magit-status)
;; (global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; ;;PYTHON
;; (elpy-enable)

;; (setq elpy-rpc-python-command "python3")
;; (setq python-shell-interpreter "ipython"
;; ;; If you ever switch to ipython as your interpreter, include the following line:
;;      python-shell-interpreter-args "--simple-prompt -i")

;; ;; this fixes a bug where a readline warning launches
;; ;;whenever you send a script to the interpreter
;; ;(setq python-shell-completion-native-enable nil)

;; ;;Sets a virtual environment as a default
;; ;(pyvenv-activate "~/.virtualenvs/Main2")

;; ;(require pyvenv
;;  ;        :ensure t
;;   ;       :init
;;    ;      (setenv "WORKON_HOME" "~/anaconda/envs")
;;     ;     (pyvenv-mode 1)
;;      ;    (pyvenv-tracking-mode 1))

;; ;;changes syntax check from flymake to flycheck
;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))

;; ;;activates autopep8
;; (require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; (global-set-key (kbd "C-c C-r") 'python-shell-send-region)
;; (global-set-key (kbd "C-t") 'transpose-chars)

;; ;;OCTAVE
;; ;(autoload 'octave-mode "octave-mod" "Loading octave-mode" t)
;; (autoload 'octave-mode "octave-mod" nil t)
;; (setq auto-mode-alist
;;       (append '(("\\.m$" . octave-mod)) auto-mode-alist))
;; ;(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

;; (add-hook 'octave-mode-hook
;; 	  (lambda ()
;; 	    (setq tab-width 4)
;; 	    (abbrev-mode 1)
;; 	    (auto-fill-mode 1)
;; 	    (if (eq window-system 'x)
;;                 (font-lock-mode 1))))

;; ;;ASYMPTOTE
;; (add-to-list 'load-path "/usr/local/texlive/2015/texmf-dist/asymptote")
;; (autoload 'asy-mode "asy-mode.el" "Asymptote major mode." t)
;; (autoload 'lasy-mode "asy-mode.el" "hybrid Asymptote/Latex major mode." t)
;; (autoload 'asy-insinuate-latex "asy-mode.el" "Asymptote insinuate LaTeX." t)
;; (add-to-list 'auto-mode-alist '("\\.asy$" . asy-mode))


;; ;;DOCVIEW
;; (setq doc-view-resolution 300)


;; ;;Custom Commands
;; (setq custom-file "~/.emacs.d/custom.el")
;; (load custom-file 'noerror)

;; ;;Toggle off "kill running processes?" flag
;; (defun my-kill-emacs ()
;;   "Save some buffers, then exit unconditionally"
;;   (interactive)
;;   (save-some-buffers nil t)
;;   (kill-emacs))
;; (global-set-key (kbd "C-x C-c") 'my-kill-emacs)



;; ;;FILL COLUMN INDICATOR
;; (require 'fill-column-indicator)
;; (setq fci-rule-color "white")
;; (setq-default fill-column 80)
;; (setq fci-rule-column 80)
;; (setq fci-rule-use-dashes nil)

;; ;;LaTeX AND AUCTEX
;; (getenv "PATH")
;; (setenv "PATH"
;; 	(concat "/usr/texbin" ":"
;; (getenv "PATH")))
;; ;(setq TeX-PDF-mode t)
;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq TeX-save-query nil) ;;autosave before compiling

;; ;; Scale preview size
;; (set-default 'preview-scale-function 1.0)

;; ;; Disable annoying fontification in latex
;; (setq font-latex-fontify-script nil)

;; ;; Don't ask to cache preamble
;; (setq preview-auto-cache-preamble t)

;; ;; Enable math mode (type ` then letter for character)
;; (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; ;; ;;LaTeX syntax, flymake
;; ;; (require 'flymake)
;; ;; (defun flymake-get-tex-args (file-name)
;; ;;   (list "pdflatex"
;; ;;         (list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))
;; ;; (add-hook 'LaTeX-mode-hook 'flymake-mode)

;; ;;Spell Check
;; ;(setq ispell-program-name "aspell") ; could be ispell as well, depends on preferences
;; ;(setq ispell-dictionary "english") ; could be set to any language


;; ;;outline mode
;; (defun turn-on-outline-minor-mode ()
;;   (outline-minor-mode 1))

;; (add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
;; (add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
;; (setq outline-minor-mode-prefix "\C-c \C-o") ; or whatever

;; ;;MINOR MODE HOOKS
;; (add-hook 'python-mode-hook 'fci-mode)
;; (add-hook 'python-mode-hook 'linum-mode)
;; ;;(add-hook 'LaTeX-mode-hook 'fci-mode)
;; ;;(add-hook 'LaTeX-mode-hook 'linum-mode)
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; (add-hook 'LaTeX-mode-hook 'flyspell-buffer)
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; (setq reftex-plug-into-AUCTeX t)
;; (add-hook 'lisp-mode-hook 'linum-mode)
;; (add-hook 'org-mode-hook 'org-indent-mode)

;; ;;IDO
;; ;; Use ido
;; (require 'ido)
;; (ido-mode 1)
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (setq ido-use-filename-at-point 'guess)
;; (setq ido-file-extensions-order '(".txt" ".py" ".org"))

;;  ;MISC
;; ;;Use autocomplete
;; (global-auto-complete-mode t)

;; ;;Read HTML
;; (setq mm-text-html-renderer 'w3m)
;; (setq org-return-follows-link 't)

;; ;;APPEARANCE

;; ;;Font size
;; (set-face-attribute 'default nil :height 135)

;; ;;WINDOW
;; ;; Skip splash screen
;; (setq inhibit-startup-message t)
;; (setq initial-scratch-message "")

;; ;; Display settings
;; (setq mac-allow-anti-aliasing t)

;; ;;COLOR
;; (load-file "~/.emacs.d/xterm-color/xterm-color.el")
;; (require 'xterm-color)
;; (progn (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter)
;;        (setq comint-output-filter-functions (remove 'ansi-color-process-output comint-output-filter-functions)))

;; ;;CUSTOM BEHAVIORS

;; ;;Intuitive text marking
;; (delete-selection-mode t) ;; Deletes selection when you start typing
;; (transient-mark-mode t)
;; (setq x-select-enable-clipboard t)

;; ;;Simplify yes-no
;; (defalias 'yes-or-no-p 'y-or-n-p)

;; ;;Bell off
;; (setq ring-bell-function 'ignore)

;; ;;Fast key response
;; (setq echo-keystrokes 0.1)

;; ;;Visible bell
;; (setq visible-bell t)

;; ;;Show line number
;; (global-linum-mode t)
;; (setq linum-format "%d ")

;; ;;Mouse on
;; (unless window-system
;;   (require 'mouse)
;;   (xterm-mouse-mode 1)
;;   (global-set-key [mouse-1] '(mouse-set-point))
;;   (global-set-key [mouse-4] '(lambda ()
;; 			       (interactive)
;; 			       (scroll-down 1)))
;;   (global-set-key [mouse-5] '(lambda ()
;; 			       (interactive)
;; 			       (scroll-up 1)))
;;   (defun track-mouse (e))
;;   (setq mouse-sel-mode t)
;;   )

;; ;;Cursor settings
;; (blink-cursor-mode 0)
;; (setq-default cursor-in-non-selected-windows nil)

;; ;;Transpose Windows
;; (defun transpose-windows (arg)
;;    "Transpose the buffers shown in two windows."
;;    (interactive "p")
;;    (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
;;      (while (/= arg 0)
;;        (let ((this-win (window-buffer))
;;              (next-win (window-buffer (funcall selector))))
;;          (set-window-buffer (selected-window) next-win)
;;          (set-window-buffer (funcall selector) this-win)
;;          (select-window (funcall selector)))
;;        (setq arg (if (plusp arg) (1- arg) (1+ arg))))))
;; (global-set-key (kbd "C-x 7") 'transpose-windows)

;; ;;Next/Previous buffer
;; (global-set-key (kbd "C-x l") 'previous-buffer)
;; (global-set-key (kbd "C-x ;") 'next-buffer)

;; ;;Next/previous window
;; (global-set-key (kbd "C-x <up>") 'windmove-up)
;; (global-set-key (kbd "C-x <down>") 'windmove-down)
;; (global-set-key (kbd "C-x <right>") 'windmove-right)
;; (global-set-key (kbd "C-x <left>") 'windmove-left)

;; ;;Skips certain buffers
;; (setq skippable-buffers '("*Messages*" "*scratch*" "*Help*" "*Completions*" "Calendar" "*info*" "*Ibuffer*"))

;; (defun my-next-buffer ()
;;   "next-buffer that skips certain buffers"
;;   (interactive)
;;   (next-buffer)
;;   (while (member (buffer-name) skippable-buffers)
;;     (next-buffer)))

;; (defun my-previous-buffer ()
;;   "previous-buffer that skips certain buffers"
;;   (interactive)
;;   (previous-buffer)
;;   (while (member (buffer-name) skippable-buffers)
;;     (previous-buffer)))

;; (global-set-key [remap next-buffer] 'my-next-buffer)
;; (global-set-key [remap previous-buffer] 'my-previous-buffer)

;; ;;Switch to new window
;; (defun new-window-below-and-switch ()
;;   (interactive)
;;   (split-window-below)
;;   (other-window 1))

;; (defun new-window-right-and-switch ()
;;   (interactive)
;;   (split-window-right)
;;   (other-window 1))

;; (global-set-key (kbd "C-x 2") 'new-window-below-and-switch)
;; (global-set-key (kbd "C-x 3") 'new-window-right-and-switch)

;; ;;Flip Window orientation
;; (defun window-toggle-split-direction ()
;;   "Switch window split from horizontally to vertically, or vice versa.

;; i.e. change right window to bottom, or change bottom window to right."
;;   (interactive)
;;   (require 'windmove)
;;   (let ((done))
;;     (dolist (dirs '((right . down) (down . right)))
;;       (unless done
;;         (let* ((win (selected-window))
;;                (nextdir (car dirs))
;;                (neighbour-dir (cdr dirs))
;;                (next-win (windmove-find-other-window nextdir win))
;;                (neighbour1 (windmove-find-other-window neighbour-dir win))
;;                (neighbour2 (if next-win (with-selected-window next-win
;;                                           (windmove-find-other-window neighbour-dir next-win)))))
;;           ;;(message "win: %s\nnext-win: %s\nneighbour1: %s\nneighbour2:%s" win next-win neighbour1 neighbour2)
;;           (setq done (and (eq neighbour1 neighbour2)
;;                           (not (eq (minibuffer-window) next-win))))
;;           (if done
;;               (let* ((other-buf (window-buffer next-win)))
;;                 (delete-window next-win)
;;                 (if (eq nextdir 'right)
;;                     (split-window-vertically)
;;                   (split-window-horizontally))
;;                 (set-window-buffer (windmove-find-other-window neighbour-dir) other-buf))))))))

;; (global-set-key (kbd "C-x 8") 'window-toggle-split-direction)

;; ;;Comments
;; (global-set-key (kbd "M-c") 'comment-region)
;; (global-set-key (kbd "M-u") 'uncomment-region)

;; ;;Cut and Paste
;; (defun pbcopy ()
;;   (interactive)
;;   (call-process-region (point) (mark) "pbcopy")
;;   (setq deactivate-mark t))

;; (defun pbpaste ()
;;   (interactive)
;;   (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

;; (defun pbcut ()
;;   (interactive)
;;   (pbcopy)
;;   (delete-region (region-beginning) (region-end)))

;; ;;(global-set-key (kbd "C-c C-c") 'pbcopy)
;; (global-set-key (kbd "C-c C-v") 'pbpaste)
;; (global-set-key (kbd "C-c C-x") 'pbcut)

;; ;;Fullscreen
;; ;;(global-set-key (kbd "C-c C-f") 'toggle-frame-fullscreen)
;; (global-set-key (kbd "<C-s-268632070>") 'toggle-frame-fullscreen)

;; ;;Backups
;; (defvar --backup-directory (concat user-emacs-directory "backups"))
;; (if (not (file-exists-p --backup-directory))
;;         (make-directory --backup-directory t))
;; (setq backup-directory-alist `(("." . ,--backup-directory)))
;; (setq make-backup-files t               ; backup of a file the first time it is saved.
;;       backup-by-copying t               ; don't clobber symlinks
;;       version-control t                 ; version numbers for backup files
;;       delete-old-versions t             ; delete excess backup files silently
;;       delete-by-moving-to-trash t
;;       kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
;;       kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
;;       auto-save-default t               ; auto-save every buffer that visits a file
;;       auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
;;       auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
;;       )


;; ;; Magit
;; (global-set-key (kbd "C-x g") 'magit-status)
