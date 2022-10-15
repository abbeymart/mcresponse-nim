# standard HTTP network status codes and texts

import tables, httpcore

## MessageCode provides the standard message-codes/tags for mcresponse package
type MessageCode* = enum
    CheckErrorCode = "checkError",
    ParamErrorCode = "paramError",
    ParamsErrorCode = "paramsError",
    ConnectionErrorCode = "connectionError",
    ValidateErrorCode = "validateError",
    TokenExpiredCode = "tokenExpired",
    UnAuthorizedCode = "unAuthorized",
    NotFoundCode = "notFound",
    SuccessCode = "success",
    RemoveDeniedCode = "removeDenied",
    RemoveErrorCode = "removeError",
    RemovedCode = "removed",
    SubItemsCode = "subItems",
    DuplicateRecordCode = "duplicateRecord",
    UpdatedCode = "updated",
    SaveErrorCode = "saveError",
    UpdateErrorCode = "updateError",
    UpdateDeniedCode = "updateDenied",
    InsertedCode = "inserted",
    InsertErrorCode = "insertError",
    RecordExistCode = "recordExist",
    TaskErrorCode = "taskError",
    PaymentErrorCode = "paymentError",
    ShippingErrorCode = "shippingError",
    UnknownCode = "unknown",

## HTTP status codes
type StatusCode* = enum
    # # RFC 7231, 6.2.1 */
    Continue = HttpCode(100),
    # RFC 7231 6.2.2 */
    SwitchingProtocols = HttpCode(101),
    # RFC 2518, 10.1 */
    Processing = HttpCode(102),
    # RFC 8297 **/
    EarlyHints = HttpCode(103),
    # RFC 7231 6.3.1 */
    Ok = HttpCode(200),
    # RFC 7231 6.3.2 */
    Created = HttpCode(201),
    # RFC 7231 6.3.3 */
    Accepted = HttpCode(202),
    # RFC 7231 6.3.4 */
    NonAuthoritativeInfo = HttpCode(203),
    # RFC 7231 6.3.5 */
    NoContent = HttpCode(204),
    # RFC 7231 6.3.6 */
    ResetContent = HttpCode(205),
    # RFC 7233 4.1 */
    PartialContent = HttpCode(206),
    # RFC 4918 11.1 */
    MultiStatus = HttpCode(207),
    # RFC 5842 7.1 */
    AlreadyReported = HttpCode(208),
    # RFC 3229 10.4.1 */
    IMUsed = HttpCode(226),
    # RFC 7231 6.4.1 */
    MultipleChoices = HttpCode(300),
    # RFC 7231 6.4.2 */
    MovedPermanently = HttpCode(301),
    # RFC 7231 6.4.3 */
    Found = HttpCode(302),
    # RFC 7231 6.4.4 */
    SeeOther = HttpCode(303),
    # RFC 7232 4.1 */
    NotModified = HttpCode(304),
    # RFC 7231 6.4.5 */
    UseProxy = HttpCode(305),
    # RFC 7231 6.4.7 */
    TemporaryRedirect = HttpCode(307),
    # RFC 7538 3 */
    PermanentRedirect = HttpCode(308),
    # RFC 7231 6.5.1 */
    BadRequest = HttpCode(400),
    # RFC 7235 3.1 */
    UnAuthorized = HttpCode(401),
    # RFC 7231 6.5.2 */
    PaymentRequired = HttpCode(402),
    # RFC 7231 6.5.3 */
    Forbidden = HttpCode(403),
    # RFC 7231 6.5.4 */
    NotFound = HttpCode(404),
    # RFC 7231 6.5.5 */
    MethodNotAllowed = HttpCode(405),
    # RFC 7231 6.5.6 */
    NotAcceptable = HttpCode(406),
    # RFC 7235 3.2 */
    ProxyAuthRequired = HttpCode(407),
    # RFC 7231 6.5.7 */
    RequestTimeout = HttpCode(408),
    # RFC 7231 6.5.8 */
    Conflict = HttpCode(409),
    # RFC 7231 6.5.9 */
    Gone = HttpCode(410),
    # RFC 7231 6.5.10 */
    LengthRequired = HttpCode(411),
    # RFC 7232 4.2 */
    PreconditionFailed = HttpCode(412),
    # RFC 7231 6.5.11 */
    RequestEntityTooLarge = HttpCode(413),
    # RFC 7231 6.5.12 */
    RequestURITooLong = HttpCode(414),
    # RFC 7231 6.5.13 */
    UnsupportedMediaType = HttpCode(415),
    # RFC 7233 4.4 */
    RequestedRangeNotSatisfiable = HttpCode(416),
    # RFC 7231 6.5.14 
    ExpectationFailed = HttpCode(417),
    # RFC 7168 2.3.3 */
    Teapot = HttpCode(418),
    # RFC 7540 9.1.2 */
    MisdirectedRequest = HttpCode(421),
    # RFC 4918 11.2 */
    UnprocessableEntity = HttpCode(422),
    # RFC 4918 11.3 */
    Locked = HttpCode(423),
    # RFC 4918 11.4 */
    FailedDependency = HttpCode(424),
    # RFC 8470 5.2 */
    TooEarly = HttpCode(425),
    # RFC 7231 6.5.15 */
    UpgradeRequired = HttpCode(426),
    # RFC 6585 3 */
    PreconditionRequired = HttpCode(428),
    # RFC 6585 4 */
    TooManyRequests = HttpCode(429),
    # RFC 6585 5 */
    RequestHeaderFieldsTooLarge = HttpCode(431),
    # RFC 7725 3 */
    UnavailableForLegalReasons = HttpCode(451),
    # RFC 7231 6.6.1 */
    InternalServerError = HttpCode(500),
    # RFC 7231 6.6.2 */
    NotImplemented = HttpCode(501),
    # RFC 7231 6.6.3 */
    BadGateway = HttpCode(502),
    # RFC 7231 6.6.4 */
    ServiceUnavailable = HttpCode(503),
    # RFC 7231 6.6.5 */
    GatewayTimeout = HttpCode(504),
    # RFC 7231 6.6.6 */
    HTTPVersionNotSupported = HttpCode(505),
    # RFC 2295 8.1 */
    VariantAlsoNegotiates = HttpCode(506),
    # RFC 4918 11.5 */
    InsufficientStorage = HttpCode(507),
    # RFC 5842 7.2 */
    LoopDetected = HttpCode(508),
    # RFC 2774 7 */
    NotExtended = HttpCode(510),
    # RFC 6585 6 */
    NetworkAuthenticationRequired = HttpCode(511),

