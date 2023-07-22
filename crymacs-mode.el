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

(defgroup crymacs-mode nil
  "Crystal helper."
  :group 'tools
  :tag "Helper (crymacs-mode)")

(defun crymacs-shard-exists? ()
  "Verify project type on your current directory."
  (file-exists-p (concat default-directory "shard.yml")))

(defun crymacs-run ()
  "Run Crystal code."
  (if (crymacs-shard-exists?)
      (message "Shard exists")
      (message "Shard doesn't exists")))

;; TODO: create simple `crystal run`.  Verifying is working.

(provide 'crymacs-mode)
;;; crymacs-mode.el ends here
