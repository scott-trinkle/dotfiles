(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-list
   (quote
    (("TeX" "%(PDF)%(tex) %(file-line-error) %(extraopts) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %t; open %s" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %(extraopts) %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo %(extraopts) --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "%(PDF)amstex %(extraopts) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "texexec --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "texexec %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")
     ("View" "open %s.pdf" TeX-run-command t t :help "Run Text viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file")
     ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file")
     ("Xindy" "texindy %s" TeX-run-command nil t :help "Run xindy to create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for common mistakes")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(auth-source-save-behavior nil)
 '(custom-safe-themes
   (quote
    ("ad24ea739f229477ea348af968634cb7a0748c9015110a777c8effeddfa920f5" "e7ec0cc3ce134cc0bd420b98573bbd339a908ac24162b8034c98e1ba5ee1f9f6" default)))
 '(org-agenda-custom-commands
   (quote
    (("N" "Project TODOs" alltodo ""
      ((org-agenda-skip-function
	(quote
	 (org-agenda-skip-entry-if
	  (quote scheduled)
	  (quote deadline))))
       (org-agenda-skip-function
	(quote
	 (org-agenda-skip-entry-if
	  (quote todo)
	  (quote done)
	  (quote todo)
	  (quote
	   ("WAITING" "STARTED")))))
       (org-agenda-files
	(quote
	 ("~/GoogleDrive/org/projects.org")))))
     ("o" "Someday TODOs"
      ((tags-todo "someday"
		  ((org-agenda-overriding-header "Actions To Do Someday")
		   (org-agenda-skip-function
		    (quote
		     (org-agenda-skip-entry-if
		      (quote scheduled)))))))
      nil nil)
     ("n" "Agenda and all NEXT, STARTED and WAITING actions"
      ((agenda ""
	       ((org-agenda-start-on-weekday nil)
		(org-agenda-span 1)))
       (todo "NEXT"
	     ((org-agenda-overriding-header "Unscheduled Next Actions")
	      (org-agenda-tag-filter-preset
	       (quote nil))
	      (org-agenda-skip-function
	       (quote
		(org-agenda-skip-entry-if
		 (quote scheduled))))))
       (todo "STARTED"
	     ((org-agenda-overriding-header "Unscheduled Actions I Have Started")
	      (org-agenda-skip-function
	       (quote
		(org-agenda-skip-entry-if
		 (quote scheduled))))))
       (todo "WAITING"
	     ((org-agenda-overriding-header "Things I Am Waiting For")
	      (org-agenda-skip-function
	       (quote
		(org-agenda-skip-entry-if
		 (quote scheduled)))))))
      nil))))
 '(org-agenda-files
   (quote
    ("~/GoogleDrive/org/projects.org" "~/GoogleDrive/org/someday.org" "~/GoogleDrive/org/calendar.org")))
 '(package-selected-packages
   (quote
    (irony-eldoc diminish org-alert pdf-tools org-pdfview pyenv-mode pyenv-mode-auto org-edna ac-octave auctex-latexmk auctex-lua auctex magit flycheck py-autopep8 notmuch emojify mu4e-alert xterm-color cl-lib fill-column-indicator elpy auto-complete)))
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "Black" :foreground "light grey" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 1 :width normal :foundry "default" : family "default"))))
 '(dired-flagged ((t (:inherit default))))
 '(dired-marked ((t (:inherit default) fault)))
 '(font-latex-script-char-face ((t (:foreground "Red"))))
 '(font-latex-sectioning-0-face ((t (:inherit font-latex-sectioning-1-face))))
 '(font-latex-sectioning-1-face ((t (:inherit font-latex-sectioning-2-face))))
 '(font-latex-sectioning-2-face ((t (:inherit font-latex-sectioning-3-face))))
 '(font-latex-sectioning-3-face ((t (:inherit font-latex-sectioning-4-face))))
 '(font-latex-sectioning-4-face ((t (:inherit font-latex-sectioning-5-face))))
 '(fringe ((t (:background "black"))))
 '(minibuffer-prompt ((t (:foreground "cyan"))))
 '(mode-line ((t (:background "grey80" :foreground "black" :box (:line-width 1 :color "grey80" :style released-button)))))
 '(mode-line-highlight ((t nil)))
 '(mode-line-inactive ((t (:inherit mode-line :background "black" :foreground "grey80" :weight light))))
 '(mu4e-header-highlight-face ((t (:inherit region :weight bold))))
 '(mu4e-modeline-face ((t (:inherit mode-line-read-only-face :weight bold))))
 '(preview-face ((t nil)))
 '(tool-bar ((t (:background "grey75" :foreground "black" :box (:line-width 1 :color "gray3" :style released-button)))))
 '(window-divider ((t (:foreground "black"))))
 '(window-divider-first-pixel ((t (:foreground "black"))))
 '(window-divider-last-pixel ((t (:foreground "black")))))