const 
    MessageCodeCheckErrorCode* = "checkError"
    MessageCodeParamErrorCode* = "paramError"
    MessageCodeParamsErrorCode* = "paramsError"
    MessageCodeConnectionErrorCode* = "connectionError"
    MessageCodeValidateErrorCode* = "validateError"
    MessageCodeTokenExpiredCode* = "tokenExpired"
    MessageCodeUnAuthorizedCode* = "unAuthorized"
    MessageCodeNotFoundCode* = "notFound"
    MessageCodeSuccessCode* = "success"
    MessageCodeRemoveDeniedCode* = "removeDenied"
    MessageCodeRemoveErrorCode* = "removeError"
    MessageCodeRemovedCode* = "removed"
    MessageCodeSubItemsCode* = "subItems"
    MessageCodeDuplicateRecordCode* = "duplicateRecord"
    MessageCodeUpdatedCode* = "updated"
    MessageCodeUpdateErrorCode* = "updateError"
    MessageCodeUpdateDeniedCode* = "updateDenied"
    MessageCodeInsertedCode* = "inserted"
    MessageCodeInsertErrorCode* = "insertError"
    MessageCodeRecordExistCode* = "recordExist"
    MessageCodeTaskErrorCode* = "taskError"
    MessageCodeUnknownCode* = "unknown"

