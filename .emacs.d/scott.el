(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/")
	     '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(setq package-enable-at-startup nil)

(setq user-full-name "Scott Trinkle")
(setq user-mail-address "tscott.trinkle@gmail.com")
(setq calendar-location-name "Chicago, Il")

(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq save-abbrevs t)

(setq org-directory "/Users/scotttrinkle/GoogleDrive/org/")

;; Key bindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c b") 'org-iswitchb)

;; TODOs
(setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "WAITING(w)" "|" "CANCELED(c)" "DONE(d)")))

(setq org-todo-keyword-faces
      '(("TODO" . "pink")
        ("NEXT" . "blue")
        ("STARTED" . "yellow")
        ("WAITING" . "orange")
        ("CANCELED" . "red")
        ("DONE" . "green")))

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)  ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO" ))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(setq org-enforce-todo-dependencies t)
(setq org-log-done 'time)

;; Tags
(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("someday" . ?s)))
(setq org-tags-column -85)

;; Agenda
(setq org-default-notes-file "projects.org")
(setq org-agenda-files (quote ("~/GoogleDrive/org/" "~/GoogleDrive/org/projects.org" "~/GoogleDrive/org/calendar.org" "~/GoogleDrive/org/someday.org")))
(setq org-deadline-warning-days 5)          
(setq org-archive-location "archive/datetree.org::datetree/* Finished Tasks")

;; Capture
(setq org-capture-templates 
      (quote
       (("t" "Todo [inbox]" entry (file+headline "~/GoogleDrive/org/projects.org" "Inbox")
                               "* %i%?"))))

