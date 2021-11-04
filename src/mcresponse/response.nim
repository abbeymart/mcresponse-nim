#
#              mconnect solutions
#        (c) Copyright 2020 Abi Akindele (mconnect.biz)
#
#    See the file "LICENSE.md", included in this
#    distribution, for details about the copyright / license.
# 
#             Response Message Procedure
#

## This procedure returns stardard response for any transactions 
## 
## 

import json, httpcore, tables
import ./messages

proc msgFunc*(mcValue: JsonNode; mcCode, mcMsg: string; mcResCode: HttpCode;): ResponseMessage =
    result = ResponseMessage(
        code   : mcCode,
        resCode: mcResCode,
        value  : mcValue,
        message: mcMsg)

proc getResMessage*(messageType: string = "unknown";  options: ResponseMessage = ResponseMessage()): ResponseMessage = 
    var
        value: JsonNode
        code: string
        resCode: HttpCode
        message: string

    # check for the messageType in the standard responseMessages
    if messageType != "unknown" and responseMessages.hasKey(messageType):
        code = messageType
    elif options.code != "" and responseMessages.hasKey(options.code):
        code = options.code
    else:
        code = messageType

    # Obtain the standard response, will always return valid result
    let stdRes =  responseMessages[code]

    message = stdRes.message & " [" & options.message & "]"
    value = options.value
    resCode = stdRes.resCode

    result = msgFunc(value, code, message, resCode )

when isMainModule:
    # standard response message
    var resMsg = responseMessages["success"]
    echo "\n"
    echo resMsg
    echo "\n"

    type
        Person = object
            firstName: string
            lastName: string
            age: Natural

    const person: Person = Person(firstName: "Abi", lastName: "Akindele", age: 100)
    const person2: Person = Person(firstName: "Ola", lastName: "Akindele", age: 200)

    let personInfo = %*([person, person2])

    var options = ResponseMessage(value: personInfo, message: "personal info")

    echo getResMessage("success", options)
