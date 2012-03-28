;;; darkburn-theme.el --- A low contrast color theme for Emacs.

;; Copyright (C) 2011 Bozhidar Batsov

;; Author: Bozhidar Batsov <bozhidar.batsov@gmail.com>
;; URL: http://github.com/bbatsov/darkburn-emacs
;; Version: 1.4

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; A port of the popular Vim theme darkburn for Emacs 24, built on top of
;; the new built-in theme support in Emacs 24. There exists one other version of the
;; theme by Daniel Brockman. My version was originally based on it,
;; but it was in such a disarray, that I decided to rewrite it from
;; scratch in a more maintainable manner (hopefully).
;;
;;; Installation:
;;
;;   Drop the theme in a folder that is on `custom-theme-load-path'
;; and enjoy!
;;
;; Don't forget that the theme requires Emacs 24.
;;
;;; Bugs
;;
;; None that I'm aware of.
;;
;;; Credits
;;
;; Jani Nurminen created the original theme for vim on such this port
;; is based.
;;
;;; Code
(deftheme darkburn "The darkburn color theme")

(let ((class '((class color) (min-colors 89)))
      ;; darkburn palette
      ;; colors with +x are lighter, colors with -x are darker
      ;(darkburn-fg "#dcdccc")
      (darkburn-fg "#ffffff")
      (darkburn-fg-1 "#656555")
      (darkburn-bg-1 "#2b2b2b")
      (darkburn-bg-05 "#383838")
      ;(darkburn-bg "#3f3f3f")
      (darkburn-bg "#212121")
      (darkburn-bg+1 "#4f4f4f")
      (darkburn-bg+2 "#5f5f5f")
      (darkburn-bg+3 "#6f6f6f")
      (darkburn-red+1 "#9fbfd6")
      (darkburn-red "#b75151")
      (darkburn-red-1 "#bc8383")
      (darkburn-red-2 "#ac7373")
      (darkburn-red-3 "#9c6363")
      (darkburn-red-4 "#8c5353")
      (darkburn-orange "#dfaf8f")
      (darkburn-yellow "#f0dfaf")
      ;(darkburn-yellow "#efef8f")
      (darkburn-yellow-1 "#e0cf9f")
      (darkburn-yellow-2 "#d0bf8f")
      (darkburn-green-1 "#5f7f5f")
      (darkburn-green "#7f9f7f")
      (darkburn-green+1 "#8fb28f")
      (darkburn-green+2 "#9fc59f")
      (darkburn-green+3 "#afd8af")
      ;(darkburn-green+4 "#bfebbf")
      (darkburn-green+4 "#6fb86b")
      (darkburn-cyan "#93e0e3")
      (darkburn-blue+1 "#94bff3")
      (darkburn-blue "#8cd0d3")
      (darkburn-blue-1 "#7cb8bb")
      (darkburn-blue-2 "#6ca0a3")
      (darkburn-blue-3 "#5c888b")
      (darkburn-blue-4 "#4c7073")
      (darkburn-blue-5 "#366060")
      (darkburn-magenta "#dc8cc3"))
  (custom-theme-set-faces
   'darkburn
   '(button ((t (:underline t))))
   `(link ((,class (:foreground ,darkburn-yellow :underline t :weight bold))))
   `(link-visited ((,class (:foreground ,darkburn-yellow-2 :underline t :weight normal))))

   ;;; basic coloring
   `(default ((,class (:foreground ,darkburn-fg :background ,darkburn-bg))))
   `(cursor ((,class (:foreground ,darkburn-fg))))
   `(escape-glyph-face ((,class (:foreground ,darkburn-red))))
   `(fringe ((,class (:foreground ,darkburn-fg :background ,darkburn-bg+1))))
   `(header-line ((,class (:foreground ,darkburn-yellow
                                       :background ,darkburn-bg-1
                                       :box (:line-width -1 :style released-button)))))
   `(highlight ((,class (:background ,darkburn-bg-05))))

   ;;; compilation
   `(compilation-column-face ((,class (:foreground ,darkburn-yellow))))
   `(compilation-enter-directory-face ((,class (:foreground ,darkburn-green))))
   `(compilation-error-face ((,class (:foreground ,darkburn-red-1 :weight bold :underline t))))
   `(compilation-face ((,class (:foreground ,darkburn-fg))))
   `(compilation-info-face ((,class (:foreground ,darkburn-blue))))
   `(compilation-info ((,class (:foreground ,darkburn-green+4 :underline t))))
   `(compilation-leave-directory-face ((,class (:foreground ,darkburn-green))))
   `(compilation-line-face ((,class (:foreground ,darkburn-yellow))))
   `(compilation-line-number ((,class (:foreground ,darkburn-yellow))))
   `(compilation-message-face ((,class (:foreground ,darkburn-blue))))
   `(compilation-warning-face ((,class (:foreground ,darkburn-yellow-1 :weight bold :underline t))))

   ;;; grep
   `(grep-context-face ((,class (:foreground ,darkburn-fg))))
   `(grep-error-face ((,class (:foreground ,darkburn-red-1 :weight bold :underline t))))
   `(grep-hit-face ((,class (:foreground ,darkburn-blue))))
   `(grep-match-face ((,class (:foreground ,darkburn-orange :weight bold))))
   `(match ((,class (:background ,darkburn-bg-1 :foreground ,darkburn-orange :weight bold))))

   ;; faces used by isearch
   `(isearch ((,class (:foreground ,darkburn-yellow :background ,darkburn-bg-1))))
   `(isearch-fail ((,class (:foreground ,darkburn-fg :background ,darkburn-red-4))))
   `(lazy-highlight ((,class (:foreground ,darkburn-yellow :background ,darkburn-bg+2))))

   `(menu ((,class (:foreground ,darkburn-fg :background ,darkburn-bg))))
   `(minibuffer-prompt ((,class (:foreground ,darkburn-yellow))))
   `(mode-line
     ((,class (:foreground ,darkburn-green+1
                           :background ,darkburn-bg-1
                           :box (:line-width -1 :style released-button)))))
   `(mode-line-buffer-id ((,class (:foreground ,darkburn-yellow :weight bold))))
   `(mode-line-inactive
     ((,class (:foreground ,darkburn-green-1
                           :background ,darkburn-bg-05
                           :box (:line-width -1 :style released-button)))))
   `(region ((,class (:background ,darkburn-bg-1))))
   `(secondary-selection ((,class (:background ,darkburn-bg+2))))
   `(trailing-whitespace ((,class (:background ,darkburn-red))))
   `(vertical-border ((,class (:foreground ,darkburn-fg))))

   ;;; font lock
   `(font-lock-builtin-face ((,class (:foreground ,darkburn-blue))))
   `(font-lock-comment-face ((,class (:foreground ,darkburn-green))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,darkburn-green))))
   `(font-lock-constant-face ((,class (:foreground ,darkburn-green+4))))
   `(font-lock-doc-face ((,class (:foreground ,darkburn-green+1))))
   `(font-lock-doc-string-face ((,class (:foreground ,darkburn-blue+1))))
   `(font-lock-function-name-face ((,class (:foreground ,darkburn-blue))))
   `(font-lock-keyword-face ((,class (:foreground ,darkburn-yellow :weight bold))))
   `(font-lock-negation-char-face ((,class (:foreground ,darkburn-fg))))
   `(font-lock-preprocessor-face ((,class (:foreground ,darkburn-blue))))
   `(font-lock-string-face ((,class (:foreground ,darkburn-red))))
   `(font-lock-type-face ((,class (:foreground ,darkburn-blue))))
   `(font-lock-variable-name-face ((,class (:foreground ,darkburn-orange))))
   `(font-lock-warning-face ((,class (:foreground ,darkburn-yellow-1 :weight bold :underline t))))

   `(c-annotation-face ((,class (:inherit font-lock-constant-face))))

   ;;; external

   ;; full-ack
   `(ack-separator ((,class (:foreground ,darkburn-fg))))
   `(ack-file ((,class (:foreground ,darkburn-blue))))
   `(ack-line ((,class (:foreground ,darkburn-yellow))))
   `(ack-match ((,class (:foreground ,darkburn-orange :background ,darkburn-bg-1 :weigth bold))))

   ;; auctex
   `(font-latex-bold ((,class (:inherit bold))))
   `(font-latex-warning ((,class (:inherit font-lock-warning))))
   `(font-latex-sedate ((,class (:foreground ,darkburn-yellow :weight bold ))))
   `(font-latex-title-4 ((,class (:inherit variable-pitch :weight bold))))

   ;; auto-complete
   `(ac-candidate-face ((,class (:background ,darkburn-bg+3 :foreground "black"))))
   `(ac-selection-face ((,class (:background ,darkburn-blue-4 :foreground ,darkburn-fg))))
   `(popup-tip-face ((,class (:background ,darkburn-yellow-2 :foreground "black"))))
   `(popup-scroll-bar-foreground-face ((,class (:background ,darkburn-blue-5))))
   `(popup-scroll-bar-background-face ((,class (:background ,darkburn-bg-1))))
   `(popup-isearch-match ((,class (:background ,darkburn-bg :foreground ,darkburn-fg))))

   ;; diff
   `(diff-added ((,class (:foreground ,darkburn-green+4))))
   `(diff-changed ((,class (:foreground ,darkburn-yellow))))
   `(diff-removed ((,class (:foreground ,darkburn-red))))
   `(diff-header ((,class (:background ,darkburn-bg+1))))
   `(diff-file-header
     ((,class (:background ,darkburn-bg+2 :foreground ,darkburn-fg :bold t))))

   ;; eshell
   `(eshell-prompt ((,class (:foreground ,darkburn-yellow :weight bold))))
   `(eshell-ls-archive ((,class (:foreground ,darkburn-red-1 :weight bold))))
   `(eshell-ls-backup ((,class (:inherit font-lock-comment))))
   `(eshell-ls-clutter ((,class (:inherit font-lock-comment))))
   `(eshell-ls-directory ((,class (:foreground ,darkburn-blue+1 :weight bold))))
   `(eshell-ls-executable ((,class (:foreground ,darkburn-red+1 :weight bold))))
   `(eshell-ls-unreadable ((,class (:foreground ,darkburn-fg))))
   `(eshell-ls-missing ((,class (:inherit font-lock-warning))))
   `(eshell-ls-product ((,class (:inherit font-lock-doc))))
   `(eshell-ls-special ((,class (:foreground ,darkburn-yellow :weight bold))))
   `(eshell-ls-symlink ((,class (:foreground ,darkburn-cyan :weight bold))))

   ;; flymake
   `(flymake-errline ((,class (:foreground ,darkburn-red-1 :weight bold :underline t))))
   `(flymake-warnline ((,class (:foreground ,darkburn-yellow-1 :weight bold :underline t))))

   ;; flyspell
   `(flyspell-duplicate ((,class (:foreground ,darkburn-yellow-1 :weight bold :underline t))))
   `(flyspell-incorrect ((,class (:foreground ,darkburn-red-1 :weight bold :underline t))))

   ;; erc
   `(erc-action-face ((,class (:inherit erc-default-face))))
   `(erc-bold-face ((,class (:weight bold))))
   `(erc-current-nick-face ((,class (:foreground ,darkburn-blue :weight bold))))
   `(erc-dangerous-host-face ((,class (:inherit font-lock-warning))))
   `(erc-default-face ((,class (:foreground ,darkburn-fg))))
   `(erc-direct-msg-face ((,class (:inherit erc-default))))
   `(erc-error-face ((,class (:inherit font-lock-warning))))
   `(erc-fool-face ((,class (:inherit erc-default))))
   `(erc-highlight-face ((,class (:inherit hover-highlight))))
   `(erc-input-face ((,class (:foreground ,darkburn-yellow))))
   `(erc-keyword-face ((,class (:foreground ,darkburn-blue :weight bold))))
   `(erc-nick-default-face ((,class (:foreground ,darkburn-yellow :weight bold))))
   `(erc-my-nick-face ((,class (:foreground ,darkburn-red :weigth bold))))
   `(erc-nick-msg-face ((,class (:inherit erc-default))))
   `(erc-notice-face ((,class (:foreground ,darkburn-green))))
   `(erc-pal-face ((,class (:foreground ,darkburn-orange :weight bold))))
   `(erc-prompt-face ((,class (:foreground ,darkburn-orange :background ,darkburn-bg :weight bold))))
   `(erc-timestamp-face ((,class (:foreground ,darkburn-green+1))))
   `(erc-underline-face ((t (:underline t))))

   ;; gnus
   `(gnus-group-mail-1 ((,class (:bold t :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty ((,class (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2 ((,class (:bold t :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty ((,class (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3 ((,class (:bold t :inherit gnus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty ((,class (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4 ((,class (:bold t :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty ((,class (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5 ((,class (:bold t :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty ((,class (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6 ((,class (:bold t :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty ((,class (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low ((,class (:bold t :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty ((,class (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1 ((,class (:bold t :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2 ((,class (:bold t :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3 ((,class (:bold t :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4 ((,class (:bold t :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5 ((,class (:bold t :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6 ((,class (:bold t :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low ((,class (:bold t :inherit gnus-group-news-low-empty))))
   `(gnus-header-content ((,class (:inherit message-header-other))))
   `(gnus-header-from ((,class (:inherit message-header-from))))
   `(gnus-header-name ((,class (:inherit message-header-name))))
   `(gnus-header-newsgroups ((,class (:inherit message-header-other))))
   `(gnus-header-subject ((,class (:inherit message-header-subject))))
   `(gnus-summary-cancelled ((,class (:foreground ,darkburn-orange))))
   `(gnus-summary-high-ancient ((,class (:foreground ,darkburn-blue))))
   `(gnus-summary-high-read ((,class (:foreground ,darkburn-green :weight bold))))
   `(gnus-summary-high-ticked ((,class (:foreground ,darkburn-orange :weight bold))))
   `(gnus-summary-high-unread ((,class (:foreground ,darkburn-fg :weight bold))))
   `(gnus-summary-low-ancient ((,class (:foreground ,darkburn-blue))))
   `(gnus-summary-low-read ((t (:foreground ,darkburn-green))))
   `(gnus-summary-low-ticked ((,class (:foreground ,darkburn-orange :weight bold))))
   `(gnus-summary-low-unread ((,class (:foreground ,darkburn-fg))))
   `(gnus-summary-normal-ancient ((,class (:foreground ,darkburn-blue))))
   `(gnus-summary-normal-read ((,class (:foreground ,darkburn-green))))
   `(gnus-summary-normal-ticked ((,class (:foreground ,darkburn-orange :weight bold))))
   `(gnus-summary-normal-unread ((,class (:foreground ,darkburn-fg))))
   `(gnus-summary-selected ((,class (:foreground ,darkburn-yellow :weight bold))))
   `(gnus-cite-1 ((,class (:foreground ,darkburn-blue))))
   `(gnus-cite-10 ((,class (:foreground ,darkburn-yellow-1))))
   `(gnus-cite-11 ((,class (:foreground ,darkburn-yellow))))
   `(gnus-cite-2 ((,class (:foreground ,darkburn-blue-1))))
   `(gnus-cite-3 ((,class (:foreground ,darkburn-blue-2))))
   `(gnus-cite-4 ((,class (:foreground ,darkburn-green+2))))
   `(gnus-cite-5 ((,class (:foreground ,darkburn-green+1))))
   `(gnus-cite-6 ((,class (:foreground ,darkburn-green))))
   `(gnus-cite-7 ((,class (:foreground ,darkburn-red))))
   `(gnus-cite-8 ((,class (:foreground ,darkburn-red-1))))
   `(gnus-cite-9 ((,class (:foreground ,darkburn-red-2))))
   `(gnus-group-news-1-empty ((,class (:foreground ,darkburn-yellow))))
   `(gnus-group-news-2-empty ((,class (:foreground ,darkburn-green+3))))
   `(gnus-group-news-3-empty ((,class (:foreground ,darkburn-green+1))))
   `(gnus-group-news-4-empty ((,class (:foreground ,darkburn-blue-2))))
   `(gnus-group-news-5-empty ((,class (:foreground ,darkburn-blue-3))))
   `(gnus-group-news-6-empty ((,class (:foreground ,darkburn-bg+2))))
   `(gnus-group-news-low-empty ((,class (:foreground ,darkburn-bg+2))))
   `(gnus-signature ((,class (:foreground ,darkburn-yellow))))
   `(gnus-x ((,class (:background ,darkburn-fg :foreground ,darkburn-bg))))

   ;; helm
   `(helm-selection ((,class (:background ,darkburn-bg-1))))

   ;; hl-line-mode
   `(hl-line-face ((,class (:background ,darkburn-bg-1))))

   ;; ido-mode
   `(ido-first-match ((,class (:foreground ,darkburn-yellow :weight bold))))
   `(ido-only-match ((,class (:foreground ,darkburn-orange :weight bold))))
   `(ido-subdir ((,class (:foreground ,darkburn-yellow))))

   ;; js2-mode
   `(js2-warning-face ((,class (:underline ,darkburn-orange))))
   `(js2-error-face ((,class (:foreground ,darkburn-red :weight bold))))
   `(js2-jsdoc-tag-face ((,class (:foreground ,darkburn-green-1))))
   `(js2-jsdoc-type-face ((,class (:foreground ,darkburn-green+2))))
   `(js2-jsdoc-value-face ((,class (:foreground ,darkburn-green+3))))
   `(js2-function-param-face ((,class (:foreground, darkburn-green+3))))
   `(js2-external-variable-face ((,class (:foreground ,darkburn-orange))))

   ;; jabber-mode
   `(jabber-roster-user-away ((,class (:foreground ,darkburn-green+2))))
   `(jabber-roster-user-online ((,class (:foreground ,darkburn-blue-1))))
   `(jabber-roster-user-dnd ((,class (:foreground ,darkburn-red+1))))
   `(jabber-rare-time-face ((,class (:foreground ,darkburn-green+1))))
   `(jabber-chat-prompt-local ((,class (:foreground ,darkburn-blue-1))))
   `(jabber-chat-prompt-foreign ((,class (:foreground ,darkburn-red+1))))
   `(jabber-activity-face((,class (:foreground ,darkburn-red+1))))
   `(jabber-activity-personal-face ((,class (:foreground ,darkburn-blue+1))))
   `(jabber-title-small ((,class (:height 1.1 :weight bold))))
   `(jabber-title-medium ((,class (:height 1.2 :weight bold))))
   `(jabber-title-large ((,class (:height 1.3 :weight bold))))

   ;; linum-mode
   `(linum ((,class (:foreground ,darkburn-green+2 :background ,darkburn-bg))))

   ;; magit
   `(magit-section-title ((,class (:foreground ,darkburn-yellow :weight bold))))
   `(magit-branch ((,class (:foreground ,darkburn-orange :weight bold))))

   ;; message-mode
   `(message-cited-text ((,class (:inherit font-lock-comment))))
   `(message-header-name ((,class (:foreground ,darkburn-green+1))))
   `(message-header-other ((,class (:foreground ,darkburn-green))))
   `(message-header-to ((,class (:foreground ,darkburn-yellow :weight bold))))
   `(message-header-from ((,class (:foreground ,darkburn-yellow :weight bold))))
   `(message-header-cc ((,class (:foreground ,darkburn-yellow :weight bold))))
   `(message-header-newsgroups ((,class (:foreground ,darkburn-yellow :weight bold))))
   `(message-header-subject ((,class (:foreground ,darkburn-orange :weight bold))))
   `(message-header-xheader ((,class (:foreground ,darkburn-green))))
   `(message-mml ((,class (:foreground ,darkburn-yellow :weight bold))))
   `(message-separator ((,class (:inherit font-lock-comment))))

   ;; mew
   `(mew-face-header-subject ((,class (:foreground ,darkburn-orange))))
   `(mew-face-header-from ((,class (:foreground ,darkburn-yellow))))
   `(mew-face-header-date ((,class (:foreground ,darkburn-green))))
   `(mew-face-header-to ((,class (:foreground ,darkburn-red))))
   `(mew-face-header-key ((,class (:foreground ,darkburn-green))))
   `(mew-face-header-private ((,class (:foreground ,darkburn-green))))
   `(mew-face-header-important ((,class (:foreground ,darkburn-blue))))
   `(mew-face-header-marginal ((,class (:foreground ,darkburn-fg :weight bold))))
   `(mew-face-header-warning ((,class (:foreground ,darkburn-red))))
   `(mew-face-header-xmew ((,class (:foreground ,darkburn-green))))
   `(mew-face-header-xmew-bad ((,class (:foreground ,darkburn-red))))
   `(mew-face-body-url ((,class (:foreground ,darkburn-orange))))
   `(mew-face-body-comment ((,class (:foreground ,darkburn-fg :slant italic))))
   `(mew-face-body-cite1 ((,class (:foreground ,darkburn-green))))
   `(mew-face-body-cite2 ((,class (:foreground ,darkburn-blue))))
   `(mew-face-body-cite3 ((,class (:foreground ,darkburn-orange))))
   `(mew-face-body-cite4 ((,class (:foreground ,darkburn-yellow))))
   `(mew-face-body-cite5 ((,class (:foreground ,darkburn-red))))
   `(mew-face-mark-review ((,class (:foreground ,darkburn-blue))))
   `(mew-face-mark-escape ((,class (:foreground ,darkburn-green))))
   `(mew-face-mark-delete ((,class (:foreground ,darkburn-red))))
   `(mew-face-mark-unlink ((,class (:foreground ,darkburn-yellow))))
   `(mew-face-mark-refile ((,class (:foreground ,darkburn-green))))
   `(mew-face-mark-unread ((,class (:foreground ,darkburn-red-2))))
   `(mew-face-eof-message ((,class (:foreground ,darkburn-green))))
   `(mew-face-eof-part ((,class (:foreground ,darkburn-yellow))))

   ;; nav
   `(nav-face-heading ((,class (:foreground ,darkburn-yellow))))
   `(nav-face-button-num ((,class (:foreground ,darkburn-cyan))))
   `(nav-face-dir ((,class (:foreground ,darkburn-green))))
   `(nav-face-hdir ((,class (:foreground ,darkburn-red))))
   `(nav-face-file ((,class (:foreground ,darkburn-fg))))
   `(nav-face-hfile ((,class (:foreground ,darkburn-red-4))))

   ;; org-mode
   `(org-agenda-date-today
     ((,class (:foreground "white" :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((,class (:inherit font-lock-comment-face))))
   `(org-archived ((,class (:foreground ,darkburn-fg :weight bold))))
   `(org-checkbox ((,class (:background ,darkburn-bg+2 :foreground "white"
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((,class (:foreground ,darkburn-blue :underline t))))
   `(org-deadline-announce ((,class (:foreground ,darkburn-red-1))))
   `(org-done ((,class (:bold t :weight bold :foreground ,darkburn-green+3))))
   `(org-formula ((,class (:foreground ,darkburn-yellow-2))))
   `(org-headline-done ((,class (:foreground ,darkburn-green+3))))
   `(org-hide ((,class (:foreground ,darkburn-bg-1))))
   `(org-level-1 ((,class (:foreground ,darkburn-orange))))
   `(org-level-2 ((,class (:foreground ,darkburn-green+1))))
   `(org-level-3 ((,class (:foreground ,darkburn-blue-1))))
   `(org-level-4 ((,class (:foreground ,darkburn-yellow-2))))
   `(org-level-5 ((,class (:foreground ,darkburn-cyan))))
   `(org-level-6 ((,class (:foreground ,darkburn-green-1))))
   `(org-level-7 ((,class (:foreground ,darkburn-red-4))))
   `(org-level-8 ((,class (:foreground ,darkburn-blue-4))))
   `(org-link ((,class (:foreground ,darkburn-yellow-2 :underline t))))
   `(org-scheduled ((,class (:foreground ,darkburn-green+4))))
   `(org-scheduled-previously ((,class (:foreground ,darkburn-red-4))))
   `(org-scheduled-today ((,class (:foreground ,darkburn-blue+1))))
   `(org-special-keyword ((,class (:foreground ,darkburn-yellow-1))))
   `(org-table ((,class (:foreground ,darkburn-green+2))))
   `(org-tag ((,class (:bold t :weight bold))))
   `(org-time-grid ((,class (:foreground ,darkburn-orange))))
   `(org-todo ((,class (:bold t :foreground ,darkburn-red :weight bold))))
   `(org-upcoming-deadline ((,class (:inherit font-lock-keyword-face))))
   `(org-warning ((,class (:bold t :foreground ,darkburn-red :weight bold))))

   ;; outline
   `(outline-8 ((,class (:inherit default))))
   `(outline-7 ((,class (:inherit outline-8 :height 1.0))))
   `(outline-6 ((,class (:inherit outline-7 :height 1.0))))
   `(outline-5 ((,class (:inherit outline-6 :height 1.0))))
   `(outline-4 ((,class (:inherit outline-5 :height 1.0))))
   `(outline-3 ((,class (:inherit outline-4 :height 1.0))))
   `(outline-2 ((,class (:inherit outline-3 :height 1.0))))
   `(outline-1 ((,class (:inherit outline-2 :height 1.0))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((,class (:foreground ,darkburn-cyan))))
   `(rainbow-delimiters-depth-2-face ((,class (:foreground ,darkburn-yellow))))
   `(rainbow-delimiters-depth-3-face ((,class (:foreground ,darkburn-blue+1))))
   `(rainbow-delimiters-depth-4-face ((,class (:foreground ,darkburn-red+1))))
   `(rainbow-delimiters-depth-5-face ((,class (:foreground ,darkburn-orange))))
   `(rainbow-delimiters-depth-6-face ((,class (:foreground ,darkburn-blue-1))))
   `(rainbow-delimiters-depth-7-face ((,class (:foreground ,darkburn-green+4))))
   `(rainbow-delimiters-depth-8-face ((,class (:foreground ,darkburn-red-3))))
   `(rainbow-delimiters-depth-9-face ((,class (:foreground ,darkburn-yellow-2))))
   `(rainbow-delimiters-depth-10-face ((,class (:foreground ,darkburn-green+2))))
   `(rainbow-delimiters-depth-11-face ((,class (:foreground ,darkburn-blue+1))))
   `(rainbow-delimiters-depth-12-face ((,class (:foreground ,darkburn-red-4))))

   ;; rpm-mode
   `(rpm-spec-dir-face ((,class (:foreground ,darkburn-green))))
   `(rpm-spec-doc-face ((,class (:foreground ,darkburn-green))))
   `(rpm-spec-ghost-face ((,class (:foreground ,darkburn-red))))
   `(rpm-spec-macro-face ((,class (:foreground ,darkburn-yellow))))
   `(rpm-spec-obsolete-tag-face ((,class (:foreground ,darkburn-red))))
   `(rpm-spec-package-face ((,class (:foreground ,darkburn-red))))
   `(rpm-spec-section-face ((,class (:foreground ,darkburn-yellow))))
   `(rpm-spec-tag-face ((,class (:foreground ,darkburn-blue))))
   `(rpm-spec-var-face ((,class (:foreground ,darkburn-red))))

   ;; rst-mode
   `(rst-level-1-face ((,class (:foreground ,darkburn-orange))))
   `(rst-level-2-face ((,class (:foreground ,darkburn-green+1))))
   `(rst-level-3-face ((,class (:foreground ,darkburn-blue-1))))
   `(rst-level-4-face ((,class (:foreground ,darkburn-yellow-2))))
   `(rst-level-5-face ((,class (:foreground ,darkburn-cyan))))
   `(rst-level-6-face ((,class (:foreground ,darkburn-green-1))))

   ;; show-paren
   `(show-paren-mismatch ((,class (:foreground ,darkburn-red-3 :background ,darkburn-bg :weight bold))))
   `(show-paren-match ((,class (:foreground ,darkburn-blue-1 :background ,darkburn-bg :weight bold))))

   ;; SLIME
   `(slime-repl-inputed-output-face ((,class (:foreground ,darkburn-red))))

   ;; whitespace-mode
   `(whitespace-space ((,class (:background ,darkburn-bg :foreground ,darkburn-bg+1))))
   `(whitespace-hspace ((,class (:background ,darkburn-bg :foreground ,darkburn-bg+1))))
   `(whitespace-tab ((,class (:background ,darkburn-bg :foreground ,darkburn-red))))
   `(whitespace-newline ((,class (:foreground ,darkburn-bg+1))))
   `(whitespace-trailing ((,class (:foreground ,darkburn-red :background ,darkburn-bg))))
   `(whitespace-line ((,class (:background ,darkburn-bg-05 :foreground ,darkburn-magenta))))
   `(whitespace-space-before-tab ((,class (:background ,darkburn-orange :foreground ,darkburn-orange))))
   `(whitespace-indentation ((,class (:background ,darkburn-yellow :foreground ,darkburn-red))))
   `(whitespace-empty ((,class (:background ,darkburn-yellow :foreground ,darkburn-red))))
   `(whitespace-space-after-tab ((,class (:background ,darkburn-yellow :foreground ,darkburn-red))))

   ;; wanderlust
   `(wl-highlight-folder-few-face ((,class (:foreground ,darkburn-red-2))))
   `(wl-highlight-folder-many-face ((,class (:foreground ,darkburn-red-1))))
   `(wl-highlight-folder-path-face ((,class (:foreground ,darkburn-orange))))
   `(wl-highlight-folder-unread-face ((,class (:foreground ,darkburn-blue))))
   `(wl-highlight-folder-zero-face ((,class (:foreground ,darkburn-fg))))
   `(wl-highlight-folder-unknown-face ((,class (:foreground ,darkburn-blue))))
   `(wl-highlight-message-citation-header ((,class (:foreground ,darkburn-red-1))))
   `(wl-highlight-message-cited-text-1 ((,class (:foreground ,darkburn-red))))
   `(wl-highlight-message-cited-text-2 ((,class (:foreground ,darkburn-green+2))))
   `(wl-highlight-message-cited-text-3 ((,class (:foreground ,darkburn-blue))))
   `(wl-highlight-message-cited-text-4 ((,class (:foreground ,darkburn-blue+1))))
   `(wl-highlight-message-header-contents-face ((,class (:foreground ,darkburn-green))))
   `(wl-highlight-message-headers-face ((,class (:foreground ,darkburn-red+1))))
   `(wl-highlight-message-important-header-contents ((,class (:foreground ,darkburn-green+2))))
   `(wl-highlight-message-header-contents ((,class (:foreground ,darkburn-green+1))))
   `(wl-highlight-message-important-header-contents2 ((,class (:foreground ,darkburn-green+2))))
   `(wl-highlight-message-signature ((,class (:foreground ,darkburn-green))))
   `(wl-highlight-message-unimportant-header-contents ((,class (:foreground ,darkburn-fg))))
   `(wl-highlight-summary-answered-face ((,class (:foreground ,darkburn-blue))))
   `(wl-highlight-summary-disposed-face ((,class (:foreground ,darkburn-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((,class (:foreground ,darkburn-blue))))
   `(wl-highlight-summary-normal-face ((,class (:foreground ,darkburn-fg))))
   `(wl-highlight-summary-thread-top-face ((,class (:foreground ,darkburn-yellow))))
   `(wl-highlight-thread-indent-face ((,class (:foreground ,darkburn-magenta))))
   `(wl-highlight-summary-refiled-face ((,class (:foreground ,darkburn-fg))))
   `(wl-highlight-summary-displaying-face ((,class (:underline t :weight bold))))

   ;; which-func-mode
   `(which-func ((,class (:foreground ,darkburn-green+1)))))

  ;;; custom theme variables
  (custom-theme-set-variables
   'darkburn
   `(ansi-color-names-vector [,darkburn-bg ,darkburn-red ,darkburn-green ,darkburn-yellow
                                          ,darkburn-blue ,darkburn-magenta ,darkburn-cyan ,darkburn-fg])

   ;; fill-column-indicator
   `(fci-rule-color ,darkburn-bg-05)))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'darkburn)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; darkburn-theme.el ends here.
