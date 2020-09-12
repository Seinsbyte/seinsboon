;;; boon-seins-qwerty.el --- An Ergonomic Command Mode  -*- lexical-binding: t -*-

;;; Commentary:
;;; Code:
(require 'boon)
(require 'boon-seins-functions)

;; Select Maps

(define-key boon-select-map "q"  'boon-select-inside-quotes)
(define-key boon-select-map "Q"  'boon-select-outside-quotes)

(define-key boon-select-map "w"  'boon-select-word)

(define-key boon-select-map "e"  'boon-select-sentence)

(define-key boon-select-map "t"  'boon-select-org-table-cell) ;; Table
(define-key boon-select-map "T"  'boon-select-org-tree) ;; Tree

(define-key boon-select-map "g"  'boon-select-paragraph)

(define-key boon-select-map "a"  'boon-select-borders) ;; Around
(define-key boon-select-map "s"  'boon-select-wim) ;; symbol
(define-key boon-select-map "v"  'boon-select-with-spaces)
(define-key boon-select-map "d"  'boon-select-document)

(define-key boon-select-map "C"  'boon-select-comment)
(define-key boon-select-map "x"  'boon-select-outside-pairs) ;; eXpression
(define-key boon-select-map "c"  'boon-select-inside-pairs) ;; Contents

(define-key boon-select-map "z"  'boon-select-content) ;; inZide

(define-key boon-select-map "b"  'boon-select-blanks) ;; blanKs

;; RIGHT HAND - MOVEMENTS

;; TOP ROW

(define-key boon-moves-map "y"  '("fYnd" . xref-find-definitions))
(define-key boon-moves-map "Y"  'xref-find-references)

(define-key boon-moves-map "u"  'boon-beginning-of-line)

(define-key boon-moves-map "i"  'previous-line)
(define-key boon-moves-map "I"  'backward-paragraph)

(define-key boon-moves-map "o"  'next-line)
(define-key boon-moves-map "O"  'forward-paragraph)

(define-key boon-moves-map "p"  'boon-end-of-line)

;; HOME ROW
(define-key boon-moves-map "h"  '("hop" . avy-goto-word-1))
(define-key boon-moves-map "H"  'avy-goto-char)

(define-key boon-moves-map "j" 'backward-word)
(define-key boon-moves-map "J" 'backward-sentence)

(define-key boon-moves-map "k"  'backward-char)
(define-key boon-moves-map "K"  'boon-smarter-upward)

(define-key boon-moves-map "l"  'forward-char)
(define-key boon-moves-map "L"  'boon-smarter-downward)

(define-key boon-moves-map ";" 'forward-word)
(define-key boon-moves-map ":" 'forward-sentence)


;; BOTTOM ROW

(define-key boon-moves-map "n" '("noon walk" . boon-switch-mark))
(define-key boon-moves-map "N" 'xref-pop-marker-stack)

(define-key boon-moves-map ","  'boon-beginning-of-expression)
(define-key boon-moves-map "<"  'beginning-of-buffer)

(define-key boon-moves-map "."  'boon-end-of-expression)
(define-key boon-moves-map ">"  'end-of-buffer)

;; NUMBERS
(define-key boon-command-map "8"  'xah-backward-quote)
(define-key boon-command-map "9"  'xah-forward-quote-smart)

(define-key boon-command-map "*"  'xah-backward-left-bracket)
(define-key boon-command-map "("  'xah-forward-right-bracket)

(define-key boon-command-map "0" 'universal-argument)


;; LEFT HAND - COMMANDS

;; TOP ROW

(define-key boon-command-map "q" 'undo)
(define-key boon-command-map "Q" '("quote" . boon-quote-character))

(define-key boon-moves-map "w" '("where was?" . boon-backward-search-map))
(define-key boon-moves-map "e" '("elsewhere?" . boon-forward-search-map))

(define-key boon-moves-map "W"  'boon-qsearch-previous)
(define-key boon-moves-map "E"  'boon-qsearch-next)

(define-key boon-command-map "r" 'swiper-isearch) ; occuR
(define-key boon-command-map "R" 'kmacro-start-macro) ; Record


(define-key boon-command-map "t" '("transform" . boon-replace-by-character))


;; HOME ROW

(define-key boon-command-map "a" '("around" . boon-enclose))
(define-key boon-command-map "A" 'xah-close-current-buffer)

(define-key boon-command-map "s" '("substitute" . boon-substitute-region))

(define-key boon-command-map "d" '("delete" . boon-take-region)) ; "delete"
(define-key boon-command-map "D" 'boon-treasure-region) ; "duplicate"

(define-key boon-command-map "f" '("fetch" . boon-splice))
(define-key boon-command-map "F" 'yank-pop)

(define-key boon-command-map "G" '("goto" . boon-goto-map))
(define-key boon-command-map "g" 'counsel-git-grep)



;; BOTTOM ROW

(define-key boon-command-map "z" '("repeat" . boon-repeat-command))
(define-key boon-command-map "Z" 'point-to-register)

(define-key boon-command-map "x" 'boon-x-map)
(define-key boon-command-map "X" 'jump-to-register)

(define-key boon-command-map "c" 'boon-c-god)
(define-key boon-command-map "C" 'comment-or-uncomment-region)

(define-key boon-command-map (kbd "C-v") 'boon-open-line-and-insert)
(define-key boon-command-map "V" 'boon-open-next-line-and-insert)
(define-key boon-command-map "v" '("v looks like an insert mark" . boon-set-insert-like-state))

(define-key boon-command-map "b" 'insert-register)
(define-key boon-command-map "B" 'boon-copy-to-register) ; bank

;; NUMBERS

(define-key boon-command-map "1"  'xah-shrink-whitespaces) ; 1 space
(define-key boon-command-map "2"  'eval-region-and-deactivate)
(define-key boon-command-map "3"  'split-window-right)
(define-key boon-command-map "4"  'delete-other-windows)


;; Most of these are actually in the boon-moves-map; however some don't quite work there; so they end up here.
(define-key boon-command-map (kbd "C-k") 'scroll-down-line)
(define-key boon-command-map (kbd "C-l") 'scroll-up-line)

(define-key indent-rigidly-map "k" 'indent-rigidly-right)
(define-key indent-rigidly-map "l" 'indent-rigidly-left)

;; Misc crap

(define-key boon-command-map "P" 'kmacro-end-or-call-macro) ; Play
(define-key boon-command-map "X" 'boon-highlight-regexp)
(define-key boon-command-map (kbd "<RET>") 'boon-open-next-line)


;; X-MAPS

(define-key boon-x-map "x" 'counsel-M-x)
(define-key boon-x-map "C-f" 'counsel-find-file)
(define-key boon-x-map "f" 'hydra-dired/body)
(define-key boon-x-map "E" 'eval-region)
(define-key boon-x-map "c" 'flyspell-buffer)
(define-key boon-x-map "l" 'my-org-insert-file)

;; SEARCH MAPS
(define-key boon-forward-search-map "e" 'flyspell-goto-next-error)
(define-key boon-backward-search-map "e" 'flyspell-goto-previous-error)


;;; boon-qwerty.el ends here
(provide 'boon-seins-qwerty)

