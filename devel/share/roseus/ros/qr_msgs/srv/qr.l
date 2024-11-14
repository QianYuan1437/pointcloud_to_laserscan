;; Auto-generated. Do not edit!


(when (boundp 'qr_msgs::qr)
  (if (not (find-package "QR_MSGS"))
    (make-package "QR_MSGS"))
  (shadow 'qr (find-package "QR_MSGS")))
(unless (find-package "QR_MSGS::QR")
  (make-package "QR_MSGS::QR"))
(unless (find-package "QR_MSGS::QRREQUEST")
  (make-package "QR_MSGS::QRREQUEST"))
(unless (find-package "QR_MSGS::QRRESPONSE")
  (make-package "QR_MSGS::QRRESPONSE"))

(in-package "ROS")



(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass qr_msgs::qrRequest
  :super ros::object
  :slots (_start_calling ))

(defmethod qr_msgs::qrRequest
  (:init
   (&key
    ((:start_calling __start_calling) nil)
    )
   (send-super :init)
   (setq _start_calling __start_calling)
   self)
  (:start_calling
   (&optional (__start_calling :null))
   (if (not (eq __start_calling :null)) (setq _start_calling __start_calling)) _start_calling)
  (:serialization-length
   ()
   (+
    ;; bool _start_calling
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _start_calling
       (if _start_calling (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _start_calling
     (setq _start_calling (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass qr_msgs::qrResponse
  :super ros::object
  :slots (_success _id ))

(defmethod qr_msgs::qrResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:id __id) (instance std_msgs::Int8 :init))
    )
   (send-super :init)
   (setq _success __success)
   (setq _id __id)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:id
   (&rest __id)
   (if (keywordp (car __id))
       (send* _id __id)
     (progn
       (if __id (setq _id (car __id)))
       _id)))
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; std_msgs/Int8 _id
    (send _id :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; std_msgs/Int8 _id
       (send _id :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; std_msgs/Int8 _id
     (send _id :deserialize buf ptr-) (incf ptr- (send _id :serialization-length))
   ;;
   self)
  )

(defclass qr_msgs::qr
  :super ros::object
  :slots ())

(setf (get qr_msgs::qr :md5sum-) "8035d02e9aa155dc8ea6018792abfea1")
(setf (get qr_msgs::qr :datatype-) "qr_msgs/qr")
(setf (get qr_msgs::qr :request) qr_msgs::qrRequest)
(setf (get qr_msgs::qr :response) qr_msgs::qrResponse)

(defmethod qr_msgs::qrRequest
  (:response () (instance qr_msgs::qrResponse :init)))

(setf (get qr_msgs::qrRequest :md5sum-) "8035d02e9aa155dc8ea6018792abfea1")
(setf (get qr_msgs::qrRequest :datatype-) "qr_msgs/qrRequest")
(setf (get qr_msgs::qrRequest :definition-)
      "bool start_calling
---
bool success #识别成功才返回true
std_msgs/Int8 id


================================================================================
MSG: std_msgs/Int8
int8 data
")

(setf (get qr_msgs::qrResponse :md5sum-) "8035d02e9aa155dc8ea6018792abfea1")
(setf (get qr_msgs::qrResponse :datatype-) "qr_msgs/qrResponse")
(setf (get qr_msgs::qrResponse :definition-)
      "bool start_calling
---
bool success #识别成功才返回true
std_msgs/Int8 id


================================================================================
MSG: std_msgs/Int8
int8 data
")



(provide :qr_msgs/qr "8035d02e9aa155dc8ea6018792abfea1")


