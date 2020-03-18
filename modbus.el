;;; modbus.el --- Modbus Protocol Support            -*- lexical-binding: t; -*-

;; Copyright (C) 2020 Jeff Spaulding

;; Author: Jeff Spaulding <sarnet@gmail.com>
;; Keywords: comm, hardware

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

;; This package provides basic Modbus TCP support to Emacs.

;;; Code:

(require 'cl-lib)
(require 'eieio)
(require 'bindat)

(defclass modbus--pdu (eieio-persistent)
  ((function-code
    :initarg :function-code
    :type number
    :documentation "Modbus Function Code.")
   (data
    :initarg :data
    :documentation "Packed PDU including function code."))
  "Protocol Data Unit abstract class."
  :abstract t)

;; Function Code 001: Read Coils

(defclass modbus--fc001-req (modbus--pdu)
  ()
  "Read Coils Request class.")

(defclass modbus--fc001-res (modbus--pdu)
  ()
  "Read Coils Response class.")

(defun modbus--read-coils-pdu (start-address num-coils)
  "Create a PDU object to read `NUM-COILS' starting at `START-ADDRESS'."
  (let ((data-spec '((fc u8)
		     (sa u16)
		     (qty u16))))
    (make-instance modbus--fc001-req
		   :function-code 1
		   :data ())))


(provide 'modbus)
;;; modbus.el ends here
