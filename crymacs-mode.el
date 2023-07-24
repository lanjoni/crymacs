;;; crymacs-mode.el --- Crymacs mode                              -*- lexical-binding: t; -*-

;; Copyright (C) 2023 crymacs maintainers

;; Author: João Lanjoni, Josué Teodoro
;; Keywords: languages, crystal, compiler, repl
;; Package-Requires: ((emacs "26.3"))
;; Version: 0.0.1

;; URL: https://github.com/lanjoni/crymacs
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Emacs library for Crystal Programming Language.  See more on https://crystal-lang.org

;;; Code:

(defun crymacs-get-root-directory ()
  "Get the root directory of the current Git project."
    (if (executable-find "git")
        (concat (string-trim (shell-command-to-string "git rev-parse --show-toplevel")) "/")
        default-directory))
 
(defun crymacs-shard-exists? ()
  "Verify project type on your current directory."
    (file-exists-p (concat (crymacs-get-root-directory) "shard.yml")))

(defun crymacs-run-standalone-project ()
  "Run standalone Crystal project."
  (compile (concat "crystal run " buffer-file-name)))

(defun crymacs-run-shard-project ()
  "Run shard based Crystal project."
  (compile (format "cd %s && shards run" (crymacs-get-root-directory))))

(defun crymacs-run ()
  "Run Crystal code."
  (interactive)
  (if (crymacs-shard-exists?)
      (crymacs-run-shard-project)
    (crymacs-run-standalone-project)))

(defvar crymacs-mode-map (make-sparse-keymap)
  "The keymap for 'crymacs-mode'.")

(define-key crymacs-mode-map (kbd "C-c C-.")
  (lambda ()
    (interactive)
    (crymacs-run)))

(define-minor-mode crymacs-mode
  "Run, Compile and/or Debug your Crystal project."
  :lighter " crymacs"
  :keymap crymacs-mode-map)

(add-hook 'crystal-mode-hook 'crymacs-mode)

(provide 'crymacs-mode)
;;; crymacs-mode.el ends here
