#
#              mconnect solutions
#        (c) Copyright 2020 Abi Akindele (mconnect.biz)
#
#    See the file "LICENSE.md", included in this
#    distribution, for details about the copyright / license.
# 
#             Standard Default Responses
#

import json, httpcore, tables

## Type definition for the stardard responses / messages
type
    ResponseMessage* = object
        code*: string
        resCode*: HttpCode
        message*: string
        value*: JsonNode
    
## Standard default responses: includes app-code, http-code, message and transaction value (json-object)
## 
var responseMessages* = initTable[string, ResponseMessage]()

responseMessages["checkEror"] = ResponseMessage(
        code   : "paramsError",
        resCode: Http406,
        message: "Parameters checking error",
        value  : JsonNode(nil) )

responseMessages["connectError"] = ResponseMessage(
        code   : "connectionError",
        resCode: Http503,
        message: "Connection error",
        value  : JsonNode(nil) )

responseMessages["validateError"] = ResponseMessage(
        code   : "paramsError",
        resCode: Http406,
        message: "Validation error for inputs parameters",
        value  : JsonNode(nil) )

responseMessages["tokenExpired"] = ResponseMessage(
        code   : "tokenExpired",
        resCode: Http401,
        message: "Unauthorized. Token / Access-key has expired. Please login again",
        value  : JsonNode(nil) )

responseMessages["unAuthorized"] = ResponseMessage(
        code   : "unAuthorized",
        resCode: Http401,
        message: "Unauthorised Action or Task",
        value  : JsonNode(nil) )

responseMessages["notFound"] = ResponseMessage(
        code   : "notFound",
        resCode: Http404,
        message: "Requested information not found",
        value  : JsonNode(nil) )

responseMessages["success"] = ResponseMessage(
        code   : "success",
        resCode: Http200,
        message: "Request completed successfully",
        value  : JsonNode(nil) )

responseMessages["removeDenied"] = ResponseMessage(
        code   : "removeDenied",
        resCode: Http401,
        message: "Remove action/task denied/unauthorised",
        value  : JsonNode(nil) )

responseMessages["removeError"] = ResponseMessage(
        code   : "removeError",
        resCode: Http417,
        message: "Error removing/deleting information, retry or contact system-admin",
        value  : JsonNode(nil) )

responseMessages["removed"] = ResponseMessage(
        code   : "removed",
        resCode: Http200,
        message: "Record(s) deleted/removed successfully",
        value  : JsonNode(nil) )

responseMessages["subItems"] = ResponseMessage(
        code   : "subItems",
        resCode: Http501,
        message: "Record includes sub-items, which must be removed first",
        value  : JsonNode(nil) )

responseMessages["duplicateRec"] = ResponseMessage(
        code   : "duplicateRec",
        resCode: Http406,
        message: "Duplicate record exists",
        value  : JsonNode(nil) )

responseMessages["updated"] = ResponseMessage(
        code   : "updated",
        resCode: Http200,
        message: "Information update action completed successfully",
        value  : JsonNode(nil) )

responseMessages["updateError"] = ResponseMessage(
        code   : "updateError",
        resCode: Http501,
        message: "Error updating information/record(s)",
        value  : JsonNode(nil) )

responseMessages["updateDenied"] = ResponseMessage(
        code   : "updateDenied",
        resCode: Http401,
        message: "Update action/task not authorised",
        value  : JsonNode(nil) )

responseMessages["inserted"] = ResponseMessage(
        code   : "inserted",
        resCode: Http200,
        message: "Information/record(s) inserted/created successfully",
        value  : JsonNode(nil) )

responseMessages["inserError"] = ResponseMessage(
        code   : "insertError",
        resCode: Http501,
        message: "Error inserting/creating new information/record",
        value  : JsonNode(nil) )

responseMessages["recExist"] = ResponseMessage(
        code   : "recExist",
        resCode: Http501,
        message: "Document/record exists",
        value  : JsonNode(nil) )

responseMessages["unknown"] = ResponseMessage(
        code   : "unknown",
        resCode: Http422,
        message: "Unspecified response/error message",
        value  : JsonNode(nil) )
