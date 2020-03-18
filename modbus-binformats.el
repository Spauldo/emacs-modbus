;;; modbus-binformats.el --- Binary Formats for Modbus Packets  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Jeff Spaulding

;; Author: Jeff Spaulding <jeff.spaulding@englobal.com>
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

;; This file defines the wire formats of the various packets used by
;; the modbus package.

;;; Code:

(defconst modbus--format-pdu-req-alist
  (list
   ;; Read Coils
   (cons 1 '((fc u8)
	     (sa u16)
	     (qty u16)))
   ;; Read Discretes
   (cons 2 '((fc u8)
	     (sa u16)
	     (qty u16)))
   ;; Read Holding Registers
   (cons 3 '((fc u8)
	     (sa u16)
	     (qty u16)))
   ;; Read Input Registers
   (cons 4 '((fc u8)
	     (sa u16)
	     (qty u16)))
   ;; Write Single Coil
   (cons 5 '((fc u8)
	     (add u16)
	     (val u16)))
   ;; Write Single Register
   (cons 6 '((fc u8)
	     (add u16)
	     (val u16)))
   ;; Read Exception Status (serial only)
   (cons 7 '((fc u8)))
   ;; Diagnostics (serial only)
   (cons 8 '((fc u8)
	     (sf u16)
	     ))
   )
  "Binary formats for PDU request packets.")

(provide 'modbus-binformats)
;;; modbus-binformats.el ends here