const
    # # RFC 7231, 6.2.1 */
    StatusCodeContinue* = HttpCode(100)
    # RFC 7231 6.2.2 */
    StatusCodeSwitchingProtocols* = HttpCode(101)
    # RFC 2518, 10.1 */
    StatusCodeProcessing* = HttpCode(102)
    # RFC 8297 **/
    StatusCodeEarlyHints* = HttpCode(103)
    # RFC 7231 6.3.1 */
    StatusCodeOK* = HttpCode(200)
    # RFC 7231 6.3.2 */
    StatusCodeCreated* = HttpCode(201)
    # RFC 7231 6.3.3 */
    StatusCodeAccepted* = HttpCode(202)
    # RFC 7231 6.3.4 */
    StatusCodeNonAuthoritativeInfo* = HttpCode(203)
    # RFC 7231 6.3.5 */
    StatusCodeNoContent* = HttpCode(204)
    # RFC 7231 6.3.6 */
    StatusCodeResetContent* = HttpCode(205)
    # RFC 7233 4.1 */
    StatusCodePartialContent* = HttpCode(206)
    # RFC 4918 11.1 */
    StatusCodeMultiStatus* = HttpCode(207)
    # RFC 5842 7.1 */
    StatusCodeAlreadyReported* = HttpCode(208)
    # RFC 3229 10.4.1 */
    StatusCodeIMUsed* = HttpCode(226)
    # RFC 7231 6.4.1 */
    StatusCodeMultipleChoices* = HttpCode(300)
    # RFC 7231 6.4.2 */
    StatusCodeMovedPermanently* = HttpCode(301)
    # RFC 7231 6.4.3 */
    StatusCodeFound* = HttpCode(302)
    # RFC 7231 6.4.4 */
    StatusCodeSeeOther* = HttpCode(303)
    # RFC 7232 4.1 */
    StatusCodeNotModified* = HttpCode(304)
    # RFC 7231 6.4.5 */
    StatusCodeUseProxy* = HttpCode(305)
    # RFC 7231 6.4.7 */
    StatusCodeTemporaryRedirect* = HttpCode(307)
    # RFC 7538 3 */
    StatusCodePermanentRedirect* = HttpCode(308)

    # RFC 7231 6.5.1 */
    StatusCodeBadRequest* = HttpCode(400)
    # RFC 7235 3.1 */
    StatusCodeUnauthorized* = HttpCode(401)
    # RFC 7231 6.5.2 */
    StatusCodePaymentRequired* = HttpCode(402)
    # RFC 7231 6.5.3 */
    StatusCodeForbidden* = HttpCode(403)
    # RFC 7231 6.5.4 */
    StatusCodeNotFound* = HttpCode(404)
    # RFC 7231 6.5.5 */
    StatusCodeMethodNotAllowed* = HttpCode(405)
    # RFC 7231 6.5.6 */
    StatusCodeNotAcceptable* = HttpCode(406)
    # RFC 7235 3.2 */
    StatusCodeProxyAuthRequired* = HttpCode(407)
    # RFC 7231 6.5.7 */
    StatusCodeRequestTimeout* = HttpCode(408)
    # RFC 7231 6.5.8 */
    StatusCodeConflict* = HttpCode(409)
    # RFC 7231 6.5.9 */
    StatusCodeGone* = HttpCode(410)
    # RFC 7231 6.5.10 */
    StatusCodeLengthRequired* = HttpCode(411)
    # RFC 7232 4.2 */
    StatusCodePreconditionFailed* = HttpCode(412)
    # RFC 7231 6.5.11 */
    StatusCodeRequestEntityTooLarge* = HttpCode(413)
    # RFC 7231 6.5.12 */
    StatusCodeRequestURITooLong* = HttpCode(414)
    # RFC 7231 6.5.13 */
    StatusCodeUnsupportedMediaType* = HttpCode(415)
    # RFC 7233 4.4 */
    StatusCodeRequestedRangeNotSatisfiable* = HttpCode(416)
    # RFC 7231 6.5.14 
    StatusCodeExpectationFailed* = HttpCode(417)
    # RFC 7168 2.3.3 */
    StatusCodeTeapot* = HttpCode(418)
    # RFC 7540 9.1.2 */
    StatusCodeMisdirectedRequest* = HttpCode(421)
    # RFC 4918 11.2 */
    StatusCodeUnprocessableEntity* = HttpCode(422)
    # RFC 4918 11.3 */
    StatusCodeLocked* = HttpCode(423)
    # RFC 4918 11.4 */
    StatusCodeFailedDependency* = HttpCode(424)
    # RFC 8470 5.2 */
    StatusCodeTooEarly* = HttpCode(425)
    # RFC 7231 6.5.15 */
    StatusCodeUpgradeRequired* = HttpCode(426)
    # RFC 6585 3 */
    StatusCodePreconditionRequired* = HttpCode(428)
    # RFC 6585 4 */
    StatusCodeTooManyRequests* = HttpCode(429)
    # RFC 6585 5 */
    StatusCodeRequestHeaderFieldsTooLarge* = HttpCode(431)
    # RFC 7725 3 */
    StatusCodeUnavailableForLegalReasons* = HttpCode(451)
    # RFC 7231 6.6.1 */
    StatusCodeInternalServerError* = HttpCode(500)
    # RFC 7231 6.6.2 */
    StatusCodeNotImplemented* = HttpCode(501)
    # RFC 7231 6.6.3 */
    StatusCodeBadGateway* = HttpCode(502)
    # RFC 7231 6.6.4 */
    StatusCodeServiceUnavailable* = HttpCode(503)
    # RFC 7231 6.6.5 */
    StatusCodeGatewayTimeout* = HttpCode(504)
    # RFC 7231 6.6.6 */
    StatusCodeHTTPVersionNotSupported* = HttpCode(505)
    # RFC 2295 8.1 */
    StatusCodeVariantAlsoNegotiates* = HttpCode(506)
    # RFC 4918 11.5 */
    StatusCodeInsufficientStorage* = HttpCode(507)
    # RFC 5842 7.2 */
    StatusCodeLoopDetected* = HttpCode(508)
    # RFC 2774 7 */
    StatusCodeNotExtended* = HttpCode(510)
    # RFC 6585 6 */
    StatusCodeNetworkAuthenticationRequired* = HttpCode(511)

