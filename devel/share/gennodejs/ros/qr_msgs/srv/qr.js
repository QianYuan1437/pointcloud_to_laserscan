// Auto-generated. Do not edit!

// (in-package qr_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class qrRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.start_calling = null;
    }
    else {
      if (initObj.hasOwnProperty('start_calling')) {
        this.start_calling = initObj.start_calling
      }
      else {
        this.start_calling = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type qrRequest
    // Serialize message field [start_calling]
    bufferOffset = _serializer.bool(obj.start_calling, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type qrRequest
    let len;
    let data = new qrRequest(null);
    // Deserialize message field [start_calling]
    data.start_calling = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'qr_msgs/qrRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '09c1c6dfb3988f60c7afde4296358c38';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool start_calling
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new qrRequest(null);
    if (msg.start_calling !== undefined) {
      resolved.start_calling = msg.start_calling;
    }
    else {
      resolved.start_calling = false
    }

    return resolved;
    }
};

class qrResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.id = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = new std_msgs.msg.Int8();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type qrResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = std_msgs.msg.Int8.serialize(obj.id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type qrResponse
    let len;
    let data = new qrResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = std_msgs.msg.Int8.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a service object
    return 'qr_msgs/qrResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b74d638021b5ea388d36073cbd682ed5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success #识别成功才返回true
    std_msgs/Int8 id
    
    
    ================================================================================
    MSG: std_msgs/Int8
    int8 data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new qrResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.id !== undefined) {
      resolved.id = std_msgs.msg.Int8.Resolve(msg.id)
    }
    else {
      resolved.id = new std_msgs.msg.Int8()
    }

    return resolved;
    }
};

module.exports = {
  Request: qrRequest,
  Response: qrResponse,
  md5sum() { return '8035d02e9aa155dc8ea6018792abfea1'; },
  datatype() { return 'qr_msgs/qr'; }
};
