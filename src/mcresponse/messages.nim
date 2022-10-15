#
#              mconnect solutions
#        (c) Copyright 2020 Abi Akindele (mconnect.biz)
#
#    See the file "LICENSE.md", included in this
#    distribution, for details about the copyright / license.
# 
#             Standard Default Responses
#

import json, tables
import netcode

## Type definition for the stardard responses / messages
type
    ResponseMessage* = object
        code*: MessageCode
        resCode*: StatusCode
        message*: string
        value*: JsonNode
    
## Standard default responses: includes app-code, http-code, message and transaction value (json-object)
## 
# var responseMessages* = initTable[MessageCode, ResponseMessage]()

let responseMessages*: Table[MessageCode, ResponseMessage] = {
        MessageCode.CheckErrorCode: ResponseMessage(
        code   : MessageCode.ParamErrorCode,
        resCode: StatusCode.NotAcceptable,
        message: statusText[StatusCode.NotAcceptable] & ": Parameters checking error",
        value  : JsonNode(nil) ),
        
        MessageCode.ConnectionErrorCode: ResponseMessage(
        code   : MessageCode.ConnectionErrorCode,
        resCode: StatusCode.ServiceUnavailable,
        message: statusText[StatusCode.ServiceUnavailable] & ": Connection error",
        value  : JsonNode(nil) ),

        MessageCode.ValidateErrorCode: ResponseMessage(
        code   : MessageCode.ParamErrorCode,
        resCode: StatusCode.NotAcceptable,
        message: statusText[StatusCode.NotAcceptable] & ": Validation error for inputs parameters",
        value  : JsonNode(nil) ),

        MessageCode.TokenExpiredCode: ResponseMessage(
        code   : MessageCode.TokenExpiredCode,
        resCode: StatusCode.UnAuthorized,
        message: statusText[StatusCode.UnAuthorized] & ": Unauthorized. Token / Access-key has expired. Please login again",
        value  : JsonNode(nil) ),

        MessageCode.UnAuthorizedCode: ResponseMessage(
        code   : MessageCode.UnAuthorizedCode,
        resCode: StatusCode.UnAuthorized,
        message: statusText[StatusCode.UnAuthorized] & ": Unauthorised Action or Task",
        value  : JsonNode(nil) ),
        
        MessageCode.NotFoundCode: ResponseMessage(
        code   : MessageCode.NotFoundCode,
        resCode: StatusCode.NotFound,
        message: statusText[StatusCode.NotFound] & ": Requested information not found",
        value  : JsonNode(nil) ),

        MessageCode.SuccessCode: ResponseMessage(
        code   : MessageCode.SuccessCode,
        resCode: StatusCode.Ok,
        message: statusText[StatusCode.Ok] & ": Request completed successfully",
        value  : JsonNode(nil) ),

        MessageCode.RemoveDeniedCode: ResponseMessage(
        code   : MessageCode.RemoveDeniedCode,
        resCode: StatusCode.UnAuthorized,
        message: statusText[StatusCode.UnAuthorized] & ": Remove action/task denied/unauthorised",
        value  : JsonNode(nil) ),

        MessageCode.RemoveErrorCode: ResponseMessage(
        code   : MessageCode.RemoveErrorCode,
        resCode: StatusCode.ExpectationFailed,
        message: statusText[StatusCode.ExpectationFailed] & ": Error removing/deleting information, retry or contact system-admin",
        value  : JsonNode(nil) ),

        MessageCode.RemovedCode: ResponseMessage(
        code   : MessageCode.RemovedCode,
        resCode: StatusCode.Ok,
        message: statusText[StatusCode.Ok] & ": Record(s) deleted/removed successfully",
        value  : JsonNode(nil) ),

        MessageCode.SubItemsCode: ResponseMessage(
        code   : MessageCode.SubItemsCode,
        resCode: StatusCode.NotImplemented,
        message: statusText[StatusCode.NotImplemented] & ": Record includes sub-items, which must be removed first",
        value  : JsonNode(nil) ),

        MessageCode.DuplicateRecordCode: ResponseMessage(
        code   : MessageCode.DuplicateRecordCode,
        resCode: StatusCode.NotAcceptable,
        message: statusText[StatusCode.NotAcceptable] & ": Duplicate record exists",
        value  : JsonNode(nil) ),

        MessageCode.UpdatedCode: ResponseMessage(
        code   : MessageCode.UpdatedCode,
        resCode: StatusCode.Ok,
        message: statusText[StatusCode.Ok] & ": Information update action completed successfully",
        value  : JsonNode(nil) ),

        MessageCode.UpdateDeniedCode: ResponseMessage(
        code   : MessageCode.UpdateDeniedCode,
        resCode: StatusCode.NotImplemented,
        message: statusText[StatusCode.NotImplemented] & ": Error updating information/record(s)",
        value  : JsonNode(nil) ),

        MessageCode.UpdateDeniedCode: ResponseMessage(
        code   : MessageCode.UpdateDeniedCode,
        resCode: StatusCode.UnAuthorized,
        message: statusText[StatusCode.UnAuthorized] & ": Update action/task not authorised",
        value  : JsonNode(nil) ),

        MessageCode.InsertedCode: ResponseMessage(
        code   : MessageCode.InsertedCode,
        resCode: StatusCode.Ok,
        message: statusText[StatusCode.Ok] & ": Information/record(s) inserted/created successfully",
        value  : JsonNode(nil) ),

        MessageCode.InsertErrorCode: ResponseMessage(
        code   : MessageCode.InsertErrorCode,
        resCode: StatusCode.NotImplemented,
        message: statusText[StatusCode.NotImplemented] & ": Error inserting/creating new information/record",
        value  : JsonNode(nil) ),

        MessageCode.RecordExistCode: ResponseMessage(
        code   : MessageCode.RecordExistCode,
        resCode: StatusCode.NotImplemented,
        message: statusText[StatusCode.NotImplemented] & ": Document/record exists",
        value  : JsonNode(nil) ),

        MessageCode.TaskErrorCode: ResponseMessage(
        code   : MessageCode.TaskErrorCode,
        resCode: StatusCode.Ok,
        message: statusText[StatusCode.Ok] & ": Application or Task Specific Error",
        value  : JsonNode(nil) ),

        MessageCode.UnknownCode: ResponseMessage(
        code   : MessageCode.UnknownCode,
        resCode: StatusCode.Ok,
        message: statusText[StatusCode.Ok] & ": Unspecified/Unknown response/error message",
        value  : JsonNode(nil) )

}.toTable
