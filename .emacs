;;-- el-get, -the Emacs pacgage manager initialization
(add-to-list 'load-path "~/.emacs.d/goodies/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp)))

(el-get 'sync)

;Advanced setup with local recipes
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)

;; local sources
(setq my-packages
      (append
'( 
el-get 
ace-jump-mode 
auto-pair-plus
auto-complete
auto-complete-extension
auto-complete-chunk
auto-complete-latex
auto-complete-yasnippet
auctex 
ido-ubiquitous
ido-yes-or-no
idomenu
;ido-hacks ;; breaks ido <21.apr.2012>
smex
cdlatex-mode ;; that's a major mode, has it a lighter version, cdlatex-minor??
reftex
deft
evil-leader
evil-surround
evil-numbers
lua-mode
org-mode
magit
smooth-scrolling
yasnippet
)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

;;-- Evil, -the Emacs's Vim emulator configuration
(require 'undo-tree)
(require 'evil-numbers)
(setq evil-find-skip-newlines t)
(evil-mode 1)
(setq evil-default-cursor t)
(setq evil-want-C-u-scroll t)
(setq evil-want-fine-undo t)
(require 'surround)
(global-surround-mode 1)
(require 'evil-numbers)
(require 'evil-leader)
(setq evil-leader/leader "\\") ; can't be there "," 'cause it's occupied by evil already
(setq evil-leader/i-all-states t)
(evil-leader/set-key
  "e" 'ido-find-file
  "b" 'ido-switch-buffer
  "ll" 'org-export-as-pdf-and-open
  "lt" 'org-export-as-latex
  "lo" 'org-export-as-odt-and-open
  "ht" 'org-export-as-html-and-open
   "h"  'evil-split-buffer
  "v"  'split-window-vertically
  "d"  'evil-delete-buffer
  )
(require 'evil)
(require 'ace-jump-mode)
;- a minor mode for Emacs, enabling fast/direct cursor-moving in current view
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)
;;-- Evil, -the Emacs's Vim emulator configuration

;Org-mode configure
;; The following lines are always needed. Choose your own keys.
(setq org-modules '(org-toc)) ;now learn shortcuts how to use it!
(require 'org-exp-blocks)
(require 'org-special-blocks)
(setq org-startup-indented t)
(setq org-hide-leading-stars 0 )
(setq org-ctrl-k-protect-subtree t)
(setq org-footnote-auto-adjust t)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
;(add-hook 'org-mode-hook 'turn-on-org-cdlatex) ;Cannot open load file: cdlatex
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(require 'org-latex)
(setq org-export-latex-listings t)
(add-to-list 'org-export-latex-packages-alist '("" "listings"))
(add-to-list 'org-export-latex-packages-alist '("" "color"))

(setq org-export-latex-packages-alist
      '(("" "graphicx" t)
            ("" "longtable" nil)
            ("" "float" nil)))

      "Automatically select the tex packages to include."
      ;; default packages for ordinary latex or pdflatex export
      (setq org-export-latex-default-packages-alist
            '("%\\documentclass[paper=a4,fontsize=11]{scrartcl}"
	      ("AUTO" "inputenc"  t)
              ("T1"   "fontenc"   t)
              ("slovak" "babel"   t)
	      (""     "lmodern"   t)
              (""     "fixltx2e"  nil)
              (""     "wrapfig"   nil)
	      (""     "fancyhdr"  t)
              ("font=small,format=plain,labelfont=bf,up" "caption"  t)
	      (""     "rotating"  t)
              (""     "soul"      t)
              (""     "textcomp"  t)
              (""     "marvosym"  t)
;             (""     "wasysym"   t)  ; conflicts with amsmath
              (""     "latexsym"  t)
	      (""     "textcomp"  t)
	      (""     "amsmath"   t)
              (""     "amssymb"   t)
	      (""     "booktabs"  t)
	      (""     "microtype" t)
              (""     "hyperref"  nil)
	      "\\renewcommand{\\headrulewidth}{0pt}"
	      "\\pagestyle{fancy}"
	      "\\fancyhead{}"
	      "%\\setkomafont{sectioning}{\\rmfamily\\bfseries}"
	      "\\rfoot{\\small{Sádzané systémom \\LaTeXe}}"))


(defun wicked/org-update-checkbox-count (&optional all)
  "Update the checkbox statistics in the current section.
This will find all statistic cookies like [57%] and [6/12] and update
them with the current numbers.  With optional prefix argument ALL,
do this for the whole buffer."
  (interactive "P")
  (save-excursion
    (let* ((buffer-invisibility-spec (org-inhibit-invisibility))
	   (beg (condition-case nil
		    (progn (outline-back-to-heading) (point))
		  (error (point-min))))
	   (end (move-marker
		 (make-marker)
		 (progn (or (outline-get-next-sibling) ;; (1)
			    (goto-char (point-max)))
			(point))))
	   (re "\\(\\[[0-9]*%\\]\\)\\|\\(\\[[0-9]*/[0-9]*\\]\\)")
	   (re-box
	    "^[ \t]*\\(*+\\|[-+*]\\|[0-9]+[.)]\\) +\\(\\[[- X]\\]\\)")
	   b1 e1 f1 c-on c-off lim (cstat 0))
      (when all
	(goto-char (point-min))
	(or (outline-get-next-sibling) (goto-char (point-max))) ;; (2)
	(setq beg (point) end (point-max)))
      (goto-char beg)
      (while (re-search-forward re end t)
	(setq cstat (1+ cstat)
	      b1 (match-beginning 0)
	      e1 (match-end 0)
	      f1 (match-beginning 1)
	      lim (cond
		   ((org-on-heading-p)
		    (or (outline-get-next-sibling) ;; (3)
			(goto-char (point-max)))
		    (point))
		   ((org-at-item-p) (org-end-of-item) (point))
		   (t nil))
	      c-on 0 c-off 0)
	(goto-char e1)
	(when lim
	  (while (re-search-forward re-box lim t)
	    (if (member (match-string 2) '("[ ]" "[-]"))
		(setq c-off (1+ c-off))
	      (setq c-on (1+ c-on))))
	  (goto-char b1)
	  (insert (if f1
		      (format "[%d%%]" (/ (* 100 c-on)
					  (max 1 (+ c-on c-off))))
		    (format "[%d/%d]" c-on (+ c-on c-off))))
	  (and (looking-at "\\[.*?\\]")
	       (replace-match ""))))
      (when (interactive-p)
	(message "Checkbox statistics updated %s (%d places)"
		 (if all "in entire file" "in current outline entry")
		 cstat)))))
(defadvice org-update-checkbox-count (around wicked activate)
  "Fix the built-in checkbox count to understand headlines.
http://sachachua.com/blog/2008/01/outlining-your-notes-with-org/"

  (setq ad-return-value
	(wicked/org-update-checkbox-count (ad-get-arg 1))))

;(evil-declare-key 'normal org-mode-map
;  (kbd "RET") 'org-open-at-point
;  "za" 'org-cycle
;  "zA" 'org-shifttab
;  "zm" 'hide-body
;  "zr" 'show-all
;  "zo" 'show-subtree
;  "zO" 'show-all
;  "zc" 'hide-subtree
;  "zC" 'hide-all
;  (kbd "M-j") 'org-shiftleft
;  (kbd "M-k") 'org-shiftright
;  (kbd "M-H") 'org-metaleft
;  (kbd "M-J") 'org-metadown
;  (kbd "M-K") 'org-metaup
;  (kbd "M-L") 'org-metaright
;  )
;
;(evil-declare-key 'insert org-mode-map
;  (kbd "M-j") 'org-shiftleft
;  (kbd "M-k") 'org-shiftright
;  (kbd "M-H") 'org-metaleft
;  (kbd "M-J") 'org-metadown
;  (kbd "M-K") 'org-metaup
;  (kbd "M-L") 'org-metaright
;  )

(evil-define-key 'normal org-mode-map
  (kbd "RET") 'org-open-at-point
  "za" 'org-cycle
  "zA" 'org-shifttab
  "zm" 'hide-body
  "zr" 'show-all
  "zo" 'show-subtree
  "zO" 'show-all
  "zc" 'hide-subtree
  "zC" 'hide-all
  (kbd "M-j") 'org-shiftleft
  (kbd "M-k") 'org-shiftright
  (kbd "M-H") 'org-metaleft
  (kbd "M-J") 'org-metadown
  (kbd "M-K") 'org-metaup
  (kbd "M-L") 'org-metaright)

(evil-define-key 'normal orgstruct-mode-map
  (kbd "RET") 'org-open-at-point
  "za" 'org-cycle
  "zA" 'org-shifttab
  "zm" 'hide-body
  "zr" 'show-all
  "zo" 'show-subtree
  "zO" 'show-all
  "zc" 'hide-subtree
  "zC" 'hide-all
  (kbd "M-j") 'org-shiftleft
  (kbd "M-k") 'org-shiftright
  (kbd "M-H") 'org-metaleft
  (kbd "M-J") 'org-metadown
  (kbd "M-K") 'org-metaup
  (kbd "M-L") 'org-metaright)

(evil-define-key 'insert org-mode-map
  (kbd "M-j") 'org-shiftleft
  (kbd "M-k") 'org-shiftright
  (kbd "M-H") 'org-metaleft
  (kbd "M-J") 'org-metadown
  (kbd "M-K") 'org-metaup
  (kbd "M-L") 'org-metaright)

(evil-define-key 'insert orgstruct-mode-map
  (kbd "M-j") 'org-shiftleft
  (kbd "M-k") 'org-shiftright
  (kbd "M-H") 'org-metaleft
  (kbd "M-J") 'org-metadown
  (kbd "M-K") 'org-metaup
  (kbd "M-L") 'org-metaright)

;; active Babel languages
(org-babel-do-load-languages
'org-babel-load-languages
'(
  (emacs-lisp . t)
  (gnuplot . t)
  (latex . t)
  (sh . t)
  ))
;; fontify code in code blocks
(setq org-src-fontify-natively t)
;; do not ask me for confirmation on C-c C-c
(setq org-confirm-babel-evaluate nil)

;-- LaTeX config begin
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-math-mode 'TeX-PDF-mode)
;(add-hook 'LaTeX-mode-hook 'TeX-fold-mode)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-electric-sub-and-superscript 1)
(setq preview-scale-function 1)
;(setq-default TeX-master nil) ; make auctex aware of multi-file structured documents


(require 'reftex)
(global-auto-revert-mode t) ;auto-updating of .bib files
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode


;; Use hunspell instead of ispell
(setq ispell-program-name "aspell") 
;(require 'rw-language-and-country-codes)
;(require 'rw-ispell)
;(require 'rw-hunspell)
;(rw-hunspell-setup)
;(setq ispell-dictionary "sk_SK_hunspell")
;;; The following is set via custom
;(custom-set-variables
; '(rw-hunspell-default-dictionary "sk_SK_hunspell")
; '(rw-hunspell-dicpath-list (quote ("/usr/share/hunspell")))
; '(rw-hunspell-make-dictionary-menu t)
; '(rw-hunspell-use-rw-ispell t)
;)
;'(flyspell-issue-message-flag nil)
;(add-hook 'text-mode-hook (lambda() (flyspell-mode 1)))
;(add-hook 'LaTeX-mode-hook (lambda() (flyspell-mode 1)))
;(add-hook 'tex-mode-hook (lambda() (flyspell-mode 1)))
;(add-hook 'bibtex-mode-hook (lambda() (flyspell-mode 1)))
;(add-hook 'org-mode-hook (lambda() (flyspell-mode 1)))

;;-- LaTeX config end

;;-- Color theme
;(require 'color-theme)
;(color-theme-initialize)
;(setq color-theme-is-global t)
;(color-theme-zenburn)
(load-theme 'darkburn t)

;;-- Plaintext file editation hacks and suggestions:
(require 'deft)
(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-directory "~/writings/deft")
(setq deft-use-filename-as-title t)
(global-set-key [f8] 'deft)

;;-- Random Emacs configuration:
(require 'smooth-scrolling)
(setq smooth-scroll-margin 2)
(tool-bar-mode -1) ;disable toolbar
(scroll-bar-mode -1) ;disable scrollbar
(menu-bar-mode -1) ;disable menu
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(global-linum-mode 0)  ;turns on line numbers
(global-set-key [?\C-h] 'delete-backward-char) ;maps 'C-h' to backspace
(global-set-key [?\C-x ?h] 'help-command) ;maps emacs help to 'M-x h'
(global-set-key [?\C-j] 'evil-forward-char) ;ako sipka doprava
(defalias 'yes-or-no-p 'y-or-n-p)
(setq-default fill-column 74) ;when exceeded, automatically jumps on new line
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default auto-fill-function 'do-auto-fill)
(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)
(show-paren-mode 1)
(setq show-paren-delay 0)
;(require highlight-indentation)
;(global-highlight-indentation-mode 1)
;; Show line-number and column-number in the mode line
(line-number-mode 1)
(column-number-mode 1)
;; highlight current line
(global-hl-line-mode 0)
(blink-cursor-mode 1)      ;; or pass in -1 to turn it off   
(setq x-stretch-cursor t) ;; cursor will be as wide as tab character for example


(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")
(ac-config-default)

(require 'auto-complete-extension)

;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                         (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)
;(ac-flyspell-workaround)

(require 'auto-complete-latex)
(setq ac-l-dict-directory "~/.emacs.d/el-get/auto-complete-latex/ac-l-dict/")
(add-to-list 'ac-modes 'LaTeX-mode)
(add-to-list 'ac-modes 'org-mode)
(add-hook 'LaTeX-mode-hook 'ac-l-setup)
(add-hook 'org-mode-hook 'ac-l-setup)

(require 'yasnippet) ;my own snippets goes to ~/.emacs.d/snippets
(yas/global-mode 1)
(require 'auto-complete-yasnippet)

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "d9d7a7c76f3d552f1c6da90736dd818b9423ad1e6047feeb8e1851a1b5191420" "7ec2d1c73249c206cce9ebcadee61dc5469b566eea1fe095b78273c96f28c0ca" "8465bf2aa97d7348a090ce2fc3c9d9baa8c2db24457522c4c644566958b72298" "6938c51c0a89f078c61b979af23ae4c32204458f16a6a08c1a683ab478a7bc6b" "19fd3e6933b3294bfb0acd8ab7d33f09a25fc2a6f4a82b558035afb8db6f44b2" "b0d34df9f6d9b7c5d1c8eb3b8a7d7205f0a618b9ecf4213812bf9ba776d37c3e" "1785ea7433f340eccfc702f0a11b3c6e34d079407d012a44cb17974159edbbbb" default)))
 '(org-agenda-files (quote ("~/writings/management-onkologia/onkologia-management.org" "/tmp/shit.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;EXPERIMENTAL SETTINGS

(require 'org-latex)
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))

(add-to-list 'org-export-latex-classes
             '("koma-article"
               "\\documentclass[paper=a4,fontsize=11pt]{scrartcl}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))  

(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))  


(add-to-list 'org-export-latex-classes
             '("koma-report"
               "\\documentclass[paper=a4,fontsize=11pt]{scrreprt}"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))  

;(defun org-export-latex-format-toc-org-article-sec-num (depth)
;  (when depth
;    (format "%% Org-mode is exporting headings to %s levels.\n\\tableofcontents\n"
;            depth)))
;(setq org-export-latex-format-toc-function 'org-export-latex-format-toc-org-article-sec-num)


;This should nicely format the tables in exported odt similarly as the
;'booktabs' package in LaTeX
;     (setq org-export-odt-table-styles
;           (append org-export-odt-table-styles
;     	      '(("TableWithHeaderRowAndColumn" "Custom"
;     		 ((use-first-row-styles . t)
;     		  (use-first-column-styles . t)))
;     		("TableWithFirstRowandLastRow" "Custom"
;     		 ((use-first-row-styles . t)
;     		  (use-last-row-styles . t))))))

;; Introduces compatibility of yasnippet with org-mode
(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(add-hook 'org-mode-hook
          (lambda ()
            ;; yasnippet (using the new org-cycle hooks)
            (make-variable-buffer-local 'yas/trigger-key)
            (setq yas/trigger-key [tab])
            (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
            (define-key yas/keymap [tab] 'yas/next-field)))

(global-visual-line-mode t)
(setq line-move-visual nil)


;; use RefTeX on Org-mode files for LaTeX 
;; don't forget to add following lines anywhere in Org-mode file (Org-mode
;; will recognize them as LaTeX commands)
;;\bibliographystyle{plain}
;;\bibliography{BIB-NAME}

(defun org-mode-reftex-setup ()
;  (load-library "reftex")
   (reftex-mode t)
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation))

(add-hook 'org-mode-hook 'org-mode-reftex-setup)

(require 'zotexo)
(add-hook 'LaTeX-mode-hook 'zotexo-minor-mode)
(add-hook 'org-mode-hook 'zotexo-minor-mode)


(setq org-latex-to-pdf-process (list "latexmk -f -pdf %f"))


;; Enables referencing in style [[Chapter name]] 
(setq org-export-latex-hyperref-format "\\ref{%s}") 

;; PDFs visited in Org-mode are opened in Evince (and other file extensions are handled according to the defaults)
(add-hook 'org-mode-hook
      '(lambda ()
         (setq org-file-apps
           '((auto-mode . emacs)
             ("\\.mm\\'" . default)
             ("\\.x?html?\\'" . default)
             ("\\.pdf\\'" . "zathura %s")))))


;; Congiguration of Ido
;; ido makes competing buffers and finding files easier
;; http://www.emacswiki.org/cgi-bin/wiki/InteractivelyDoThings
(ido-mode 1)
(setq ido-everywhere t)
(ido-mode 'both) ;; for buffers and files
(setq 
  ido-save-directory-list-file "~/.emacs.d/cache/ido.last"
  ido-ignore-buffers ;; ignore these guys
  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"
     "^\*compilation" "^\*GTAGS" "^session\.*" "^\*")
  ido-file-extensions-order '(".org" ".tex" ".txt" ".emacs" ".el")
  ido-work-directory-list '("~/" "~/.config" "~/documents" "~/downloads" "~/writings/")
  ido-case-fold  t                 ; be case-insensitive
  ido-create-new-buffer 'prompt

  ido-enable-last-directory-history t ; remember last used dirs
  ido-max-work-directory-list 35   ; should be enough
  ido-max-work-file-list      70   ; remember many
  ido-use-filename-at-point nil    ; don't use filename at point (annoying)
  ido-use-url-at-point nil         ; don't use url at point (annoying)

  ido-enable-flex-matching t       ; don't try to be too smart (was nill)
  ido-max-prospects 12             ; don't spam my minibuffer
  ido-confirm-unique-completion t) ; wait for RET, even with unique completion

;; when using ido, the confirmation is rather annoying...
(setq confirm-nonexistent-file-or-buffer nil)


;; smex configuration
(setq smex-save-file "~/.emacs.d/cache/smex.save") ;; keep my ~/ clean 
(require 'smex) 
(smex-initialize) 
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; magit configuration
(evil-add-hjkl-bindings magit-branch-manager-mode-map 'emacs
  "K" 'magit-discard-item
  "L" 'magit-key-mode-popup-logging)
(evil-add-hjkl-bindings magit-status-mode-map 'emacs
  "K" 'magit-discard-item
  "l" 'magit-key-mode-popup-logging
  "h" 'magit-toggle-diff-refine-hunk)

;; byte-compile .emacs everytime the file is saved
(defun byte-compile-user-init-file ()
(let ((byte-compile-warnings '(unresolved)))
;; Useful if compilation fails.
(when (file-exists-p (concat user-init-file ".elc"))
(delete-file (concat user-init-file ".elc")))
(byte-compile-file user-init-file)
(message "%s compiled" user-init-file)))


;Hide blank lines between headlines in collapsed views
(setq org-cycle-separator-lines 2)

;The following setting prevents creating blank lines before headings but
;allows list items to adapt to existing blank line behaviour:
(setq org-blank-before-new-entry (quote ((heading)
                                         (plain-list-item . auto))))

(setq org-table-export-default-format "orgtbl-to-csv")

;(set-face-attribute 'default nil :font "Anonymous Pro 16")

(define-key global-map "\C-cc" 'org-capture)
(setq org-directory "~/writings")
(setq org-default-notes-file "/notes.org")

(setq org-capture-templates
      (quote (("m" "Musings" entry (file+datetree "~/writings/notes/musings.org")
	       "* %? %^G \n\nEntered on %T\n")
	      )))

;	      ("a" "Administration of system" entry (file+datatree "~/writings/notes/admin.org")
;	       "Added: %T")
;	      ("d" "Diary" entry (file+datatree "~/writings/notes/diary.org")
;	       "Added: %T")
;	      ("n" "Notes to remember" entry (file+datatree "~/writings/notes/notes.org")
;	       "* %^{Description} %^G
;Added: %T
;	       %?"))))



;'(org-capture-templates 
;(quote (
;("a" "Appointment" entry (file+headline 
;"~/writings/notes/calendar.org" "Calendar") "* APPT %^{Description} %^g
;%?
;Added: %U") 
;
;("n" "Notes" entry (file+datetree 
;"~/writings/notes/notes.org") "* %^{Description} %^g %? 
;Added: %U") 
;
;("t" "Task Diary" entry (file+datetree 
;"~/writings/notes/taskdiary.org") "* TODO %^{Description}  %^g
;%?
;Added: %U") 
;
;("j" "Journal" entry (file+datetree 
;"~/writings/notes/journal.org") "** %^{Heading}")  
;
;("l" "Log Time" entry (file+datetree 
;"~/writings/notes/logtime.org" ) "** %U - %^{Activity}  :TIME:")
;)))


