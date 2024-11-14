
(cl:in-package :asdf)

(defsystem "qr_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "qr" :depends-on ("_package_qr"))
    (:file "_package_qr" :depends-on ("_package"))
  ))