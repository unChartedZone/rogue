;;; mpm.el --- Iterface for mpm

;; Copyright (c) 2017 Abhinav Tushar

;; Author: Abhinav Tushar <lepisma@fastmail.com>
;; Version: 0.0.1
;; Package-Requires: ((emacs "25"))
;; URL: https://github.com/lepisma/mpm.el

;;; Commentary:

;; Interfaces mpm with Emacs, allowing easy music clipping
;; This file is not a part of GNU Emacs.

;;; License:

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(require 'dash)
(require 'org-cliplink)
(require 's)

(defun mpm-add-item (url title artist &optional album)
  (+ 1 1))

(defun mpm-detect-metadata (page-title)
  "Try to figure out song metadata from PAGE-TITLE.
Return a cons cell like this (artist . title)."
  (let ((parts (--> page-title
                  (s-split "-" it)
                  (butlast it)
                  (mapcar #'s-trim it)
                  (mapcar #'s-collapse-whitespace it))))
    (if (= (length parts) 2)
        ;; This is probably artist - title pair
        (apply #'cons parts)
      ;; This is weird, just let the user decide
      (let ((main-title (s-join "-" parts)))
        (cons main-title main-title)))))

(defun mpm-url-valid? (url)
  (let ((url-main (->> url
                     (s-chop-prefix "http://")
                     (s-chop-prefix "https://")
                     (s-chop-prefix "www."))))
    (or (s-starts-with? "youtube.com" url-main)
        (s-starts-with? "youtu.be" url-main))))

;; TODO: Define a minor mode for metadata manipulation
;; - Allow swapping title, artist
;; - Allow adding album
;; - Save artists for better heuristic
;; - Allow removing texts in parentheses
;; - Probably get help from yasnippet?

(defun mpm-cliplink ()
  "Save the current link to mpm database."
  (interactive)
  (let ((url (substring-no-properties (current-kill 0))))
    (if (mpm-url-valid? url)
        (org-cliplink-retrieve-title
         url
         (lambda (url page-title)
           (print (mpm-detect-metadata page-title))))
      (message "Not a valid url"))))

(provide 'mpm)

;;; mpm.el ends here