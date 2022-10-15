import unittest, json

import mcresponse

# standard response message
type
    Person = object
        firstName: string
        lastName: string
        age: Natural

let person = Person(firstName: "Abi", lastName: "Akindele", age: 100)
let person2 = Person(firstName: "Ola", lastName: "Akindele", age: 200)

var persons = [person, person2]

var j = %*
  [
    { "name": 31, "age": 30 },
    { "name": "Susan", "age": 100 }
  ]
var j2 = %* {"name": "Isaac", "books": ["Robot Dreams"]}

var personInfo = %* persons
var personRes = %*([{"firstName":"Abi","lastName":"Akindele","age":100},{"firstName":"Ola","lastName":"Akindele","age":200}])
   

echo "JsonNode 1: ", j
echo "JsonNode 2: ", j2

let options = ResponseMessage(value: personInfo, message: "Request completed")
var resMsg = getResMessage(MessageCode.SuccessCode, options)
echo "\n"
echo resMsg
echo "\n"
echo "msgCode: ", resMsg.code
echo "\n"
echo "resCode: ", resMsg.resCode.repr
echo "\n"
echo "resMessage: ", resMsg.message
echo "\n"
# (code: "success", resCode: ..., message: "Request completed successfully [personal info]",
# value: [{"firstName":"Abi","lastName":"Akindele","age":100},{"firstName":"Ola","lastName":"Akindele","age":200}]) 
#

test "will respond with the correct standard response: ":
    check resMsg.code.repr == "success"
    check $resMsg.code == "success"
    check resMsg.message == "Request completed"
    check resMsg.value == personRes
    check resMsg.resCode.repr == "Ok"
    check $resMsg.resCode == "Ok"