;; Refiling
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
(setq org-refile-use-outline-path 'file)
;;(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes 'confirm)




(add-hook 'org-load-hook
          (lambda ()
            (define-key org-mode-map (kbd "C-c n") 'org-next-link)
            (define-key org-mode-map (kbd "C-c p") 'org-previous-link)))

;; Custom behavior
(setq org-startup-truncated nil)  ;; wrap lines
(setq org-startup-indented t)
(setq org-agenda-restore-windows-after-quit t)  ;; save window views
(eval-after-load 'org  ;; shortcut for creating elisp src
  '(progn
     (add-to-list 'org-structure-template-alist
                  '("e" "#+BEGIN_SRC emacs-lisp :tangle yes \n?\n#+END_SRC"))))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
(setenv "PATH" (shell-command-to-string "source ~/.bash_profile; echo -n $PATH"))

;; I think this makes it load .bash_profile. Login vs. interactive shell?
(setq shell-command-switch "-lc") 

(global-set-key (kbd "C-x C-p") 'shell)

;; Open in current window
(add-to-list 'display-buffer-alist
     '("^\\*shell\\*$" . (display-buffer-same-window)))

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(elpy-enable)

(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "ipython"
     python-shell-interpreter-args "--simple-prompt -i")

;; Try this:
;; (setq python-shell-interpreter "/usr/local/bin/python3")

;; this fixes a bug where a readline warning launches
;;whenever you send a script to the interpreter
;(setq python-shell-completion-native-enable nil)

;;changes syntax check from flymake to flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;activates autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(global-set-key (kbd "C-c C-r") 'python-shell-send-region)
(global-set-key (kbd "C-t") 'transpose-chars)

(autoload 'octave-mode "octave-mod" "Loading octave-mode" t)
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

(add-hook 'octave-mode-hook
	  (lambda ()
	    (setq tab-width 4)
	    (abbrev-mode 1)
	    (auto-fill-mode 1)
	    (if (eq window-system 'x)
                (font-lock-mode 1))))

(setq doc-view-resolution 300)

(require 'fill-column-indicator)
(setq fci-rule-color "white")
(setq-default fill-column 80)
(setq fci-rule-column 80)
(setq fci-rule-use-dashes nil)

;; (getenv "PATH")
;; (setenv "PATH"
;; 	(concat "/usr/texbin" ":"
;; (getenv "PATH")))
(setq TeX-PDF-mode t)  ;; This was commented out before
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil) ;;autosave before compiling

;; Disable annoying fontification in latex
(setq font-latex-fontify-script nil)

;; Enable math mode (type ` then letter for character)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; Scale preview size
(set-default 'preview-scale-function 1.0)

;; Don't ask to cache preamble
(setq preview-auto-cache-preamble t)

;;Bibtex
(setq bibtex-maintain-sorted-entries 't)

(add-hook 'python-mode-hook 'fci-mode)
(add-hook 'python-mode-hook 'linum-mode)

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(add-hook 'lisp-mode-hook 'linum-mode)

(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook (lambda () (diminish 'org-indent-mode "")))
(add-hook 'org-mode-hook 'org-beamer-mode)
(add-hook 'org-mode-hook (lambda () (diminish 'org-beamer-mode "")))
(add-hook 'math-mode 'linum-mode)

(require 'ido)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-use-filename-at-point 'guess)
(setq ido-file-extensions-order '(".txt" ".py" ".org"))
(setq ido-max-window-height 1)

;;Use autocomplete
(global-auto-complete-mode t)

;;Read HTML
(setq mm-text-html-renderer 'w3m)
(setq org-return-follows-link 't)

;;Backups
(defvar --backup-directory (concat user-emacs-directory "backups"))
(if (not (file-exists-p --backup-directory))
        (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )

;; Skip splash screen
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; Hide menu bars
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Display settings
(setq mac-allow-anti-aliasing t)

(add-to-list 'default-frame-alist '(font . "Monaco 13"))
(if (string-equal system-type "darwin")
(set-fontset-font "fontset-default"
'unicode
'("Monaco" . "iso10646-1")))

(setq frame-resize-pixelwise 'true)
(setq line-spacing 0)

(load-file "~/.emacs.d/xterm-color/xterm-color.el")
(require 'xterm-color)
(progn (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter)
       (setq comint-output-filter-functions (remove 'ansi-color-process-output comint-output-filter-functions)))

(add-to-list 'display-buffer-alist
             '("*Help*" display-buffer-same-window))

(delete-selection-mode t) ;; Deletes selection when you start typing
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq ring-bell-function 'ignore)

(setq echo-keystrokes 0.1)

(setq visible-bell t)

(global-linum-mode t)
(setq linum-format "%d ")

(unless window-system
  (require 'mouse)
  (xterm-mouse-mode 1)
  (global-set-key [mouse-1] '(mouse-set-point))
  (global-set-key [mouse-4] '(lambda ()
			       (interactive)
			       (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
			       (interactive)
			       (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
  )

(blink-cursor-mode 0)
(setq-default cursor-in-non-selected-windows nil)

(defun transpose-windows (arg)
   "Transpose the buffers shown in two windows."
   (interactive "p")
   (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
     (while (/= arg 0)
       (let ((this-win (window-buffer))
             (next-win (window-buffer (funcall selector))))
         (set-window-buffer (selected-window) next-win)
         (set-window-buffer (funcall selector) this-win)
         (select-window (funcall selector)))
       (setq arg (if (plusp arg) (1- arg) (1+ arg))))))
(global-set-key (kbd "C-x 7") 'transpose-windows)

(global-set-key (kbd "C-x l") 'previous-buffer)
(global-set-key (kbd "C-x ;") 'next-buffer)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

(setq skippable-buffers '("*Messages*" "*scratch*" "*Help*" "*Completions*" "Calendar" "*info*" "*Ibuffer*"))

(defun my-next-buffer ()
  "next-buffer that skips certain buffers"
  (interactive)
  (next-buffer)
  (while (member (buffer-name) skippable-buffers)
    (next-buffer)))

(defun my-previous-buffer ()
  "previous-buffer that skips certain buffers"
  (interactive)
  (previous-buffer)
  (while (member (buffer-name) skippable-buffers)
    (previous-buffer)))

(global-set-key [remap next-buffer] 'my-next-buffer)
(global-set-key [remap previous-buffer] 'my-previous-buffer)

(defun new-window-below-and-switch ()
  (interactive)
  (split-window-below)
  (other-window 1))

(defun new-window-right-and-switch ()
  (interactive)
  (split-window-right)
  (other-window 1))

(global-set-key (kbd "C-x 2") 'new-window-below-and-switch)
(global-set-key (kbd "C-x 3") 'new-window-right-and-switch)

(defun window-toggle-split-direction ()
  "Switch window split from horizontally to vertically, or vice versa.

i.e. change right window to bottom, or change bottom window to right."
  (interactive)
  (require 'windmove)
  (let ((done))
    (dolist (dirs '((right . down) (down . right)))
      (unless done
        (let* ((win (selected-window))
               (nextdir (car dirs))
               (neighbour-dir (cdr dirs))
               (next-win (windmove-find-other-window nextdir win))
               (neighbour1 (windmove-find-other-window neighbour-dir win))
               (neighbour2 (if next-win (with-selected-window next-win
                                          (windmove-find-other-window neighbour-dir next-win)))))
          ;;(message "win: %s\nnext-win: %s\nneighbour1: %s\nneighbour2:%s" win next-win neighbour1 neighbour2)
          (setq done (and (eq neighbour1 neighbour2)
                          (not (eq (minibuffer-window) next-win))))
          (if done
              (let* ((other-buf (window-buffer next-win)))
                (delete-window next-win)
                (if (eq nextdir 'right)
                    (split-window-vertically)
                  (split-window-horizontally))
                (set-window-buffer (windmove-find-other-window neighbour-dir) other-buf))))))))

(global-set-key (kbd "C-x 8") 'window-toggle-split-direction)

(global-set-key (kbd "M-c") 'comment-region)
(global-set-key (kbd "M-u") 'uncomment-region)

(require 'cl-lib)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-letf (((symbol-function #'process-list) (lambda ())))
    ad-do-it))

;;Toggle off "kill running processes?" flag
(defun my-kill-emacs ()
  "Save some buffers, then exit unconditionally"
  (interactive)
  (save-some-buffers nil t)
  (kill-emacs))
(global-set-key (kbd "C-x C-c") 'my-kill-emacs)

(defun pbcopy ()
  (interactive)
  (call-process-region (point) (mark) "pbcopy")
  (setq deactivate-mark t))

(defun pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(defun pbcut ()
  (interactive)
  (pbcopy)
  (delete-region (region-beginning) (region-end)))

;;(global-set-key (kbd "C-c C-c") 'pbcopy)
(global-set-key (kbd "C-c C-v") 'pbpaste)
(global-set-key (kbd "C-c C-x") 'pbcut)

(global-set-key (kbd "C-x C-r") 'query-replace)

;;(global-set-key (kbd "C-c C-f") 'toggle-frame-fullscreen)
(global-set-key (kbd "<C-s-268632070>") 'toggle-frame-fullscreen)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(when window-system (set-frame-size (selected-frame) 180 48))
(find-file "~/GoogleDrive/org/projects.org")
(find-file "~/.emacs.d/scott.org")
(shell "*shell*")
(add-hook 'after-init-hook (lambda () (org-agenda nil "n")))
(switch-to-buffer "*Org Agenda*")
