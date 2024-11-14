; Auto-generated. Do not edit!


(cl:in-package qr_msgs-srv)


;//! \htmlinclude qr-request.msg.html

(cl:defclass <qr-request> (roslisp-msg-protocol:ros-message)
  ((start_calling
    :reader start_calling
    :initarg :start_calling
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass qr-request (<qr-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <qr-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'qr-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name qr_msgs-srv:<qr-request> is deprecated: use qr_msgs-srv:qr-request instead.")))

(cl:ensure-generic-function 'start_calling-val :lambda-list '(m))
(cl:defmethod start_calling-val ((m <qr-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qr_msgs-srv:start_calling-val is deprecated.  Use qr_msgs-srv:start_calling instead.")
  (start_calling m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <qr-request>) ostream)
  "Serializes a message object of type '<qr-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'start_calling) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <qr-request>) istream)
  "Deserializes a message object of type '<qr-request>"
    (cl:setf (cl:slot-value msg 'start_calling) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<qr-request>)))
  "Returns string type for a service object of type '<qr-request>"
  "qr_msgs/qrRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'qr-request)))
  "Returns string type for a service object of type 'qr-request"
  "qr_msgs/qrRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<qr-request>)))
  "Returns md5sum for a message object of type '<qr-request>"
  "8035d02e9aa155dc8ea6018792abfea1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'qr-request)))
  "Returns md5sum for a message object of type 'qr-request"
  "8035d02e9aa155dc8ea6018792abfea1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<qr-request>)))
  "Returns full string definition for message of type '<qr-request>"
  (cl:format cl:nil "bool start_calling~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'qr-request)))
  "Returns full string definition for message of type 'qr-request"
  (cl:format cl:nil "bool start_calling~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <qr-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <qr-request>))
  "Converts a ROS message object to a list"
  (cl:list 'qr-request
    (cl:cons ':start_calling (start_calling msg))
))
;//! \htmlinclude qr-response.msg.html

(cl:defclass <qr-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (id
    :reader id
    :initarg :id
    :type std_msgs-msg:Int8
    :initform (cl:make-instance 'std_msgs-msg:Int8)))
)

(cl:defclass qr-response (<qr-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <qr-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'qr-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name qr_msgs-srv:<qr-response> is deprecated: use qr_msgs-srv:qr-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <qr-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qr_msgs-srv:success-val is deprecated.  Use qr_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <qr-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader qr_msgs-srv:id-val is deprecated.  Use qr_msgs-srv:id instead.")
  (id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <qr-response>) ostream)
  "Serializes a message object of type '<qr-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'id) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <qr-response>) istream)
  "Deserializes a message object of type '<qr-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'id) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<qr-response>)))
  "Returns string type for a service object of type '<qr-response>"
  "qr_msgs/qrResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'qr-response)))
  "Returns string type for a service object of type 'qr-response"
  "qr_msgs/qrResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<qr-response>)))
  "Returns md5sum for a message object of type '<qr-response>"
  "8035d02e9aa155dc8ea6018792abfea1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'qr-response)))
  "Returns md5sum for a message object of type 'qr-response"
  "8035d02e9aa155dc8ea6018792abfea1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<qr-response>)))
  "Returns full string definition for message of type '<qr-response>"
  (cl:format cl:nil "bool success #识别成功才返回true~%std_msgs/Int8 id~%~%~%================================================================================~%MSG: std_msgs/Int8~%int8 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'qr-response)))
  "Returns full string definition for message of type 'qr-response"
  (cl:format cl:nil "bool success #识别成功才返回true~%std_msgs/Int8 id~%~%~%================================================================================~%MSG: std_msgs/Int8~%int8 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <qr-response>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'id))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <qr-response>))
  "Converts a ROS message object to a list"
  (cl:list 'qr-response
    (cl:cons ':success (success msg))
    (cl:cons ':id (id msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'qr)))
  'qr-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'qr)))
  'qr-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'qr)))
  "Returns string type for a service object of type '<qr>"
  "qr_msgs/qr")