## HTTP status texts
# var StatusText* = initTable[HttpCode, string]()

let statusText*: Table[StatusCode, string] = {
    StatusCode.Continue: "Continue",
    StatusCode.SwitchingProtocols: "Switching Protocols", 
    StatusCode.Processing: "Processing",
    StatusCode.EarlyHints: "Early Hints",
    StatusCode.Ok: "OK",
    StatusCode.Created: "Created",
    StatusCode.Accepted: "Accepted",
    StatusCode.NonAuthoritativeInfo: "Non-Authoritative Information",
    StatusCode.NoContent: "No Content",
    StatusCode.ResetContent: "Reset Content",
    StatusCode.PartialContent: "Partial Content",
    StatusCode.MultiStatus: "Multi-Status",
    StatusCode.AlreadyReported: "Already Reported",
    StatusCode.IMUsed: "IM Used",
    StatusCode.MultipleChoices: "Multiple Choices",
    StatusCode.MovedPermanently: "Moved Permanently",
    StatusCode.Found: "Found",
    StatusCode.SeeOther: "See Other",
    StatusCode.NotModified: "Not Modified",
    StatusCode.UseProxy: "Use Proxy",
    StatusCode.TemporaryRedirect: "Temporary Redirect",
    StatusCode.PermanentRedirect: "Permanent Redirect",
    StatusCode.BadRequest: "Bad Request",
    StatusCode.UnAuthorized: "UnAuthorized",
    StatusCode.PaymentRequired: "Payment Required",
    StatusCode.Forbidden: "Forbidden",
    StatusCode.NotFound: "Not Found",
    StatusCode.MethodNotAllowed: "Method Not Allowed",
    StatusCode.NotAcceptable: "Not Acceptable",
    StatusCode.ProxyAuthRequired: "Proxy Authentication Required",
    StatusCode.RequestTimeout: "Request Timeout",
    StatusCode.Conflict: "Conflict",
    StatusCode.Gone: "Gone",
    StatusCode.LengthRequired: "Length Required",
    StatusCode.PreconditionFailed: "Precondition Failed",
    StatusCode.RequestEntityTooLarge: "Request Entity Too Large",
    StatusCode.RequestURITooLong: "Request URI Too Long",
    StatusCode.UnsupportedMediaType: "Unsupported Media Type",
    StatusCode.RequestedRangeNotSatisfiable: "Requested Range Not Satisfiable",
    StatusCode.ExpectationFailed: "Expectation Failed",
    StatusCode.Teapot: "I'm a teapot",
    StatusCode.MisdirectedRequest: "Misdirected Request",
    StatusCode.UnprocessableEntity: "Unprocessable Entity",
    StatusCode.Locked: "Locked",
    StatusCode.FailedDependency: "Failed Dependency",
    StatusCode.TooEarly: "Too Early",
    StatusCode.UpgradeRequired: "Upgrade Required",
    StatusCode.PreconditionRequired: "Precondition Required",
    StatusCode.TooManyRequests: "Too Many Requests",
    StatusCode.RequestHeaderFieldsTooLarge: "Request Header Fields Too Large",
    StatusCode.UnavailableForLegalReasons: "Unavailable For Legal Reasons",
    StatusCode.InternalServerError: "Internal Server Error",
    StatusCode.NotImplemented: "Not Implemented",
    StatusCode.BadGateway: "Bad Gateway",
    StatusCode.ServiceUnavailable: "Service Unavailable",
    StatusCode.GatewayTimeout: "Gateway Timeout",
    StatusCode.HTTPVersionNotSupported: "HTTP Version Not Supported",
    StatusCode.VariantAlsoNegotiates: "Variant Also Negotiates",
    StatusCode.InsufficientStorage: "Insufficient Storage",
    StatusCode.LoopDetected: "Loop Detected",
    StatusCode.NotExtended: "Not Extended",
    StatusCode.NetworkAuthenticationRequired: "Network Authentication Required",
}.toTable
