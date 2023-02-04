;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Ye Jian Feng"
      user-mail-address "yejianfengblue@hotmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "MesloLGS NF" :size 15)
      doom-variable-pitch-font (font-spec :family "MesloLGS NF" :size 18)
      doom-big-font (font-spec :family "JetBrains Mono" :size 25))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-material-dark)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(setq which-key-idle-delay 0.1)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(map! :leader
      :desc "M-x"                   "SPC"    #'execute-extended-command
      :desc "Comment"               ";"      #'evilnc-comment-operator
      :desc "Jump"                  "j"      #'evil-avy-goto-char-timer
      :desc "Paste"                 "v"      #'consult-yank-pop
      :desc "Last buffer"           "o"      #'evil-switch-to-windows-last-buffer

      :desc "Maximize"              "wm"     #'doom/window-maximize-buffer

      "n" nil
      (:prefix ("n" . "note org-roam")
       :desc "Find node"                  "f" #'org-roam-node-find
       :desc "Find ref"                   "r" #'org-roam-ref-find
       :desc "Show graph"                 "g" #'org-roam-graph
       :desc "Insert node"                "i" #'org-roam-node-insert
       :desc "Capture to node"            "n" #'org-roam-capture
       :desc "Launch roam buffer"         "R" #'org-roam-buffer-display-dedicated
       :desc "Sync database"              "s" #'org-roam-db-sync
      )

      :desc "Org src"               "i"      (cmd! (org-insert-structure-template "src") (evil-append 0))

)

(map! :map evil-normal-state-map
      "f" #'evil-snipe-s
      "F" #'evil-snipe-S
      "!" #'evil-first-non-blank
      "#" #'evil-jump-item)
(map! :map evil-operator-state-map
      "f" #'evil-snipe-s
      "F" #'evil-snipe-S
      "d" #'evil-snipe-x
      "D" #'evil-snipe-X
      "!" #'evil-first-non-blank
      "#" #'evil-jump-item)
(map! :map evil-visual-state-map
      "f" #'evil-snipe-s
      "F" #'evil-snipe-S
      "d" #'evil-snipe-x
      "D" #'evil-snipe-X
      "!" #'evil-first-non-blank
      "#" #'evil-jump-item
      "s" #'evil-surround-region)

(map! :map with-editor-mode-map
      :n ",," #'with-editor-finish
      :n ",." #'with-editor-cancel
      :n ",k" #'with-editor-cancel)

(map! :map org-capture-mode-map
      :n ",," #'org-capture-finalize
      :n ",." #'org-capture-kill)

(after! org
        (setq org-roam-directory "/file/mega/org-roam")
        (setq org-roam-index-file "/file/mega/org-roam/index.org"))

(custom-set-faces!
  '(vertico-current :background "black")
  '(region :foreground "black"
           :background "orange"))

(setq-default fill-column 120)
(setq-default auto-fill-function 'do-auto-fill)
