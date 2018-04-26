(package-initialize)

(require 'org)
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "~/.emacs.d/scott.org"))
(put 'downcase-region 'disabled nil)
