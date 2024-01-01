/* tslint:disable */
/* eslint-disable */
/**
 * Corbado Backend API
 *  # Introduction This documentation gives an overview of all Corbado Backend API calls to implement passwordless authentication with Passkeys.  The Corbado Backend API is organized around REST principles. It uses resource-oriented URLs with verbs (HTTP methods) and HTTP status codes. Requests need to be valid JSON payloads. We always return JSON.  The Corbado Backend API specification is written in **OpenAPI Version 3.0.3**. You can download it via the download button at the top and use it to generate clients in languages we do not provide officially for example.  # Authentication To authenticate your API requests HTTP Basic Auth is used.  You need to set the projectID as username and the API secret as password. The authorization header looks as follows:  `Basic <<projectID>:<API secret>>`  The **authorization header** needs to be **Base64 encoded** to be working. If the authorization header is missing or incorrect, the API will respond with status code 401.  # Error types As mentioned above we make use of HTTP status codes. **4xx** errors indicate so called client errors, meaning the error occurred on client side and you need to fix it. **5xx** errors indicate server errors, which means the error occurred on server side and outside your control.  Besides HTTP status codes Corbado uses what we call error types which gives more details in error cases and help you to debug your request.  ## internal_error The error type **internal_error** is used when some internal error occurred at Corbado. You can retry your request but usually there is nothing you can do about it. All internal errors get logged and will triggert an alert to our operations team which takes care of the situation as soon as possible.  ## not_found The error type **not_found** is used when you try to get a resource which cannot be found. Most common case is that you provided a wrong ID.  ## method_not_allowed The error type **method_not_allowed** is used when you use a HTTP method (GET for example) on a resource/endpoint which it not supports.   ## validation_error The error type **validation_error** is used when there is validation error on the data you provided in the request payload or path. There will be detailed information in the JSON response about the validation error like what exactly went wrong on what field.   ## project_id_mismatch The error type **project_id_mismatch** is used when there is a project ID you provided mismatch.  ## login_error The error type **login_error** is used when the authentication failed. Most common case is that you provided a wrong pair of project ID and API secret. As mentioned above with use HTTP Basic Auth for authentication.  ## invalid_json The error type **invalid_json** is used when you send invalid JSON as request body. There will be detailed information in the JSON response about what went wrong.  ## rate_limited The error type **rate_limited** is used when ran into rate limiting of the Corbado Backend API. Right now you can do a maximum of **2000 requests** within **10 seconds** from a **single IP**. Throttle your requests and try again. If you think you need more contact support@corbado.com.  ## invalid_origin The error type **invalid_origin** is used when the API has been called from a origin which is not authorized (CORS). Add the origin to your project at https://app.corbado.com/app/settings/credentials/authorized-origins.  ## already_exists The error type **already_exists** is used when you try create a resource which already exists. Most common case is that there is some unique constraint on one of the fields.  # Security and privacy Corbado services are designed, developed, monitored, and updated with security at our core to protect you and your customers’ data and privacy.  ## Security  ### Infrastructure security Corbado leverages highly available and secure cloud infrastructure to ensure that our services are always available and securely delivered. Corbado\'s services are operated in uvensys GmbH\'s data centers in Germany and comply with ISO standard 27001. All data centers have redundant power and internet connections to avoid failure. The main location of the servers used is in Linden and offers 24/7 support. We do not use any AWS, GCP or Azure services.  Each server is monitored 24/7 and in the event of problems, automated information is sent via SMS and e-mail. The monitoring is done by the external service provider Serverguard24 GmbH.   All Corbado hardware and networking is routinely updated and audited to ensure systems are secure and that least privileged access is followed. Additionally we implement robust logging and audit protocols that allow us high visibility into system use.  ### Responsible disclosure program Here at Corbado, we take the security of our user’s data and of our services seriously. As such, we encourage responsible security research on Corbado services and products. If you believe you’ve discovered a potential vulnerability, please let us know by emailing us at [security@corbado.com](mailto:security@corbado.com). We will acknowledge your email within 2 business days. As public disclosures of a security vulnerability could put the entire Corbado community at risk, we ask that you keep such potential vulnerabilities confidential until we are able to address them. We aim to resolve critical issues within 30 days of disclosure. Please make a good faith effort to avoid violating privacy, destroying data, or interrupting or degrading the Corbado service. Please only interact with accounts you own or for which you have explicit permission from the account holder. While researching, please refrain from:  - Distributed Denial of Service (DDoS) - Spamming - Social engineering or phishing of Corbado employees or contractors - Any attacks against Corbado\'s physical property or data centers  Thank you for helping to keep Corbado and our users safe!  ### Rate limiting At Corbado, we apply rate limit policies on our APIs in order to protect your application and user management infrastructure, so your users will have a frictionless non-interrupted experience.  Corbado responds with HTTP status code 429 (too many requests) when the rate limits exceed. Your code logic should be able to handle such cases by checking the status code on the response and recovering from such cases. If a retry is needed, it is best to allow for a back-off to avoid going into an infinite retry loop.  The current rate limit for all our API endpoints is **max. 100 requests per 10 seconds**.  ## Privacy Corbado is committed to protecting the personal data of our customers and their customers. Corbado has in place appropriate data security measures that meet industry standards. We regularly review and make enhancements to our processes, products, documentation, and contracts to help support ours and our customers’ compliance for the processing of personal data.  We try to minimize the usage and processing of personally identifiable information. Therefore, all our services are constructed to avoid unnecessary data consumption.  To make our services work, we only require the following data: - any kind of identifier (e.g. UUID, phone number, email address) - IP address (only temporarily for rate limiting aspects) - User agent (for device management) 
 *
 * The version of the OpenAPI document: 1.0.0
 * Contact: support@corbado.com
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */


import type { Configuration } from './configuration';
import type { AxiosPromise, AxiosInstance, RawAxiosRequestConfig } from 'axios';
import globalAxios from 'axios';
// Some imports not used depending on template conditions
// @ts-ignore
import { DUMMY_BASE_URL, assertParamExists, setApiKeyToObject, setBasicAuthToObject, setBearerAuthToObject, setOAuthToObject, setSearchParams, serializeDataIfNeeded, toPathString, createRequestFunction } from './common';
import type { RequestArgs } from './base';
// @ts-ignore
import { BASE_PATH, COLLECTION_FORMATS, BaseAPI, RequiredError, operationServerMap } from './base';

/**
 * 
 * @export
 * @interface AndroidAppConfigDeleteReq
 */
export interface AndroidAppConfigDeleteReq {
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof AndroidAppConfigDeleteReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof AndroidAppConfigDeleteReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface AndroidAppConfigItem
 */
export interface AndroidAppConfigItem {
    /**
     * ID of Android app configuration
     * @type {string}
     * @memberof AndroidAppConfigItem
     */
    'id': string;
    /**
     * ID of project
     * @type {string}
     * @memberof AndroidAppConfigItem
     */
    'projectID': string;
    /**
     * 
     * @type {string}
     * @memberof AndroidAppConfigItem
     */
    'packageName': string;
    /**
     * 
     * @type {string}
     * @memberof AndroidAppConfigItem
     */
    'fingerprint': string;
    /**
     * 
     * @type {string}
     * @memberof AndroidAppConfigItem
     */
    'base64URL': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof AndroidAppConfigItem
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof AndroidAppConfigItem
     */
    'updated': string;
}
/**
 * 
 * @export
 * @interface AndroidAppConfigListRsp
 */
export interface AndroidAppConfigListRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof AndroidAppConfigListRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof AndroidAppConfigListRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof AndroidAppConfigListRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof AndroidAppConfigListRsp
     */
    'runtime': number;
    /**
     * 
     * @type {Array<AndroidAppConfigItem>}
     * @memberof AndroidAppConfigListRsp
     */
    'rows': Array<AndroidAppConfigItem>;
    /**
     * 
     * @type {Paging}
     * @memberof AndroidAppConfigListRsp
     */
    'paging': Paging;
}
/**
 * 
 * @export
 * @interface AndroidAppConfigSaveReq
 */
export interface AndroidAppConfigSaveReq {
    /**
     * 
     * @type {string}
     * @memberof AndroidAppConfigSaveReq
     */
    'packageName': string;
    /**
     * 
     * @type {string}
     * @memberof AndroidAppConfigSaveReq
     */
    'fingerprint': string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof AndroidAppConfigSaveReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof AndroidAppConfigSaveReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface AndroidAppConfigSaveRsp
 */
export interface AndroidAppConfigSaveRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof AndroidAppConfigSaveRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof AndroidAppConfigSaveRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof AndroidAppConfigSaveRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof AndroidAppConfigSaveRsp
     */
    'runtime': number;
    /**
     * ID of Android app configuration
     * @type {string}
     * @memberof AndroidAppConfigSaveRsp
     */
    'id': string;
    /**
     * ID of project
     * @type {string}
     * @memberof AndroidAppConfigSaveRsp
     */
    'projectID': string;
    /**
     * 
     * @type {string}
     * @memberof AndroidAppConfigSaveRsp
     */
    'packageName': string;
    /**
     * 
     * @type {string}
     * @memberof AndroidAppConfigSaveRsp
     */
    'fingerprint': string;
    /**
     * 
     * @type {string}
     * @memberof AndroidAppConfigSaveRsp
     */
    'base64URL': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof AndroidAppConfigSaveRsp
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof AndroidAppConfigSaveRsp
     */
    'updated': string;
}
/**
 * 
 * @export
 * @interface AndroidAppConfigUpdateReq
 */
export interface AndroidAppConfigUpdateReq {
    /**
     * 
     * @type {string}
     * @memberof AndroidAppConfigUpdateReq
     */
    'packageName': string;
    /**
     * 
     * @type {string}
     * @memberof AndroidAppConfigUpdateReq
     */
    'fingerprint': string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof AndroidAppConfigUpdateReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof AndroidAppConfigUpdateReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface AndroidAppConfigUpdateRsp
 */
export interface AndroidAppConfigUpdateRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof AndroidAppConfigUpdateRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof AndroidAppConfigUpdateRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof AndroidAppConfigUpdateRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof AndroidAppConfigUpdateRsp
     */
    'runtime': number;
    /**
     * ID of Android app configuration
     * @type {string}
     * @memberof AndroidAppConfigUpdateRsp
     */
    'id': string;
    /**
     * ID of project
     * @type {string}
     * @memberof AndroidAppConfigUpdateRsp
     */
    'projectID': string;
    /**
     * 
     * @type {string}
     * @memberof AndroidAppConfigUpdateRsp
     */
    'packageName': string;
    /**
     * 
     * @type {string}
     * @memberof AndroidAppConfigUpdateRsp
     */
    'fingerprint': string;
    /**
     * 
     * @type {string}
     * @memberof AndroidAppConfigUpdateRsp
     */
    'base64URL': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof AndroidAppConfigUpdateRsp
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof AndroidAppConfigUpdateRsp
     */
    'updated': string;
}
/**
 * Application type
 * @export
 * @enum {string}
 */

export const AppType = {
    Empty: 'empty',
    Web: 'web',
    Native: 'native'
} as const;

export type AppType = typeof AppType[keyof typeof AppType];


/**
 * 
 * @export
 * @interface AssociationTokenCreateReq
 */
export interface AssociationTokenCreateReq {
    /**
     * 
     * @type {string}
     * @memberof AssociationTokenCreateReq
     */
    'loginIdentifier': string;
    /**
     * 
     * @type {LoginIdentifierType}
     * @memberof AssociationTokenCreateReq
     */
    'loginIdentifierType': LoginIdentifierType;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof AssociationTokenCreateReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof AssociationTokenCreateReq
     */
    'clientInfo': ClientInfo;
}


/**
 * 
 * @export
 * @interface AssociationTokenCreateRsp
 */
export interface AssociationTokenCreateRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof AssociationTokenCreateRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof AssociationTokenCreateRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof AssociationTokenCreateRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof AssociationTokenCreateRsp
     */
    'runtime': number;
    /**
     * 
     * @type {AssociationTokenCreateRspAllOfData}
     * @memberof AssociationTokenCreateRsp
     */
    'data': AssociationTokenCreateRspAllOfData;
}
/**
 * 
 * @export
 * @interface AssociationTokenCreateRspAllOfData
 */
export interface AssociationTokenCreateRspAllOfData {
    /**
     * 
     * @type {string}
     * @memberof AssociationTokenCreateRspAllOfData
     */
    'token'?: string;
    /**
     * 
     * @type {string}
     * @memberof AssociationTokenCreateRspAllOfData
     */
    'rejectionReason'?: string;
}
/**
 * Authentication methods
 * @export
 * @enum {string}
 */

export const AuthMethod = {
    Email: 'email',
    PhoneNumber: 'phone_number',
    Webauthn: 'webauthn',
    Password: 'password'
} as const;

export type AuthMethod = typeof AuthMethod[keyof typeof AuthMethod];


/**
 * 
 * @export
 * @interface AuthMethodsListReq
 */
export interface AuthMethodsListReq {
    /**
     * Client\'s username
     * @type {string}
     * @memberof AuthMethodsListReq
     */
    'username': string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof AuthMethodsListReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof AuthMethodsListReq
     */
    'clientInfo': ClientInfo;
}
/**
 * 
 * @export
 * @interface AuthMethodsListRsp
 */
export interface AuthMethodsListRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof AuthMethodsListRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof AuthMethodsListRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof AuthMethodsListRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof AuthMethodsListRsp
     */
    'runtime': number;
    /**
     * 
     * @type {AuthMethodsListRspAllOfData}
     * @memberof AuthMethodsListRsp
     */
    'data': AuthMethodsListRspAllOfData;
}
/**
 * 
 * @export
 * @interface AuthMethodsListRspAllOfData
 */
export interface AuthMethodsListRspAllOfData {
    /**
     * 
     * @type {Array<AuthMethod>}
     * @memberof AuthMethodsListRspAllOfData
     */
    'selectMethods': Array<AuthMethod>;
    /**
     * 
     * @type {Array<AuthMethod>}
     * @memberof AuthMethodsListRspAllOfData
     */
    'possibleMethods': Array<AuthMethod>;
    /**
     * 
     * @type {Paging}
     * @memberof AuthMethodsListRspAllOfData
     */
    'paging': Paging;
}
/**
 * 
 * @export
 * @interface AuthTokenValidateReq
 */
export interface AuthTokenValidateReq {
    /**
     * 
     * @type {string}
     * @memberof AuthTokenValidateReq
     */
    'token': string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof AuthTokenValidateReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof AuthTokenValidateReq
     */
    'clientInfo': ClientInfo;
}
/**
 * 
 * @export
 * @interface AuthTokenValidateRsp
 */
export interface AuthTokenValidateRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof AuthTokenValidateRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof AuthTokenValidateRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof AuthTokenValidateRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof AuthTokenValidateRsp
     */
    'runtime': number;
    /**
     * 
     * @type {SessionTokenVerifyRspAllOfData}
     * @memberof AuthTokenValidateRsp
     */
    'data': SessionTokenVerifyRspAllOfData;
}
/**
 * 
 * @export
 * @interface ClientInfo
 */
export interface ClientInfo {
    /**
     * client\'s IP address
     * @type {string}
     * @memberof ClientInfo
     */
    'remoteAddress': string;
    /**
     * client\'s User Agent
     * @type {string}
     * @memberof ClientInfo
     */
    'userAgent': string;
}
/**
 * 
 * @export
 * @interface CustomLoginIdentifier
 */
export interface CustomLoginIdentifier {
    /**
     * ID of the phone number
     * @type {string}
     * @memberof CustomLoginIdentifier
     */
    'ID': string;
    /**
     * 
     * @type {string}
     * @memberof CustomLoginIdentifier
     */
    'identifier': string;
    /**
     * 
     * @type {string}
     * @memberof CustomLoginIdentifier
     */
    'additionalData'?: string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof CustomLoginIdentifier
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof CustomLoginIdentifier
     */
    'updated': string;
}
/**
 * 
 * @export
 * @interface Email
 */
export interface Email {
    /**
     * ID of the email
     * @type {string}
     * @memberof Email
     */
    'ID': string;
    /**
     * 
     * @type {string}
     * @memberof Email
     */
    'email': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof Email
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof Email
     */
    'updated': string;
    /**
     * Timestamp of when the entity was deleted in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof Email
     */
    'deleted'?: string;
    /**
     * 
     * @type {Status}
     * @memberof Email
     */
    'status': Status;
}


/**
 * 
 * @export
 * @interface EmailCode
 */
export interface EmailCode {
    /**
     * ID of the email OTP
     * @type {string}
     * @memberof EmailCode
     */
    'ID': string;
    /**
     * ID of the user
     * @type {string}
     * @memberof EmailCode
     */
    'userID': string;
    /**
     * 
     * @type {string}
     * @memberof EmailCode
     */
    'email': string;
    /**
     * 
     * @type {string}
     * @memberof EmailCode
     */
    'userFullName'?: string;
    /**
     * Additional payload in JSON format
     * @type {string}
     * @memberof EmailCode
     */
    'additionalPayload': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof EmailCode
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof EmailCode
     */
    'updated': string;
    /**
     * status values of an email OTP
     * @type {string}
     * @memberof EmailCode
     */
    'status': EmailCodeStatusEnum;
}

export const EmailCodeStatusEnum = {
    Active: 'active',
    Confirmed: 'confirmed'
} as const;

export type EmailCodeStatusEnum = typeof EmailCodeStatusEnum[keyof typeof EmailCodeStatusEnum];

/**
 * 
 * @export
 * @interface EmailCodeGetRsp
 */
export interface EmailCodeGetRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof EmailCodeGetRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof EmailCodeGetRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof EmailCodeGetRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof EmailCodeGetRsp
     */
    'runtime': number;
    /**
     * 
     * @type {EmailCodeGetRspAllOfData}
     * @memberof EmailCodeGetRsp
     */
    'data': EmailCodeGetRspAllOfData;
}
/**
 * 
 * @export
 * @interface EmailCodeGetRspAllOfData
 */
export interface EmailCodeGetRspAllOfData {
    /**
     * 
     * @type {EmailCode}
     * @memberof EmailCodeGetRspAllOfData
     */
    'emailCode': EmailCode;
}
/**
 * 
 * @export
 * @interface EmailCodeSendReq
 */
export interface EmailCodeSendReq {
    /**
     * Recipient email address
     * @type {string}
     * @memberof EmailCodeSendReq
     */
    'email': string;
    /**
     * Defines if user email should be created if not found
     * @type {boolean}
     * @memberof EmailCodeSendReq
     */
    'create': boolean;
    /**
     * Defines the lifetime of the token that needs to be validated
     * @type {string}
     * @memberof EmailCodeSendReq
     */
    'tokenLifetime'?: string;
    /**
     * Optional user\'s full name to be used if the user wasn\'t found and needs to be created first
     * @type {string}
     * @memberof EmailCodeSendReq
     */
    'userFullName'?: string;
    /**
     * Template name of email to send
     * @type {string}
     * @memberof EmailCodeSendReq
     */
    'templateName'?: string;
    /**
     * Additional payload in JSON format
     * @type {string}
     * @memberof EmailCodeSendReq
     */
    'additionalPayload'?: string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof EmailCodeSendReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof EmailCodeSendReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface EmailCodeSendRsp
 */
export interface EmailCodeSendRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof EmailCodeSendRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof EmailCodeSendRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof EmailCodeSendRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof EmailCodeSendRsp
     */
    'runtime': number;
    /**
     * 
     * @type {EmailCodeSendRspAllOfData}
     * @memberof EmailCodeSendRsp
     */
    'data': EmailCodeSendRspAllOfData;
}
/**
 * 
 * @export
 * @interface EmailCodeSendRspAllOfData
 */
export interface EmailCodeSendRspAllOfData {
    /**
     * 
     * @type {string}
     * @memberof EmailCodeSendRspAllOfData
     */
    'emailCodeID': string;
}
/**
 * 
 * @export
 * @interface EmailCodeValidateReq
 */
export interface EmailCodeValidateReq {
    /**
     * Email OTP to validate
     * @type {string}
     * @memberof EmailCodeValidateReq
     */
    'code': string;
    /**
     * 
     * @type {boolean}
     * @memberof EmailCodeValidateReq
     */
    'createLoginToken'?: boolean;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof EmailCodeValidateReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof EmailCodeValidateReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface EmailCodeValidateRsp
 */
export interface EmailCodeValidateRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof EmailCodeValidateRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof EmailCodeValidateRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof EmailCodeValidateRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof EmailCodeValidateRsp
     */
    'runtime': number;
    /**
     * Additional payload in JSON format
     * @type {string}
     * @memberof EmailCodeValidateRsp
     */
    'additionalPayload'?: string;
    /**
     * ID of the user
     * @type {string}
     * @memberof EmailCodeValidateRsp
     */
    'userID': string;
    /**
     * 
     * @type {string}
     * @memberof EmailCodeValidateRsp
     */
    'userFullName': string;
    /**
     * 
     * @type {string}
     * @memberof EmailCodeValidateRsp
     */
    'userEmail': string;
    /**
     * 
     * @type {string}
     * @memberof EmailCodeValidateRsp
     */
    'loginToken'?: string;
}
/**
 * 
 * @export
 * @interface EmailLink
 */
export interface EmailLink {
    /**
     * ID of the email magic link
     * @type {string}
     * @memberof EmailLink
     */
    'ID': string;
    /**
     * ID of the user
     * @type {string}
     * @memberof EmailLink
     */
    'userID': string;
    /**
     * 
     * @type {string}
     * @memberof EmailLink
     */
    'email': string;
    /**
     * 
     * @type {string}
     * @memberof EmailLink
     */
    'userFullName'?: string;
    /**
     * 
     * @type {string}
     * @memberof EmailLink
     */
    'purpose'?: string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof EmailLink
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof EmailLink
     */
    'updated': string;
    /**
     * status values of an email link
     * @type {string}
     * @memberof EmailLink
     */
    'status': EmailLinkStatusEnum;
    /**
     * Additional payload in JSON format
     * @type {string}
     * @memberof EmailLink
     */
    'additionalPayload': string;
}

export const EmailLinkStatusEnum = {
    Active: 'active',
    Confirmed: 'confirmed'
} as const;

export type EmailLinkStatusEnum = typeof EmailLinkStatusEnum[keyof typeof EmailLinkStatusEnum];

/**
 * 
 * @export
 * @interface EmailLinkGetRsp
 */
export interface EmailLinkGetRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof EmailLinkGetRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof EmailLinkGetRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof EmailLinkGetRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof EmailLinkGetRsp
     */
    'runtime': number;
    /**
     * 
     * @type {EmailLinkGetRspAllOfData}
     * @memberof EmailLinkGetRsp
     */
    'data': EmailLinkGetRspAllOfData;
}
/**
 * 
 * @export
 * @interface EmailLinkGetRspAllOfData
 */
export interface EmailLinkGetRspAllOfData {
    /**
     * 
     * @type {EmailLink}
     * @memberof EmailLinkGetRspAllOfData
     */
    'emailLink': EmailLink;
}
/**
 * 
 * @export
 * @interface EmailLinkSendReq
 */
export interface EmailLinkSendReq {
    /**
     * Recipient email address
     * @type {string}
     * @memberof EmailLinkSendReq
     */
    'email': string;
    /**
     * Defines if user email should be created if not found
     * @type {boolean}
     * @memberof EmailLinkSendReq
     */
    'create': boolean;
    /**
     * Defines the lifetime of the token that needs to be validated
     * @type {string}
     * @memberof EmailLinkSendReq
     */
    'tokenLifetime'?: string;
    /**
     * Optional user\'s full name to be used if the user wasn\'t found and needs to be created first
     * @type {string}
     * @memberof EmailLinkSendReq
     */
    'userFullName'?: string;
    /**
     * Template name of email to send
     * @type {string}
     * @memberof EmailLinkSendReq
     */
    'templateName'?: string;
    /**
     * Purpose of the email link
     * @type {string}
     * @memberof EmailLinkSendReq
     */
    'purpose'?: EmailLinkSendReqPurposeEnum;
    /**
     * Redirect target after user clicks on email magic link
     * @type {string}
     * @memberof EmailLinkSendReq
     */
    'redirect': string;
    /**
     * Additional payload in JSON format
     * @type {string}
     * @memberof EmailLinkSendReq
     */
    'additionalPayload'?: string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof EmailLinkSendReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof EmailLinkSendReq
     */
    'clientInfo'?: ClientInfo;
}

export const EmailLinkSendReqPurposeEnum = {
    Authentication: 'authentication',
    Confirmation: 'confirmation',
    Invitation: 'invitation'
} as const;

export type EmailLinkSendReqPurposeEnum = typeof EmailLinkSendReqPurposeEnum[keyof typeof EmailLinkSendReqPurposeEnum];

/**
 * 
 * @export
 * @interface EmailLinkSendRsp
 */
export interface EmailLinkSendRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof EmailLinkSendRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof EmailLinkSendRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof EmailLinkSendRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof EmailLinkSendRsp
     */
    'runtime': number;
    /**
     * 
     * @type {EmailLinkSendRspAllOfData}
     * @memberof EmailLinkSendRsp
     */
    'data': EmailLinkSendRspAllOfData;
}
/**
 * 
 * @export
 * @interface EmailLinkSendRspAllOfData
 */
export interface EmailLinkSendRspAllOfData {
    /**
     * 
     * @type {string}
     * @memberof EmailLinkSendRspAllOfData
     */
    'emailLinkID': string;
}
/**
 * 
 * @export
 * @interface EmailLinkValidateRsp
 */
export interface EmailLinkValidateRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof EmailLinkValidateRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof EmailLinkValidateRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof EmailLinkValidateRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof EmailLinkValidateRsp
     */
    'runtime': number;
    /**
     * Additional payload in JSON format
     * @type {string}
     * @memberof EmailLinkValidateRsp
     */
    'additionalPayload'?: string;
    /**
     * ID of the user
     * @type {string}
     * @memberof EmailLinkValidateRsp
     */
    'userID': string;
    /**
     * 
     * @type {string}
     * @memberof EmailLinkValidateRsp
     */
    'userFullName': string;
    /**
     * 
     * @type {string}
     * @memberof EmailLinkValidateRsp
     */
    'userEmail': string;
    /**
     * 
     * @type {string}
     * @memberof EmailLinkValidateRsp
     */
    'loginToken'?: string;
}
/**
 * 
 * @export
 * @interface EmailLinksDeleteReq
 */
export interface EmailLinksDeleteReq {
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof EmailLinksDeleteReq
     */
    'requestID': string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof EmailLinksDeleteReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface EmailLinksValidateReq
 */
export interface EmailLinksValidateReq {
    /**
     * Token to validate
     * @type {string}
     * @memberof EmailLinksValidateReq
     */
    'token': string;
    /**
     * 
     * @type {boolean}
     * @memberof EmailLinksValidateReq
     */
    'createLoginToken'?: boolean;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof EmailLinksValidateReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof EmailLinksValidateReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface EmailTemplateCreateReq
 */
export interface EmailTemplateCreateReq {
    /**
     * 
     * @type {string}
     * @memberof EmailTemplateCreateReq
     */
    'lang': EmailTemplateCreateReqLangEnum;
    /**
     * 
     * @type {string}
     * @memberof EmailTemplateCreateReq
     */
    'type': EmailTemplateCreateReqTypeEnum;
    /**
     * 
     * @type {string}
     * @memberof EmailTemplateCreateReq
     */
    'name': string;
    /**
     * 
     * @type {string}
     * @memberof EmailTemplateCreateReq
     */
    'subject': string;
    /**
     * 
     * @type {string}
     * @memberof EmailTemplateCreateReq
     */
    'action'?: string;
    /**
     * 
     * @type {string}
     * @memberof EmailTemplateCreateReq
     */
    'plainTextBody': string;
    /**
     * 
     * @type {string}
     * @memberof EmailTemplateCreateReq
     */
    'htmlTextTitle': string;
    /**
     * 
     * @type {string}
     * @memberof EmailTemplateCreateReq
     */
    'htmlTextBody': string;
    /**
     * 
     * @type {string}
     * @memberof EmailTemplateCreateReq
     */
    'htmlTextButton': string;
    /**
     * 
     * @type {string}
     * @memberof EmailTemplateCreateReq
     */
    'htmlColorFont': string;
    /**
     * 
     * @type {string}
     * @memberof EmailTemplateCreateReq
     */
    'htmlColorBackgroundOuter': string;
    /**
     * 
     * @type {string}
     * @memberof EmailTemplateCreateReq
     */
    'htmlColorBackgroundInner': string;
    /**
     * 
     * @type {string}
     * @memberof EmailTemplateCreateReq
     */
    'htmlColorButton': string;
    /**
     * 
     * @type {string}
     * @memberof EmailTemplateCreateReq
     */
    'htmlColorButtonFont': string;
    /**
     * 
     * @type {boolean}
     * @memberof EmailTemplateCreateReq
     */
    'isDefault': boolean;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof EmailTemplateCreateReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof EmailTemplateCreateReq
     */
    'clientInfo'?: ClientInfo;
}

export const EmailTemplateCreateReqLangEnum = {
    En: 'en',
    De: 'de',
    Fr: 'fr'
} as const;

export type EmailTemplateCreateReqLangEnum = typeof EmailTemplateCreateReqLangEnum[keyof typeof EmailTemplateCreateReqLangEnum];
export const EmailTemplateCreateReqTypeEnum = {
    EmailLink: 'email_link',
    EmailLinkLogin: 'email_link_login',
    LoginNotification: 'login_notification',
    PasskeyNotification: 'passkey_notification',
    EmailCode: 'email_code'
} as const;

export type EmailTemplateCreateReqTypeEnum = typeof EmailTemplateCreateReqTypeEnum[keyof typeof EmailTemplateCreateReqTypeEnum];

/**
 * 
 * @export
 * @interface EmailTemplateCreateRsp
 */
export interface EmailTemplateCreateRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof EmailTemplateCreateRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof EmailTemplateCreateRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof EmailTemplateCreateRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof EmailTemplateCreateRsp
     */
    'runtime': number;
    /**
     * 
     * @type {EmailTemplateCreateRspAllOfData}
     * @memberof EmailTemplateCreateRsp
     */
    'data': EmailTemplateCreateRspAllOfData;
}
/**
 * 
 * @export
 * @interface EmailTemplateCreateRspAllOfData
 */
export interface EmailTemplateCreateRspAllOfData {
    /**
     * 
     * @type {string}
     * @memberof EmailTemplateCreateRspAllOfData
     */
    'emailTemplateID': string;
}
/**
 * 
 * @export
 * @interface EmailTemplateDeleteReq
 */
export interface EmailTemplateDeleteReq {
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof EmailTemplateDeleteReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof EmailTemplateDeleteReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface EmailValidationResult
 */
export interface EmailValidationResult {
    /**
     * 
     * @type {boolean}
     * @memberof EmailValidationResult
     */
    'isValid': boolean;
    /**
     * 
     * @type {string}
     * @memberof EmailValidationResult
     */
    'validationCode': EmailValidationResultValidationCodeEnum;
    /**
     * 
     * @type {string}
     * @memberof EmailValidationResult
     */
    'suggestion'?: string;
    /**
     * 
     * @type {ValidationEmail}
     * @memberof EmailValidationResult
     */
    'email'?: ValidationEmail;
}

export const EmailValidationResultValidationCodeEnum = {
    Valid: 'valid',
    InvalidSyntax: 'invalid_syntax',
    NoSuchHost: 'no_such_host',
    NotAllowed: 'not_allowed',
    Unknown: 'unknown'
} as const;

export type EmailValidationResultValidationCodeEnum = typeof EmailValidationResultValidationCodeEnum[keyof typeof EmailValidationResultValidationCodeEnum];

/**
 * 
 * @export
 * @interface EmptyReq
 */
export interface EmptyReq {
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof EmptyReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof EmptyReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface ErrorRsp
 */
export interface ErrorRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof ErrorRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof ErrorRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof ErrorRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof ErrorRsp
     */
    'runtime': number;
    /**
     * 
     * @type {object}
     * @memberof ErrorRsp
     */
    'data'?: object;
    /**
     * 
     * @type {ErrorRspAllOfError}
     * @memberof ErrorRsp
     */
    'error': ErrorRspAllOfError;
}
/**
 * 
 * @export
 * @interface ErrorRspAllOfError
 */
export interface ErrorRspAllOfError {
    /**
     * Type of error
     * @type {string}
     * @memberof ErrorRspAllOfError
     */
    'type': string;
    /**
     * Details of error
     * @type {string}
     * @memberof ErrorRspAllOfError
     */
    'details'?: string;
    /**
     * Validation errors per field
     * @type {Array<ErrorRspAllOfErrorValidation>}
     * @memberof ErrorRspAllOfError
     */
    'validation'?: Array<ErrorRspAllOfErrorValidation>;
    /**
     * Additional links to help understand the error
     * @type {Array<string>}
     * @memberof ErrorRspAllOfError
     */
    'links': Array<string>;
}
/**
 * 
 * @export
 * @interface ErrorRspAllOfErrorValidation
 */
export interface ErrorRspAllOfErrorValidation {
    /**
     * 
     * @type {string}
     * @memberof ErrorRspAllOfErrorValidation
     */
    'field': string;
    /**
     * 
     * @type {string}
     * @memberof ErrorRspAllOfErrorValidation
     */
    'message': string;
}
/**
 * 
 * @export
 * @interface ExampleGetRsp
 */
export interface ExampleGetRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof ExampleGetRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof ExampleGetRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof ExampleGetRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof ExampleGetRsp
     */
    'runtime': number;
    /**
     * Base64 encoded data containing the compressed example file
     * @type {string}
     * @memberof ExampleGetRsp
     */
    'data': string;
    /**
     * The extension of the compressed example file
     * @type {string}
     * @memberof ExampleGetRsp
     */
    'extension': ExampleGetRspExtensionEnum;
}

export const ExampleGetRspExtensionEnum = {
    Zip: 'zip',
    TarGz: 'tar.gz'
} as const;

export type ExampleGetRspExtensionEnum = typeof ExampleGetRspExtensionEnum[keyof typeof ExampleGetRspExtensionEnum];

/**
 * User entry with emails and phone numbers
 * @export
 * @interface FullUser
 */
export interface FullUser {
    /**
     * ID of the user
     * @type {string}
     * @memberof FullUser
     */
    'ID': string;
    /**
     * 
     * @type {string}
     * @memberof FullUser
     */
    'name': string;
    /**
     * 
     * @type {string}
     * @memberof FullUser
     */
    'fullName': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof FullUser
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof FullUser
     */
    'updated': string;
    /**
     * 
     * @type {Status}
     * @memberof FullUser
     */
    'status': Status;
    /**
     * 
     * @type {Array<UserEmail>}
     * @memberof FullUser
     */
    'emails': Array<UserEmail>;
    /**
     * 
     * @type {Array<UserPhoneNumber>}
     * @memberof FullUser
     */
    'phoneNumbers': Array<UserPhoneNumber>;
}


/**
 * 
 * @export
 * @interface GenericRsp
 */
export interface GenericRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof GenericRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof GenericRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof GenericRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof GenericRsp
     */
    'runtime': number;
}
/**
 * 
 * @export
 * @interface IOSAppConfigDeleteReq
 */
export interface IOSAppConfigDeleteReq {
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof IOSAppConfigDeleteReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof IOSAppConfigDeleteReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface IOSAppConfigItem
 */
export interface IOSAppConfigItem {
    /**
     * ID of iOS app
     * @type {string}
     * @memberof IOSAppConfigItem
     */
    'id': string;
    /**
     * ID of project
     * @type {string}
     * @memberof IOSAppConfigItem
     */
    'projectID': string;
    /**
     * 
     * @type {string}
     * @memberof IOSAppConfigItem
     */
    'appIDPrefix': string;
    /**
     * 
     * @type {string}
     * @memberof IOSAppConfigItem
     */
    'bundleID': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof IOSAppConfigItem
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof IOSAppConfigItem
     */
    'updated': string;
}
/**
 * 
 * @export
 * @interface IOSAppConfigListRsp
 */
export interface IOSAppConfigListRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof IOSAppConfigListRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof IOSAppConfigListRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof IOSAppConfigListRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof IOSAppConfigListRsp
     */
    'runtime': number;
    /**
     * 
     * @type {Array<IOSAppConfigItem>}
     * @memberof IOSAppConfigListRsp
     */
    'rows': Array<IOSAppConfigItem>;
    /**
     * 
     * @type {Paging}
     * @memberof IOSAppConfigListRsp
     */
    'paging': Paging;
}
/**
 * 
 * @export
 * @interface IOSAppConfigSaveReq
 */
export interface IOSAppConfigSaveReq {
    /**
     * 
     * @type {string}
     * @memberof IOSAppConfigSaveReq
     */
    'appIDPrefix': string;
    /**
     * 
     * @type {string}
     * @memberof IOSAppConfigSaveReq
     */
    'bundleID': string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof IOSAppConfigSaveReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof IOSAppConfigSaveReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface IOSAppConfigSaveRsp
 */
export interface IOSAppConfigSaveRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof IOSAppConfigSaveRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof IOSAppConfigSaveRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof IOSAppConfigSaveRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof IOSAppConfigSaveRsp
     */
    'runtime': number;
    /**
     * ID of iOS app
     * @type {string}
     * @memberof IOSAppConfigSaveRsp
     */
    'id': string;
    /**
     * ID of project
     * @type {string}
     * @memberof IOSAppConfigSaveRsp
     */
    'projectID': string;
    /**
     * 
     * @type {string}
     * @memberof IOSAppConfigSaveRsp
     */
    'appIDPrefix': string;
    /**
     * 
     * @type {string}
     * @memberof IOSAppConfigSaveRsp
     */
    'bundleID': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof IOSAppConfigSaveRsp
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof IOSAppConfigSaveRsp
     */
    'updated': string;
}
/**
 * 
 * @export
 * @interface IOSAppConfigUpdateReq
 */
export interface IOSAppConfigUpdateReq {
    /**
     * 
     * @type {string}
     * @memberof IOSAppConfigUpdateReq
     */
    'appIDPrefix': string;
    /**
     * 
     * @type {string}
     * @memberof IOSAppConfigUpdateReq
     */
    'bundleID': string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof IOSAppConfigUpdateReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof IOSAppConfigUpdateReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface IOSAppConfigUpdateRsp
 */
export interface IOSAppConfigUpdateRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof IOSAppConfigUpdateRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof IOSAppConfigUpdateRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof IOSAppConfigUpdateRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof IOSAppConfigUpdateRsp
     */
    'runtime': number;
    /**
     * ID of iOS app
     * @type {string}
     * @memberof IOSAppConfigUpdateRsp
     */
    'id': string;
    /**
     * ID of project
     * @type {string}
     * @memberof IOSAppConfigUpdateRsp
     */
    'projectID': string;
    /**
     * 
     * @type {string}
     * @memberof IOSAppConfigUpdateRsp
     */
    'appIDPrefix': string;
    /**
     * 
     * @type {string}
     * @memberof IOSAppConfigUpdateRsp
     */
    'bundleID': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof IOSAppConfigUpdateRsp
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof IOSAppConfigUpdateRsp
     */
    'updated': string;
}
/**
 * Login Identifier type
 * @export
 * @enum {string}
 */

export const LoginIdentifierType = {
    Email: 'email',
    PhoneNumber: 'phone_number',
    Custom: 'custom'
} as const;

export type LoginIdentifierType = typeof LoginIdentifierType[keyof typeof LoginIdentifierType];


/**
 * 
 * @export
 * @interface LongSession
 */
export interface LongSession {
    /**
     * 
     * @type {string}
     * @memberof LongSession
     */
    'ID': string;
    /**
     * ID of the user
     * @type {string}
     * @memberof LongSession
     */
    'userID': string;
    /**
     * 
     * @type {string}
     * @memberof LongSession
     */
    'userIdentifier': string;
    /**
     * 
     * @type {string}
     * @memberof LongSession
     */
    'userFullName': string;
    /**
     * ID of the device
     * @type {string}
     * @memberof LongSession
     */
    'deviceID': string;
    /**
     * 
     * @type {string}
     * @memberof LongSession
     */
    'browserName': string;
    /**
     * 
     * @type {string}
     * @memberof LongSession
     */
    'browserVersion': string;
    /**
     * 
     * @type {string}
     * @memberof LongSession
     */
    'osName': string;
    /**
     * 
     * @type {string}
     * @memberof LongSession
     */
    'osVersion': string;
    /**
     * Timestamp of when long session expires in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof LongSession
     */
    'expires': string;
    /**
     * Timestamp of when last action was done on long session in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof LongSession
     */
    'lastAction': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof LongSession
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof LongSession
     */
    'updated': string;
    /**
     * status values of a long session
     * @type {string}
     * @memberof LongSession
     */
    'status': LongSessionStatusEnum;
}

export const LongSessionStatusEnum = {
    Active: 'active',
    LoggedOut: 'logged_out',
    Expired: 'expired',
    InactivityReached: 'inactivity_reached',
    Revoked: 'revoked'
} as const;

export type LongSessionStatusEnum = typeof LongSessionStatusEnum[keyof typeof LongSessionStatusEnum];

/**
 * 
 * @export
 * @interface LongSessionGetRsp
 */
export interface LongSessionGetRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof LongSessionGetRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof LongSessionGetRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof LongSessionGetRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof LongSessionGetRsp
     */
    'runtime': number;
    /**
     * 
     * @type {LongSessionGetRspAllOfData}
     * @memberof LongSessionGetRsp
     */
    'data': LongSessionGetRspAllOfData;
}
/**
 * 
 * @export
 * @interface LongSessionGetRspAllOfData
 */
export interface LongSessionGetRspAllOfData {
    /**
     * 
     * @type {LongSession}
     * @memberof LongSessionGetRspAllOfData
     */
    'longSession': LongSession;
}
/**
 * 
 * @export
 * @interface LongSessionListRsp
 */
export interface LongSessionListRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof LongSessionListRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof LongSessionListRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof LongSessionListRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof LongSessionListRsp
     */
    'runtime': number;
    /**
     * 
     * @type {LongSessionListRspAllOfData}
     * @memberof LongSessionListRsp
     */
    'data': LongSessionListRspAllOfData;
}
/**
 * 
 * @export
 * @interface LongSessionListRspAllOfData
 */
export interface LongSessionListRspAllOfData {
    /**
     * 
     * @type {Array<LongSession>}
     * @memberof LongSessionListRspAllOfData
     */
    'longSessions': Array<LongSession>;
    /**
     * 
     * @type {Paging}
     * @memberof LongSessionListRspAllOfData
     */
    'paging': Paging;
}
/**
 * 
 * @export
 * @interface LongSessionRevokeReq
 */
export interface LongSessionRevokeReq {
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof LongSessionRevokeReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof LongSessionRevokeReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface Paging
 */
export interface Paging {
    /**
     * current page returned in response
     * @type {number}
     * @memberof Paging
     */
    'page': number;
    /**
     * total number of pages available
     * @type {number}
     * @memberof Paging
     */
    'totalPages': number;
    /**
     * total number of items available
     * @type {number}
     * @memberof Paging
     */
    'totalItems': number;
}
/**
 * 
 * @export
 * @interface PhoneNumber
 */
export interface PhoneNumber {
    /**
     * ID of the phone number
     * @type {string}
     * @memberof PhoneNumber
     */
    'ID': string;
    /**
     * 
     * @type {string}
     * @memberof PhoneNumber
     */
    'phoneNumber': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof PhoneNumber
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof PhoneNumber
     */
    'updated': string;
    /**
     * 
     * @type {Status}
     * @memberof PhoneNumber
     */
    'status': Status;
}


/**
 * 
 * @export
 * @interface PhoneNumberValidationResult
 */
export interface PhoneNumberValidationResult {
    /**
     * 
     * @type {boolean}
     * @memberof PhoneNumberValidationResult
     */
    'isValid': boolean;
    /**
     * 
     * @type {string}
     * @memberof PhoneNumberValidationResult
     */
    'validationCode': PhoneNumberValidationResultValidationCodeEnum;
    /**
     * 
     * @type {ValidationPhoneNumber}
     * @memberof PhoneNumberValidationResult
     */
    'phoneNumber'?: ValidationPhoneNumber;
}

export const PhoneNumberValidationResultValidationCodeEnum = {
    Valid: 'valid',
    InvalidCountryCode: 'invalid_country_code',
    InvalidNumber: 'invalid_number',
    TooLong: 'too_long'
} as const;

export type PhoneNumberValidationResultValidationCodeEnum = typeof PhoneNumberValidationResultValidationCodeEnum[keyof typeof PhoneNumberValidationResultValidationCodeEnum];

/**
 * 
 * @export
 * @interface ProjectConfig
 */
export interface ProjectConfig {
    /**
     * ID of project
     * @type {string}
     * @memberof ProjectConfig
     */
    'projectID': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'externalName': string;
    /**
     * 
     * @type {AppType}
     * @memberof ProjectConfig
     */
    'appType': AppType;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'productKey': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'emailFrom': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'smsFrom': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'externalApplicationProtocolVersion': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'webhookURL': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'webhookUsername': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'webhookPassword': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'webhookTestInvalidUsername': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'webhookTestValidUsername': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'webhookTestValidPassword': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'externalApplicationUsername': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'externalApplicationPassword': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'legacyAuthMethodsUrl': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'passwordVerifyUrl': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'authSuccessRedirectUrl': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'passwordResetUrl': string;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfig
     */
    'allowUserRegistration': boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfig
     */
    'allowIPStickiness': boolean;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'passkeyAppendInterval': ProjectConfigPasskeyAppendIntervalEnum;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'cliSecret': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'fallbackLanguage': string;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfig
     */
    'autoDetectLanguage': boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfig
     */
    'integrationModeHosted': boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfig
     */
    'integrationModeAPI': boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfig
     */
    'integrationModeWebComponent': boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfig
     */
    'hasExistingUsers': boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfig
     */
    'hasVerifiedSession': boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfig
     */
    'hasGeneratedSession': boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfig
     */
    'hasStartedUsingPasskeys': boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfig
     */
    'hasStartedUsingSessions': boolean;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'environment': ProjectConfigEnvironmentEnum;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'frontendFramework': ProjectConfigFrontendFrameworkEnum;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'backendLanguage': ProjectConfigBackendLanguageEnum;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'backendAPIUrl': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'frontendAPIUrl': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'applicationUrl': string;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfig
     */
    'useCli': boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfig
     */
    'doubleOptIn': boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfig
     */
    'userFullNameRequired': boolean;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'webauthnRPID': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'domain': string;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfig
     */
    'webComponentDebug': boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfig
     */
    'smtpUseCustom': boolean;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'smtpHost': string;
    /**
     * 
     * @type {number}
     * @memberof ProjectConfig
     */
    'smtpPort': number;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'smtpUsername': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'smtpPassword': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'supportEmail': string;
    /**
     * 
     * @type {Array<string>}
     * @memberof ProjectConfig
     */
    'webhookActions': Array<string>;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'signupFlow': ProjectConfigSignupFlowEnum;
    /**
     * 
     * @type {object}
     * @memberof ProjectConfig
     */
    'signupFlowOptions': object;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'loginFlow': ProjectConfigLoginFlowEnum;
    /**
     * 
     * @type {object}
     * @memberof ProjectConfig
     */
    'loginFlowOptions': object;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof ProjectConfig
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof ProjectConfig
     */
    'updated': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfig
     */
    'status': ProjectConfigStatusEnum;
}

export const ProjectConfigPasskeyAppendIntervalEnum = {
    NotSpecified: 'not_specified',
    _0d: '0d',
    _1d: '1d',
    _3d: '3d',
    _1w: '1w',
    _3w: '3w',
    _1m: '1m',
    _3m: '3m'
} as const;

export type ProjectConfigPasskeyAppendIntervalEnum = typeof ProjectConfigPasskeyAppendIntervalEnum[keyof typeof ProjectConfigPasskeyAppendIntervalEnum];
export const ProjectConfigEnvironmentEnum = {
    Dev: 'dev',
    Prod: 'prod'
} as const;

export type ProjectConfigEnvironmentEnum = typeof ProjectConfigEnvironmentEnum[keyof typeof ProjectConfigEnvironmentEnum];
export const ProjectConfigFrontendFrameworkEnum = {
    NotSpecified: 'not_specified',
    React: 'react',
    Vuejs: 'vuejs',
    Vanillajs: 'vanillajs'
} as const;

export type ProjectConfigFrontendFrameworkEnum = typeof ProjectConfigFrontendFrameworkEnum[keyof typeof ProjectConfigFrontendFrameworkEnum];
export const ProjectConfigBackendLanguageEnum = {
    NotSpecified: 'not_specified',
    Javascript: 'javascript',
    Php: 'php',
    Go: 'go'
} as const;

export type ProjectConfigBackendLanguageEnum = typeof ProjectConfigBackendLanguageEnum[keyof typeof ProjectConfigBackendLanguageEnum];
export const ProjectConfigSignupFlowEnum = {
    PasskeyWithEmailOtpFallback: 'PasskeyWithEmailOTPFallback',
    EmailOtpSignup: 'EmailOTPSignup'
} as const;

export type ProjectConfigSignupFlowEnum = typeof ProjectConfigSignupFlowEnum[keyof typeof ProjectConfigSignupFlowEnum];
export const ProjectConfigLoginFlowEnum = {
    PasskeyWithEmailOtpFallback: 'PasskeyWithEmailOTPFallback'
} as const;

export type ProjectConfigLoginFlowEnum = typeof ProjectConfigLoginFlowEnum[keyof typeof ProjectConfigLoginFlowEnum];
export const ProjectConfigStatusEnum = {
    Active: 'active',
    Configuring: 'configuring'
} as const;

export type ProjectConfigStatusEnum = typeof ProjectConfigStatusEnum[keyof typeof ProjectConfigStatusEnum];

/**
 * 
 * @export
 * @interface ProjectConfigGetRsp
 */
export interface ProjectConfigGetRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof ProjectConfigGetRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigGetRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof ProjectConfigGetRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof ProjectConfigGetRsp
     */
    'runtime': number;
    /**
     * 
     * @type {ProjectConfig}
     * @memberof ProjectConfigGetRsp
     */
    'data': ProjectConfig;
}
/**
 * 
 * @export
 * @interface ProjectConfigSaveReq
 */
export interface ProjectConfigSaveReq {
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfigSaveReq
     */
    'wizard'?: boolean;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'externalName'?: string;
    /**
     * 
     * @type {AppType}
     * @memberof ProjectConfigSaveReq
     */
    'appType'?: AppType;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'productKey'?: string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'emailFrom'?: string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'smsFrom'?: string;
    /**
     * Defines which version of webhook is used
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'externalApplicationProtocolVersion'?: ProjectConfigSaveReqExternalApplicationProtocolVersionEnum;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'webhookURL'?: string;
    /**
     * 
     * @type {Array<string>}
     * @memberof ProjectConfigSaveReq
     */
    'webhookActions'?: Array<string>;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'webhookUsername'?: string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'webhookPassword'?: string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'webhookTestInvalidUsername'?: string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'webhookTestValidUsername'?: string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'webhookTestValidPassword'?: string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'externalApplicationUsername'?: string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'externalApplicationPassword'?: string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'legacyAuthMethodsUrl'?: string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'passwordVerifyUrl'?: string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'authSuccessRedirectUrl'?: string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'passwordResetUrl'?: string;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfigSaveReq
     */
    'allowUserRegistration'?: boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfigSaveReq
     */
    'allowIPStickiness'?: boolean;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'passkeyAppendInterval'?: ProjectConfigSaveReqPasskeyAppendIntervalEnum;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'fallbackLanguage'?: string;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfigSaveReq
     */
    'autoDetectLanguage'?: boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfigSaveReq
     */
    'integrationModeHosted'?: boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfigSaveReq
     */
    'integrationModeAPI'?: boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfigSaveReq
     */
    'integrationModeWebComponent'?: boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfigSaveReq
     */
    'hasExistingUsers'?: boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfigSaveReq
     */
    'hasVerifiedSession'?: boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfigSaveReq
     */
    'hasGeneratedSession'?: boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfigSaveReq
     */
    'hasStartedUsingPasskeys'?: boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfigSaveReq
     */
    'hasStartedUsingSessions'?: boolean;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'applicationUrl'?: string;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfigSaveReq
     */
    'useCli'?: boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfigSaveReq
     */
    'doubleOptIn'?: boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfigSaveReq
     */
    'userFullNameRequired'?: boolean;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'webauthnRPID'?: string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'domain'?: string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'environment'?: ProjectConfigSaveReqEnvironmentEnum;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'frontendFramework'?: ProjectConfigSaveReqFrontendFrameworkEnum;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'backendLanguage'?: ProjectConfigSaveReqBackendLanguageEnum;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfigSaveReq
     */
    'webComponentDebug'?: boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ProjectConfigSaveReq
     */
    'smtpUseCustom'?: boolean;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'smtpHost'?: string;
    /**
     * 
     * @type {number}
     * @memberof ProjectConfigSaveReq
     */
    'smtpPort'?: number;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'smtpUsername'?: string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'smtpPassword'?: string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'supportEmail'?: string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'signupFlow'?: ProjectConfigSaveReqSignupFlowEnum;
    /**
     * 
     * @type {object}
     * @memberof ProjectConfigSaveReq
     */
    'signupFlowOptions'?: object;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'loginFlow'?: ProjectConfigSaveReqLoginFlowEnum;
    /**
     * 
     * @type {object}
     * @memberof ProjectConfigSaveReq
     */
    'loginFlowOptions'?: object;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof ProjectConfigSaveReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof ProjectConfigSaveReq
     */
    'clientInfo'?: ClientInfo;
}

export const ProjectConfigSaveReqExternalApplicationProtocolVersionEnum = {
    V1: 'v1',
    V2: 'v2'
} as const;

export type ProjectConfigSaveReqExternalApplicationProtocolVersionEnum = typeof ProjectConfigSaveReqExternalApplicationProtocolVersionEnum[keyof typeof ProjectConfigSaveReqExternalApplicationProtocolVersionEnum];
export const ProjectConfigSaveReqPasskeyAppendIntervalEnum = {
    _0d: '0d',
    _1d: '1d',
    _3d: '3d',
    _1w: '1w',
    _3w: '3w',
    _1m: '1m',
    _3m: '3m'
} as const;

export type ProjectConfigSaveReqPasskeyAppendIntervalEnum = typeof ProjectConfigSaveReqPasskeyAppendIntervalEnum[keyof typeof ProjectConfigSaveReqPasskeyAppendIntervalEnum];
export const ProjectConfigSaveReqEnvironmentEnum = {
    Dev: 'dev',
    Prod: 'prod'
} as const;

export type ProjectConfigSaveReqEnvironmentEnum = typeof ProjectConfigSaveReqEnvironmentEnum[keyof typeof ProjectConfigSaveReqEnvironmentEnum];
export const ProjectConfigSaveReqFrontendFrameworkEnum = {
    React: 'react',
    Vuejs: 'vuejs',
    Vanillajs: 'vanillajs'
} as const;

export type ProjectConfigSaveReqFrontendFrameworkEnum = typeof ProjectConfigSaveReqFrontendFrameworkEnum[keyof typeof ProjectConfigSaveReqFrontendFrameworkEnum];
export const ProjectConfigSaveReqBackendLanguageEnum = {
    Javascript: 'javascript',
    Php: 'php',
    Go: 'go'
} as const;

export type ProjectConfigSaveReqBackendLanguageEnum = typeof ProjectConfigSaveReqBackendLanguageEnum[keyof typeof ProjectConfigSaveReqBackendLanguageEnum];
export const ProjectConfigSaveReqSignupFlowEnum = {
    PasskeyWithEmailOtpFallback: 'PasskeyWithEmailOTPFallback',
    EmailOtpSignup: 'EmailOTPSignup'
} as const;

export type ProjectConfigSaveReqSignupFlowEnum = typeof ProjectConfigSaveReqSignupFlowEnum[keyof typeof ProjectConfigSaveReqSignupFlowEnum];
export const ProjectConfigSaveReqLoginFlowEnum = {
    PasskeyWithEmailOtpFallback: 'PasskeyWithEmailOTPFallback'
} as const;

export type ProjectConfigSaveReqLoginFlowEnum = typeof ProjectConfigSaveReqLoginFlowEnum[keyof typeof ProjectConfigSaveReqLoginFlowEnum];

/**
 * 
 * @export
 * @interface ProjectConfigWebhookTestReq
 */
export interface ProjectConfigWebhookTestReq {
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigWebhookTestReq
     */
    'action': ProjectConfigWebhookTestReqActionEnum;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof ProjectConfigWebhookTestReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof ProjectConfigWebhookTestReq
     */
    'clientInfo'?: ClientInfo;
}

export const ProjectConfigWebhookTestReqActionEnum = {
    AuthMethods: 'authMethods',
    PasswordVerify: 'passwordVerify'
} as const;

export type ProjectConfigWebhookTestReqActionEnum = typeof ProjectConfigWebhookTestReqActionEnum[keyof typeof ProjectConfigWebhookTestReqActionEnum];

/**
 * 
 * @export
 * @interface ProjectConfigWebhookTestRsp
 */
export interface ProjectConfigWebhookTestRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof ProjectConfigWebhookTestRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigWebhookTestRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof ProjectConfigWebhookTestRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof ProjectConfigWebhookTestRsp
     */
    'runtime': number;
    /**
     * 
     * @type {ProjectConfigWebhookTestRspAllOfData}
     * @memberof ProjectConfigWebhookTestRsp
     */
    'data': ProjectConfigWebhookTestRspAllOfData;
}
/**
 * 
 * @export
 * @interface ProjectConfigWebhookTestRspAllOfData
 */
export interface ProjectConfigWebhookTestRspAllOfData {
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigWebhookTestRspAllOfData
     */
    'code': string;
    /**
     * 
     * @type {string}
     * @memberof ProjectConfigWebhookTestRspAllOfData
     */
    'details': string;
    /**
     * 
     * @type {number}
     * @memberof ProjectConfigWebhookTestRspAllOfData
     */
    'runtime': number;
}
/**
 * 
 * @export
 * @interface ProjectSecretCreateReq
 */
export interface ProjectSecretCreateReq {
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof ProjectSecretCreateReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof ProjectSecretCreateReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface ProjectSecretCreateRsp
 */
export interface ProjectSecretCreateRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof ProjectSecretCreateRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof ProjectSecretCreateRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof ProjectSecretCreateRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof ProjectSecretCreateRsp
     */
    'runtime': number;
    /**
     * ID of project secret
     * @type {string}
     * @memberof ProjectSecretCreateRsp
     */
    'id': string;
    /**
     * Server-side generated secret. Only filled on create
     * @type {string}
     * @memberof ProjectSecretCreateRsp
     */
    'secret'?: string;
    /**
     * Hint of the server-side generated secret. First 3 characters and last 3 characters
     * @type {string}
     * @memberof ProjectSecretCreateRsp
     */
    'hint': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof ProjectSecretCreateRsp
     */
    'created': string;
}
/**
 * 
 * @export
 * @interface ProjectSecretDeleteReq
 */
export interface ProjectSecretDeleteReq {
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof ProjectSecretDeleteReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof ProjectSecretDeleteReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface ProjectSecretItem
 */
export interface ProjectSecretItem {
    /**
     * ID of project secret
     * @type {string}
     * @memberof ProjectSecretItem
     */
    'id': string;
    /**
     * Server-side generated secret. Only filled on create
     * @type {string}
     * @memberof ProjectSecretItem
     */
    'secret'?: string;
    /**
     * Hint of the server-side generated secret. First 3 characters and last 3 characters
     * @type {string}
     * @memberof ProjectSecretItem
     */
    'hint': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof ProjectSecretItem
     */
    'created': string;
}
/**
 * 
 * @export
 * @interface ProjectSecretListRsp
 */
export interface ProjectSecretListRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof ProjectSecretListRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof ProjectSecretListRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof ProjectSecretListRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof ProjectSecretListRsp
     */
    'runtime': number;
    /**
     * 
     * @type {Array<ProjectSecretItem>}
     * @memberof ProjectSecretListRsp
     */
    'rows': Array<ProjectSecretItem>;
    /**
     * 
     * @type {Paging}
     * @memberof ProjectSecretListRsp
     */
    'paging': Paging;
}
/**
 * Data about the request itself, can be used for debugging
 * @export
 * @interface RequestData
 */
export interface RequestData {
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof RequestData
     */
    'requestID': string;
    /**
     * Link to dashboard with details about request
     * @type {string}
     * @memberof RequestData
     */
    'link': string;
}
/**
 * Request log entry
 * @export
 * @interface RequestLog
 */
export interface RequestLog {
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof RequestLog
     */
    'requestID': string;
    /**
     * ID of project
     * @type {string}
     * @memberof RequestLog
     */
    'projectID': string;
    /**
     * ID of the user
     * @type {string}
     * @memberof RequestLog
     */
    'userID': string;
    /**
     * Application this request was processed with
     * @type {string}
     * @memberof RequestLog
     */
    'application': string;
    /**
     * HTTP method (such as GET and POST)
     * @type {string}
     * @memberof RequestLog
     */
    'method': string;
    /**
     * Endpoint that was requested
     * @type {string}
     * @memberof RequestLog
     */
    'endpoint': string;
    /**
     * Request source
     * @type {string}
     * @memberof RequestLog
     */
    'source': string;
    /**
     * Request JSON data
     * @type {string}
     * @memberof RequestLog
     */
    'request': string;
    /**
     * Request headers
     * @type {{ [key: string]: string; }}
     * @memberof RequestLog
     */
    'requestHeaders': { [key: string]: string; };
    /**
     * Request query parameters
     * @type {string}
     * @memberof RequestLog
     */
    'queryParams': string;
    /**
     * Response HTTP status
     * @type {number}
     * @memberof RequestLog
     */
    'responseStatus': number;
    /**
     * Response JSON data
     * @type {string}
     * @memberof RequestLog
     */
    'response': string;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof RequestLog
     */
    'runtime': number;
    /**
     * Caller remote address
     * @type {string}
     * @memberof RequestLog
     */
    'remoteAddress': string;
    /**
     * Timestamp of when the request was performed in RFC3339 format
     * @type {string}
     * @memberof RequestLog
     */
    'created': string;
    /**
     * Arbitrary tags attached to this request
     * @type {object}
     * @memberof RequestLog
     */
    'tags': object;
    /**
     * Any freetext additional information attached to this request. Additional logs, errors, etc.
     * @type {Array<string>}
     * @memberof RequestLog
     */
    'details': Array<string>;
}
/**
 * 
 * @export
 * @interface RequestLogGetRsp
 */
export interface RequestLogGetRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof RequestLogGetRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof RequestLogGetRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof RequestLogGetRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof RequestLogGetRsp
     */
    'runtime': number;
    /**
     * 
     * @type {RequestLog}
     * @memberof RequestLogGetRsp
     */
    'data': RequestLog;
}
/**
 * 
 * @export
 * @interface RequestLogsListRsp
 */
export interface RequestLogsListRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof RequestLogsListRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof RequestLogsListRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof RequestLogsListRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof RequestLogsListRsp
     */
    'runtime': number;
    /**
     * 
     * @type {RequestLogsListRspAllOfData}
     * @memberof RequestLogsListRsp
     */
    'data': RequestLogsListRspAllOfData;
}
/**
 * 
 * @export
 * @interface RequestLogsListRspAllOfData
 */
export interface RequestLogsListRspAllOfData {
    /**
     * 
     * @type {Array<RequestLog>}
     * @memberof RequestLogsListRspAllOfData
     */
    'logs': Array<RequestLog>;
    /**
     * 
     * @type {Paging}
     * @memberof RequestLogsListRspAllOfData
     */
    'paging': Paging;
}
/**
 * 
 * @export
 * @interface SessionConfig
 */
export interface SessionConfig {
    /**
     * ID of project
     * @type {string}
     * @memberof SessionConfig
     */
    'projectID': string;
    /**
     * 
     * @type {AppType}
     * @memberof SessionConfig
     */
    'appType': AppType;
    /**
     * 
     * @type {boolean}
     * @memberof SessionConfig
     */
    'active'?: boolean;
    /**
     * 
     * @type {number}
     * @memberof SessionConfig
     */
    'shortLifetimeMinutes': number;
    /**
     * 
     * @type {string}
     * @memberof SessionConfig
     */
    'shortCookieDomain': string;
    /**
     * 
     * @type {boolean}
     * @memberof SessionConfig
     */
    'shortCookieSecure': boolean;
    /**
     * 
     * @type {string}
     * @memberof SessionConfig
     */
    'shortCookieSameSite': SessionConfigShortCookieSameSiteEnum;
    /**
     * 
     * @type {number}
     * @memberof SessionConfig
     */
    'longLifetimeValue': number;
    /**
     * 
     * @type {string}
     * @memberof SessionConfig
     */
    'longLifetimeUnit': SessionConfigLongLifetimeUnitEnum;
    /**
     * 
     * @type {number}
     * @memberof SessionConfig
     */
    'longInactivityValue': number;
    /**
     * 
     * @type {string}
     * @memberof SessionConfig
     */
    'longInactivityUnit': SessionConfigLongInactivityUnitEnum;
    /**
     * 
     * @type {string}
     * @memberof SessionConfig
     */
    'jwtAudience': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof SessionConfig
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof SessionConfig
     */
    'updated': string;
}

export const SessionConfigShortCookieSameSiteEnum = {
    Lax: 'lax',
    Strict: 'strict',
    None: 'none'
} as const;

export type SessionConfigShortCookieSameSiteEnum = typeof SessionConfigShortCookieSameSiteEnum[keyof typeof SessionConfigShortCookieSameSiteEnum];
export const SessionConfigLongLifetimeUnitEnum = {
    Min: 'min',
    Hour: 'hour',
    Day: 'day'
} as const;

export type SessionConfigLongLifetimeUnitEnum = typeof SessionConfigLongLifetimeUnitEnum[keyof typeof SessionConfigLongLifetimeUnitEnum];
export const SessionConfigLongInactivityUnitEnum = {
    Min: 'min',
    Hour: 'hour',
    Day: 'day'
} as const;

export type SessionConfigLongInactivityUnitEnum = typeof SessionConfigLongInactivityUnitEnum[keyof typeof SessionConfigLongInactivityUnitEnum];

/**
 * 
 * @export
 * @interface SessionConfigGetRsp
 */
export interface SessionConfigGetRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof SessionConfigGetRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof SessionConfigGetRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof SessionConfigGetRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof SessionConfigGetRsp
     */
    'runtime': number;
    /**
     * 
     * @type {SessionConfig}
     * @memberof SessionConfigGetRsp
     */
    'data': SessionConfig;
}
/**
 * 
 * @export
 * @interface SessionConfigUpdateReq
 */
export interface SessionConfigUpdateReq {
    /**
     * 
     * @type {AppType}
     * @memberof SessionConfigUpdateReq
     */
    'appType': AppType;
    /**
     * 
     * @type {boolean}
     * @memberof SessionConfigUpdateReq
     */
    'active'?: boolean;
    /**
     * 
     * @type {number}
     * @memberof SessionConfigUpdateReq
     */
    'shortLifetimeMinutes'?: number;
    /**
     * 
     * @type {string}
     * @memberof SessionConfigUpdateReq
     */
    'shortCookieDomain'?: string;
    /**
     * 
     * @type {boolean}
     * @memberof SessionConfigUpdateReq
     */
    'shortCookieSecure'?: boolean;
    /**
     * 
     * @type {string}
     * @memberof SessionConfigUpdateReq
     */
    'shortCookieSameSite'?: SessionConfigUpdateReqShortCookieSameSiteEnum;
    /**
     * 
     * @type {number}
     * @memberof SessionConfigUpdateReq
     */
    'longLifetimeValue'?: number;
    /**
     * 
     * @type {string}
     * @memberof SessionConfigUpdateReq
     */
    'longLifetimeUnit'?: SessionConfigUpdateReqLongLifetimeUnitEnum;
    /**
     * 
     * @type {number}
     * @memberof SessionConfigUpdateReq
     */
    'longInactivityValue'?: number;
    /**
     * 
     * @type {string}
     * @memberof SessionConfigUpdateReq
     */
    'longInactivityUnit'?: SessionConfigUpdateReqLongInactivityUnitEnum;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof SessionConfigUpdateReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof SessionConfigUpdateReq
     */
    'clientInfo'?: ClientInfo;
}

export const SessionConfigUpdateReqShortCookieSameSiteEnum = {
    Lax: 'lax',
    Strict: 'strict',
    None: 'none'
} as const;

export type SessionConfigUpdateReqShortCookieSameSiteEnum = typeof SessionConfigUpdateReqShortCookieSameSiteEnum[keyof typeof SessionConfigUpdateReqShortCookieSameSiteEnum];
export const SessionConfigUpdateReqLongLifetimeUnitEnum = {
    Min: 'min',
    Hour: 'hour'
} as const;

export type SessionConfigUpdateReqLongLifetimeUnitEnum = typeof SessionConfigUpdateReqLongLifetimeUnitEnum[keyof typeof SessionConfigUpdateReqLongLifetimeUnitEnum];
export const SessionConfigUpdateReqLongInactivityUnitEnum = {
    Min: 'min',
    Hour: 'hour'
} as const;

export type SessionConfigUpdateReqLongInactivityUnitEnum = typeof SessionConfigUpdateReqLongInactivityUnitEnum[keyof typeof SessionConfigUpdateReqLongInactivityUnitEnum];

/**
 * 
 * @export
 * @interface SessionTokenCreateReq
 */
export interface SessionTokenCreateReq {
    /**
     * ID of the user
     * @type {string}
     * @memberof SessionTokenCreateReq
     */
    'userID': string;
    /**
     * Additional user data in JSON format
     * @type {string}
     * @memberof SessionTokenCreateReq
     */
    'userData': string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof SessionTokenCreateReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof SessionTokenCreateReq
     */
    'clientInfo': ClientInfo;
}
/**
 * 
 * @export
 * @interface SessionTokenCreateRsp
 */
export interface SessionTokenCreateRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof SessionTokenCreateRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof SessionTokenCreateRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof SessionTokenCreateRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof SessionTokenCreateRsp
     */
    'runtime': number;
    /**
     * 
     * @type {SessionTokenCreateRspAllOfData}
     * @memberof SessionTokenCreateRsp
     */
    'data': SessionTokenCreateRspAllOfData;
}
/**
 * 
 * @export
 * @interface SessionTokenCreateRspAllOfData
 */
export interface SessionTokenCreateRspAllOfData {
    /**
     * 
     * @type {string}
     * @memberof SessionTokenCreateRspAllOfData
     */
    'token': string;
}
/**
 * 
 * @export
 * @interface SessionTokenVerifyReq
 */
export interface SessionTokenVerifyReq {
    /**
     * 
     * @type {string}
     * @memberof SessionTokenVerifyReq
     */
    'token': string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof SessionTokenVerifyReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof SessionTokenVerifyReq
     */
    'clientInfo': ClientInfo;
}
/**
 * 
 * @export
 * @interface SessionTokenVerifyRsp
 */
export interface SessionTokenVerifyRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof SessionTokenVerifyRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof SessionTokenVerifyRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof SessionTokenVerifyRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof SessionTokenVerifyRsp
     */
    'runtime': number;
    /**
     * 
     * @type {SessionTokenVerifyRspAllOfData}
     * @memberof SessionTokenVerifyRsp
     */
    'data': SessionTokenVerifyRspAllOfData;
}
/**
 * 
 * @export
 * @interface SessionTokenVerifyRspAllOfData
 */
export interface SessionTokenVerifyRspAllOfData {
    /**
     * ID of the user
     * @type {string}
     * @memberof SessionTokenVerifyRspAllOfData
     */
    'userID': string;
    /**
     * 
     * @type {FullUser}
     * @memberof SessionTokenVerifyRspAllOfData
     */
    'user': FullUser;
    /**
     * 
     * @type {string}
     * @memberof SessionTokenVerifyRspAllOfData
     */
    'userData': string;
}
/**
 * 
 * @export
 * @interface SmsCodeSendReq
 */
export interface SmsCodeSendReq {
    /**
     * Recipient phone number
     * @type {string}
     * @memberof SmsCodeSendReq
     */
    'phoneNumber': string;
    /**
     * Defines if user phone number should be created if not found
     * @type {boolean}
     * @memberof SmsCodeSendReq
     */
    'create': boolean;
    /**
     * Optional user\'s full name to be used if the user wasn\'t found and needs to be created first
     * @type {string}
     * @memberof SmsCodeSendReq
     */
    'userFullName'?: string;
    /**
     * Template name of SMS to send
     * @type {string}
     * @memberof SmsCodeSendReq
     */
    'templateName'?: string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof SmsCodeSendReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof SmsCodeSendReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface SmsCodeSendRsp
 */
export interface SmsCodeSendRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof SmsCodeSendRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof SmsCodeSendRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof SmsCodeSendRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof SmsCodeSendRsp
     */
    'runtime': number;
    /**
     * 
     * @type {SmsCodeSendRspAllOfData}
     * @memberof SmsCodeSendRsp
     */
    'data': SmsCodeSendRspAllOfData;
}
/**
 * 
 * @export
 * @interface SmsCodeSendRspAllOfData
 */
export interface SmsCodeSendRspAllOfData {
    /**
     * 
     * @type {string}
     * @memberof SmsCodeSendRspAllOfData
     */
    'smsCodeID': string;
}
/**
 * 
 * @export
 * @interface SmsCodeValidateReq
 */
export interface SmsCodeValidateReq {
    /**
     * SMS OTP to validate
     * @type {string}
     * @memberof SmsCodeValidateReq
     */
    'smsCode': string;
    /**
     * 
     * @type {boolean}
     * @memberof SmsCodeValidateReq
     */
    'createLoginToken'?: boolean;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof SmsCodeValidateReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof SmsCodeValidateReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface SmsCodeValidateRsp
 */
export interface SmsCodeValidateRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof SmsCodeValidateRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof SmsCodeValidateRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof SmsCodeValidateRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof SmsCodeValidateRsp
     */
    'runtime': number;
    /**
     * 
     * @type {string}
     * @memberof SmsCodeValidateRsp
     */
    'loginToken'?: string;
}
/**
 * 
 * @export
 * @interface SmsTemplateCreateReq
 */
export interface SmsTemplateCreateReq {
    /**
     * 
     * @type {string}
     * @memberof SmsTemplateCreateReq
     */
    'type': SmsTemplateCreateReqTypeEnum;
    /**
     * 
     * @type {string}
     * @memberof SmsTemplateCreateReq
     */
    'name': string;
    /**
     * 
     * @type {string}
     * @memberof SmsTemplateCreateReq
     */
    'textPlain': string;
    /**
     * 
     * @type {boolean}
     * @memberof SmsTemplateCreateReq
     */
    'isDefault': boolean;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof SmsTemplateCreateReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof SmsTemplateCreateReq
     */
    'clientInfo'?: ClientInfo;
}

export const SmsTemplateCreateReqTypeEnum = {
    SmsCode: 'sms_code',
    PasskeyNotification: 'passkey_notification'
} as const;

export type SmsTemplateCreateReqTypeEnum = typeof SmsTemplateCreateReqTypeEnum[keyof typeof SmsTemplateCreateReqTypeEnum];

/**
 * 
 * @export
 * @interface SmsTemplateCreateRsp
 */
export interface SmsTemplateCreateRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof SmsTemplateCreateRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof SmsTemplateCreateRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof SmsTemplateCreateRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof SmsTemplateCreateRsp
     */
    'runtime': number;
    /**
     * 
     * @type {SmsTemplateCreateRspAllOfData}
     * @memberof SmsTemplateCreateRsp
     */
    'data': SmsTemplateCreateRspAllOfData;
}
/**
 * 
 * @export
 * @interface SmsTemplateCreateRspAllOfData
 */
export interface SmsTemplateCreateRspAllOfData {
    /**
     * 
     * @type {string}
     * @memberof SmsTemplateCreateRspAllOfData
     */
    'smsTemplateID': string;
}
/**
 * 
 * @export
 * @interface SmsTemplateDeleteReq
 */
export interface SmsTemplateDeleteReq {
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof SmsTemplateDeleteReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof SmsTemplateDeleteReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * Generic status that can describe Corbado entities
 * @export
 * @enum {string}
 */

export const Status = {
    Active: 'active',
    Pending: 'pending',
    Deleted: 'deleted'
} as const;

export type Status = typeof Status[keyof typeof Status];


/**
 * 
 * @export
 * @interface TrackingBackupState
 */
export interface TrackingBackupState {
    /**
     * 
     * @type {number}
     * @memberof TrackingBackupState
     */
    'backedUp': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingBackupState
     */
    'notBackedUp': number;
}
/**
 * 
 * @export
 * @interface TrackingBackupStateGetRsp
 */
export interface TrackingBackupStateGetRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof TrackingBackupStateGetRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof TrackingBackupStateGetRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof TrackingBackupStateGetRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof TrackingBackupStateGetRsp
     */
    'runtime': number;
    /**
     * 
     * @type {TrackingBackupState}
     * @memberof TrackingBackupStateGetRsp
     */
    'data': TrackingBackupState;
}
/**
 * 
 * @export
 * @interface TrackingBrowserDetailedStats
 */
export interface TrackingBrowserDetailedStats {
    /**
     * 
     * @type {string}
     * @memberof TrackingBrowserDetailedStats
     */
    'timePoint': string;
    /**
     * 
     * @type {string}
     * @memberof TrackingBrowserDetailedStats
     */
    'browserName': string;
    /**
     * 
     * @type {string}
     * @memberof TrackingBrowserDetailedStats
     */
    'browserVersion': string;
    /**
     * 
     * @type {number}
     * @memberof TrackingBrowserDetailedStats
     */
    'cnt': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingBrowserDetailedStats
     */
    'webauthn': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingBrowserDetailedStats
     */
    'platform': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingBrowserDetailedStats
     */
    'conditional_ui': number;
}
/**
 * 
 * @export
 * @interface TrackingBrowserDetailedStatsListRsp
 */
export interface TrackingBrowserDetailedStatsListRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof TrackingBrowserDetailedStatsListRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof TrackingBrowserDetailedStatsListRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof TrackingBrowserDetailedStatsListRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof TrackingBrowserDetailedStatsListRsp
     */
    'runtime': number;
    /**
     * 
     * @type {TrackingBrowserDetailedStatsListRspAllOfData}
     * @memberof TrackingBrowserDetailedStatsListRsp
     */
    'data': TrackingBrowserDetailedStatsListRspAllOfData;
}
/**
 * 
 * @export
 * @interface TrackingBrowserDetailedStatsListRspAllOfData
 */
export interface TrackingBrowserDetailedStatsListRspAllOfData {
    /**
     * 
     * @type {Array<TrackingBrowserDetailedStats>}
     * @memberof TrackingBrowserDetailedStatsListRspAllOfData
     */
    'stats': Array<TrackingBrowserDetailedStats>;
    /**
     * 
     * @type {Paging}
     * @memberof TrackingBrowserDetailedStatsListRspAllOfData
     */
    'paging': Paging;
}
/**
 * 
 * @export
 * @interface TrackingBrowserStats
 */
export interface TrackingBrowserStats {
    /**
     * 
     * @type {string}
     * @memberof TrackingBrowserStats
     */
    'timePoint': string;
    /**
     * 
     * @type {number}
     * @memberof TrackingBrowserStats
     */
    'chrome': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingBrowserStats
     */
    'safari': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingBrowserStats
     */
    'edge': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingBrowserStats
     */
    'firefox': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingBrowserStats
     */
    'other': number;
}
/**
 * 
 * @export
 * @interface TrackingBrowserStatsListRsp
 */
export interface TrackingBrowserStatsListRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof TrackingBrowserStatsListRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof TrackingBrowserStatsListRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof TrackingBrowserStatsListRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof TrackingBrowserStatsListRsp
     */
    'runtime': number;
    /**
     * 
     * @type {TrackingBrowserStatsListRspAllOfData}
     * @memberof TrackingBrowserStatsListRsp
     */
    'data': TrackingBrowserStatsListRspAllOfData;
}
/**
 * 
 * @export
 * @interface TrackingBrowserStatsListRspAllOfData
 */
export interface TrackingBrowserStatsListRspAllOfData {
    /**
     * 
     * @type {Array<TrackingBrowserStats>}
     * @memberof TrackingBrowserStatsListRspAllOfData
     */
    'stats': Array<TrackingBrowserStats>;
    /**
     * 
     * @type {Paging}
     * @memberof TrackingBrowserStatsListRspAllOfData
     */
    'paging': Paging;
}
/**
 * 
 * @export
 * @interface TrackingDetailedStats
 */
export interface TrackingDetailedStats {
    /**
     * 
     * @type {string}
     * @memberof TrackingDetailedStats
     */
    'timePoint': string;
    /**
     * 
     * @type {number}
     * @memberof TrackingDetailedStats
     */
    'visits': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingDetailedStats
     */
    'webauthn': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingDetailedStats
     */
    'platform': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingDetailedStats
     */
    'conditionalUi': number;
}
/**
 * 
 * @export
 * @interface TrackingDetailedStatsListRsp
 */
export interface TrackingDetailedStatsListRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof TrackingDetailedStatsListRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof TrackingDetailedStatsListRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof TrackingDetailedStatsListRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof TrackingDetailedStatsListRsp
     */
    'runtime': number;
    /**
     * 
     * @type {TrackingDetailedStatsListRspAllOfData}
     * @memberof TrackingDetailedStatsListRsp
     */
    'data': TrackingDetailedStatsListRspAllOfData;
}
/**
 * 
 * @export
 * @interface TrackingDetailedStatsListRspAllOfData
 */
export interface TrackingDetailedStatsListRspAllOfData {
    /**
     * 
     * @type {Array<TrackingDetailedStats>}
     * @memberof TrackingDetailedStatsListRspAllOfData
     */
    'stats': Array<TrackingDetailedStats>;
    /**
     * 
     * @type {Paging}
     * @memberof TrackingDetailedStatsListRspAllOfData
     */
    'paging': Paging;
}
/**
 * 
 * @export
 * @interface TrackingEnums
 */
export interface TrackingEnums {
    /**
     * 
     * @type {Array<string>}
     * @memberof TrackingEnums
     */
    'browserNames': Array<string>;
    /**
     * 
     * @type {Array<string>}
     * @memberof TrackingEnums
     */
    'osNames': Array<string>;
    /**
     * 
     * @type {Array<string>}
     * @memberof TrackingEnums
     */
    'osPlatforms': Array<string>;
}
/**
 * 
 * @export
 * @interface TrackingEnumsGetRsp
 */
export interface TrackingEnumsGetRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof TrackingEnumsGetRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof TrackingEnumsGetRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof TrackingEnumsGetRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof TrackingEnumsGetRsp
     */
    'runtime': number;
    /**
     * 
     * @type {TrackingEnums}
     * @memberof TrackingEnumsGetRsp
     */
    'data': TrackingEnums;
}
/**
 * 
 * @export
 * @interface TrackingOSDetailedStats
 */
export interface TrackingOSDetailedStats {
    /**
     * 
     * @type {string}
     * @memberof TrackingOSDetailedStats
     */
    'timePoint': string;
    /**
     * 
     * @type {string}
     * @memberof TrackingOSDetailedStats
     */
    'osName': string;
    /**
     * 
     * @type {string}
     * @memberof TrackingOSDetailedStats
     */
    'osVersion': string;
    /**
     * 
     * @type {string}
     * @memberof TrackingOSDetailedStats
     */
    'osPlatform': TrackingOSDetailedStatsOsPlatformEnum;
    /**
     * 
     * @type {number}
     * @memberof TrackingOSDetailedStats
     */
    'cnt': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingOSDetailedStats
     */
    'webauthn': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingOSDetailedStats
     */
    'platform': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingOSDetailedStats
     */
    'conditional_ui': number;
}

export const TrackingOSDetailedStatsOsPlatformEnum = {
    Desktop: 'desktop',
    Mobile: 'mobile',
    Unknown: 'unknown'
} as const;

export type TrackingOSDetailedStatsOsPlatformEnum = typeof TrackingOSDetailedStatsOsPlatformEnum[keyof typeof TrackingOSDetailedStatsOsPlatformEnum];

/**
 * 
 * @export
 * @interface TrackingOSDetailedStatsListRsp
 */
export interface TrackingOSDetailedStatsListRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof TrackingOSDetailedStatsListRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof TrackingOSDetailedStatsListRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof TrackingOSDetailedStatsListRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof TrackingOSDetailedStatsListRsp
     */
    'runtime': number;
    /**
     * 
     * @type {TrackingOSDetailedStatsListRspAllOfData}
     * @memberof TrackingOSDetailedStatsListRsp
     */
    'data': TrackingOSDetailedStatsListRspAllOfData;
}
/**
 * 
 * @export
 * @interface TrackingOSDetailedStatsListRspAllOfData
 */
export interface TrackingOSDetailedStatsListRspAllOfData {
    /**
     * 
     * @type {Array<TrackingOSDetailedStats>}
     * @memberof TrackingOSDetailedStatsListRspAllOfData
     */
    'stats': Array<TrackingOSDetailedStats>;
    /**
     * 
     * @type {Paging}
     * @memberof TrackingOSDetailedStatsListRspAllOfData
     */
    'paging': Paging;
}
/**
 * 
 * @export
 * @interface TrackingOSStats
 */
export interface TrackingOSStats {
    /**
     * 
     * @type {string}
     * @memberof TrackingOSStats
     */
    'timePoint': string;
    /**
     * 
     * @type {number}
     * @memberof TrackingOSStats
     */
    'macos': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingOSStats
     */
    'windows': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingOSStats
     */
    'ios': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingOSStats
     */
    'android': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingOSStats
     */
    'other': number;
}
/**
 * 
 * @export
 * @interface TrackingOSStatsListRsp
 */
export interface TrackingOSStatsListRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof TrackingOSStatsListRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof TrackingOSStatsListRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof TrackingOSStatsListRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof TrackingOSStatsListRsp
     */
    'runtime': number;
    /**
     * 
     * @type {TrackingOSStatsListRspAllOfData}
     * @memberof TrackingOSStatsListRsp
     */
    'data': TrackingOSStatsListRspAllOfData;
}
/**
 * 
 * @export
 * @interface TrackingOSStatsListRspAllOfData
 */
export interface TrackingOSStatsListRspAllOfData {
    /**
     * 
     * @type {Array<TrackingOSStats>}
     * @memberof TrackingOSStatsListRspAllOfData
     */
    'stats': Array<TrackingOSStats>;
    /**
     * 
     * @type {Paging}
     * @memberof TrackingOSStatsListRspAllOfData
     */
    'paging': Paging;
}
/**
 * 
 * @export
 * @interface TrackingRawListRow
 */
export interface TrackingRawListRow {
    /**
     * 
     * @type {string}
     * @memberof TrackingRawListRow
     */
    'timePoint': string;
    /**
     * 
     * @type {boolean}
     * @memberof TrackingRawListRow
     */
    'hasWebauthn': boolean;
    /**
     * 
     * @type {boolean}
     * @memberof TrackingRawListRow
     */
    'hasPlatformAuth': boolean;
    /**
     * 
     * @type {boolean}
     * @memberof TrackingRawListRow
     */
    'hasConditionalUi': boolean;
    /**
     * 
     * @type {string}
     * @memberof TrackingRawListRow
     */
    'osId': string;
    /**
     * 
     * @type {string}
     * @memberof TrackingRawListRow
     */
    'browserId': string;
}
/**
 * 
 * @export
 * @interface TrackingRawListRsp
 */
export interface TrackingRawListRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof TrackingRawListRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof TrackingRawListRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof TrackingRawListRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof TrackingRawListRsp
     */
    'runtime': number;
    /**
     * 
     * @type {Array<TrackingRawListRow>}
     * @memberof TrackingRawListRsp
     */
    'rows': Array<TrackingRawListRow>;
    /**
     * 
     * @type {Paging}
     * @memberof TrackingRawListRsp
     */
    'paging': Paging;
}
/**
 * 
 * @export
 * @interface TrackingStats
 */
export interface TrackingStats {
    /**
     * 
     * @type {string}
     * @memberof TrackingStats
     */
    'timePoint': string;
    /**
     * 
     * @type {number}
     * @memberof TrackingStats
     */
    'aggregateVisits': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingStats
     */
    'aggregateWebauthn': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingStats
     */
    'aggregatePlatform': number;
    /**
     * 
     * @type {number}
     * @memberof TrackingStats
     */
    'aggregateConditionalUi': number;
}
/**
 * 
 * @export
 * @interface TrackingStatsListRsp
 */
export interface TrackingStatsListRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof TrackingStatsListRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof TrackingStatsListRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof TrackingStatsListRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof TrackingStatsListRsp
     */
    'runtime': number;
    /**
     * 
     * @type {TrackingStatsListRspAllOfData}
     * @memberof TrackingStatsListRsp
     */
    'data': TrackingStatsListRspAllOfData;
}
/**
 * 
 * @export
 * @interface TrackingStatsListRspAllOfData
 */
export interface TrackingStatsListRspAllOfData {
    /**
     * 
     * @type {Array<TrackingStats>}
     * @memberof TrackingStatsListRspAllOfData
     */
    'stats': Array<TrackingStats>;
    /**
     * 
     * @type {Paging}
     * @memberof TrackingStatsListRspAllOfData
     */
    'paging': Paging;
}
/**
 * User entry
 * @export
 * @interface User
 */
export interface User {
    /**
     * ID of the user
     * @type {string}
     * @memberof User
     */
    'ID': string;
    /**
     * 
     * @type {string}
     * @memberof User
     */
    'name': string;
    /**
     * 
     * @type {string}
     * @memberof User
     */
    'fullName': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof User
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof User
     */
    'updated': string;
    /**
     * 
     * @type {string}
     * @memberof User
     */
    'status': string;
}
/**
 * 
 * @export
 * @interface UserAuthLog
 */
export interface UserAuthLog {
    /**
     * ID of the user
     * @type {string}
     * @memberof UserAuthLog
     */
    'userID': string;
    /**
     * 
     * @type {string}
     * @memberof UserAuthLog
     */
    'userName': string;
    /**
     * 
     * @type {string}
     * @memberof UserAuthLog
     */
    'method': string;
    /**
     * 
     * @type {string}
     * @memberof UserAuthLog
     */
    'eventType': string;
    /**
     * 
     * @type {string}
     * @memberof UserAuthLog
     */
    'status': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof UserAuthLog
     */
    'created': string;
}
/**
 * 
 * @export
 * @interface UserAuthLogListRsp
 */
export interface UserAuthLogListRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof UserAuthLogListRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof UserAuthLogListRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof UserAuthLogListRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof UserAuthLogListRsp
     */
    'runtime': number;
    /**
     * 
     * @type {UserAuthLogListRspAllOfData}
     * @memberof UserAuthLogListRsp
     */
    'data': UserAuthLogListRspAllOfData;
}
/**
 * 
 * @export
 * @interface UserAuthLogListRspAllOfData
 */
export interface UserAuthLogListRspAllOfData {
    /**
     * 
     * @type {Array<UserAuthLog>}
     * @memberof UserAuthLogListRspAllOfData
     */
    'rows': Array<UserAuthLog>;
    /**
     * 
     * @type {Paging}
     * @memberof UserAuthLogListRspAllOfData
     */
    'paging': Paging;
}
/**
 * 
 * @export
 * @interface UserCreateReq
 */
export interface UserCreateReq {
    /**
     * 
     * @type {string}
     * @memberof UserCreateReq
     */
    'name': string;
    /**
     * 
     * @type {string}
     * @memberof UserCreateReq
     */
    'fullName'?: string;
    /**
     * 
     * @type {string}
     * @memberof UserCreateReq
     */
    'email'?: string;
    /**
     * 
     * @type {string}
     * @memberof UserCreateReq
     */
    'phoneNumber'?: string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof UserCreateReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof UserCreateReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface UserCreateRsp
 */
export interface UserCreateRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof UserCreateRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof UserCreateRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof UserCreateRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof UserCreateRsp
     */
    'runtime': number;
    /**
     * 
     * @type {UserCreateRspAllOfData}
     * @memberof UserCreateRsp
     */
    'data': UserCreateRspAllOfData;
}
/**
 * 
 * @export
 * @interface UserCreateRspAllOfData
 */
export interface UserCreateRspAllOfData {
    /**
     * 
     * @type {string}
     * @memberof UserCreateRspAllOfData
     */
    'userID': string;
    /**
     * 
     * @type {string}
     * @memberof UserCreateRspAllOfData
     */
    'emailID': string;
    /**
     * 
     * @type {string}
     * @memberof UserCreateRspAllOfData
     */
    'phoneNumberID': string;
}
/**
 * 
 * @export
 * @interface UserCustomLoginIdentifierCreateReq
 */
export interface UserCustomLoginIdentifierCreateReq {
    /**
     * 
     * @type {string}
     * @memberof UserCustomLoginIdentifierCreateReq
     */
    'customLoginIdentifier': string;
    /**
     * 
     * @type {string}
     * @memberof UserCustomLoginIdentifierCreateReq
     */
    'additionalData'?: string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof UserCustomLoginIdentifierCreateReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof UserCustomLoginIdentifierCreateReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface UserCustomLoginIdentifierCreateRsp
 */
export interface UserCustomLoginIdentifierCreateRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof UserCustomLoginIdentifierCreateRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof UserCustomLoginIdentifierCreateRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof UserCustomLoginIdentifierCreateRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof UserCustomLoginIdentifierCreateRsp
     */
    'runtime': number;
    /**
     * 
     * @type {UserCustomLoginIdentifierCreateRspAllOfData}
     * @memberof UserCustomLoginIdentifierCreateRsp
     */
    'data': UserCustomLoginIdentifierCreateRspAllOfData;
}
/**
 * 
 * @export
 * @interface UserCustomLoginIdentifierCreateRspAllOfData
 */
export interface UserCustomLoginIdentifierCreateRspAllOfData {
    /**
     * 
     * @type {string}
     * @memberof UserCustomLoginIdentifierCreateRspAllOfData
     */
    'customLoginIdentifierID': string;
}
/**
 * 
 * @export
 * @interface UserCustomLoginIdentifierDeleteReq
 */
export interface UserCustomLoginIdentifierDeleteReq {
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof UserCustomLoginIdentifierDeleteReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof UserCustomLoginIdentifierDeleteReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface UserCustomLoginIdentifierGetRsp
 */
export interface UserCustomLoginIdentifierGetRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof UserCustomLoginIdentifierGetRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof UserCustomLoginIdentifierGetRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof UserCustomLoginIdentifierGetRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof UserCustomLoginIdentifierGetRsp
     */
    'runtime': number;
    /**
     * 
     * @type {UserCustomLoginIdentifierGetRspAllOfData}
     * @memberof UserCustomLoginIdentifierGetRsp
     */
    'data': UserCustomLoginIdentifierGetRspAllOfData;
}
/**
 * 
 * @export
 * @interface UserCustomLoginIdentifierGetRspAllOfData
 */
export interface UserCustomLoginIdentifierGetRspAllOfData {
    /**
     * 
     * @type {CustomLoginIdentifier}
     * @memberof UserCustomLoginIdentifierGetRspAllOfData
     */
    'customLoginIdentifier': CustomLoginIdentifier;
}
/**
 * 
 * @export
 * @interface UserDeleteReq
 */
export interface UserDeleteReq {
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof UserDeleteReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof UserDeleteReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface UserDevice
 */
export interface UserDevice {
    /**
     * 
     * @type {string}
     * @memberof UserDevice
     */
    'name': string;
    /**
     * 
     * @type {string}
     * @memberof UserDevice
     */
    'fingerprint': string;
    /**
     * 
     * @type {string}
     * @memberof UserDevice
     */
    'status': string;
    /**
     * 
     * @type {string}
     * @memberof UserDevice
     */
    'device': string;
    /**
     * 
     * @type {string}
     * @memberof UserDevice
     */
    'created': string;
    /**
     * 
     * @type {string}
     * @memberof UserDevice
     */
    'browserName': string;
    /**
     * 
     * @type {string}
     * @memberof UserDevice
     */
    'browserVersion': string;
    /**
     * 
     * @type {string}
     * @memberof UserDevice
     */
    'osName': string;
    /**
     * 
     * @type {string}
     * @memberof UserDevice
     */
    'osVersion': string;
}
/**
 * 
 * @export
 * @interface UserDeviceListRsp
 */
export interface UserDeviceListRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof UserDeviceListRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof UserDeviceListRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof UserDeviceListRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof UserDeviceListRsp
     */
    'runtime': number;
    /**
     * 
     * @type {Array<UserDevice>}
     * @memberof UserDeviceListRsp
     */
    'devices': Array<UserDevice>;
    /**
     * 
     * @type {Paging}
     * @memberof UserDeviceListRsp
     */
    'paging': Paging;
}
/**
 * User\'s email
 * @export
 * @interface UserEmail
 */
export interface UserEmail {
    /**
     * generic ID
     * @type {string}
     * @memberof UserEmail
     */
    'ID': string;
    /**
     * 
     * @type {string}
     * @memberof UserEmail
     */
    'email': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof UserEmail
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof UserEmail
     */
    'updated': string;
    /**
     * 
     * @type {Status}
     * @memberof UserEmail
     */
    'status': Status;
}


/**
 * 
 * @export
 * @interface UserEmailCreateReq
 */
export interface UserEmailCreateReq {
    /**
     * 
     * @type {string}
     * @memberof UserEmailCreateReq
     */
    'email': string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof UserEmailCreateReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof UserEmailCreateReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface UserEmailCreateRsp
 */
export interface UserEmailCreateRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof UserEmailCreateRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof UserEmailCreateRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof UserEmailCreateRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof UserEmailCreateRsp
     */
    'runtime': number;
    /**
     * 
     * @type {UserEmailCreateRspAllOfData}
     * @memberof UserEmailCreateRsp
     */
    'data': UserEmailCreateRspAllOfData;
}
/**
 * 
 * @export
 * @interface UserEmailCreateRspAllOfData
 */
export interface UserEmailCreateRspAllOfData {
    /**
     * 
     * @type {string}
     * @memberof UserEmailCreateRspAllOfData
     */
    'emailID': string;
}
/**
 * 
 * @export
 * @interface UserEmailDeleteReq
 */
export interface UserEmailDeleteReq {
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof UserEmailDeleteReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof UserEmailDeleteReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface UserEmailGetRsp
 */
export interface UserEmailGetRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof UserEmailGetRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof UserEmailGetRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof UserEmailGetRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof UserEmailGetRsp
     */
    'runtime': number;
    /**
     * 
     * @type {UserEmailGetRspAllOfData}
     * @memberof UserEmailGetRsp
     */
    'data': UserEmailGetRspAllOfData;
}
/**
 * 
 * @export
 * @interface UserEmailGetRspAllOfData
 */
export interface UserEmailGetRspAllOfData {
    /**
     * 
     * @type {Email}
     * @memberof UserEmailGetRspAllOfData
     */
    'email': Email;
}
/**
 * 
 * @export
 * @interface UserGetRsp
 */
export interface UserGetRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof UserGetRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof UserGetRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof UserGetRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof UserGetRsp
     */
    'runtime': number;
    /**
     * 
     * @type {FullUser}
     * @memberof UserGetRsp
     */
    'data': FullUser;
}
/**
 * 
 * @export
 * @interface UserListRsp
 */
export interface UserListRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof UserListRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof UserListRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof UserListRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof UserListRsp
     */
    'runtime': number;
    /**
     * 
     * @type {UserListRspAllOfData}
     * @memberof UserListRsp
     */
    'data': UserListRspAllOfData;
}
/**
 * 
 * @export
 * @interface UserListRspAllOfData
 */
export interface UserListRspAllOfData {
    /**
     * 
     * @type {Array<FullUser>}
     * @memberof UserListRspAllOfData
     */
    'users': Array<FullUser>;
    /**
     * 
     * @type {Paging}
     * @memberof UserListRspAllOfData
     */
    'paging': Paging;
}
/**
 * User\'s phone number
 * @export
 * @interface UserPhoneNumber
 */
export interface UserPhoneNumber {
    /**
     * generic ID
     * @type {string}
     * @memberof UserPhoneNumber
     */
    'ID': string;
    /**
     * 
     * @type {string}
     * @memberof UserPhoneNumber
     */
    'phoneNumber': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof UserPhoneNumber
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof UserPhoneNumber
     */
    'updated': string;
    /**
     * 
     * @type {Status}
     * @memberof UserPhoneNumber
     */
    'status': Status;
}


/**
 * 
 * @export
 * @interface UserPhoneNumberCreateReq
 */
export interface UserPhoneNumberCreateReq {
    /**
     * 
     * @type {string}
     * @memberof UserPhoneNumberCreateReq
     */
    'phoneNumber': string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof UserPhoneNumberCreateReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof UserPhoneNumberCreateReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface UserPhoneNumberCreateRsp
 */
export interface UserPhoneNumberCreateRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof UserPhoneNumberCreateRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof UserPhoneNumberCreateRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof UserPhoneNumberCreateRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof UserPhoneNumberCreateRsp
     */
    'runtime': number;
    /**
     * 
     * @type {UserPhoneNumberCreateRspAllOfData}
     * @memberof UserPhoneNumberCreateRsp
     */
    'data': UserPhoneNumberCreateRspAllOfData;
}
/**
 * 
 * @export
 * @interface UserPhoneNumberCreateRspAllOfData
 */
export interface UserPhoneNumberCreateRspAllOfData {
    /**
     * 
     * @type {string}
     * @memberof UserPhoneNumberCreateRspAllOfData
     */
    'phoneNumberID': string;
}
/**
 * 
 * @export
 * @interface UserPhoneNumberDeleteReq
 */
export interface UserPhoneNumberDeleteReq {
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof UserPhoneNumberDeleteReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof UserPhoneNumberDeleteReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface UserPhoneNumberGetRsp
 */
export interface UserPhoneNumberGetRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof UserPhoneNumberGetRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof UserPhoneNumberGetRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof UserPhoneNumberGetRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof UserPhoneNumberGetRsp
     */
    'runtime': number;
    /**
     * 
     * @type {UserPhoneNumberGetRspAllOfData}
     * @memberof UserPhoneNumberGetRsp
     */
    'data': UserPhoneNumberGetRspAllOfData;
}
/**
 * 
 * @export
 * @interface UserPhoneNumberGetRspAllOfData
 */
export interface UserPhoneNumberGetRspAllOfData {
    /**
     * 
     * @type {PhoneNumber}
     * @memberof UserPhoneNumberGetRspAllOfData
     */
    'phoneNumber': PhoneNumber;
}
/**
 * 
 * @export
 * @interface UserStats
 */
export interface UserStats {
    /**
     * 
     * @type {string}
     * @memberof UserStats
     */
    'timePoint': string;
    /**
     * 
     * @type {number}
     * @memberof UserStats
     */
    'totalUsers': number;
    /**
     * 
     * @type {number}
     * @memberof UserStats
     */
    'signUps': number;
    /**
     * 
     * @type {number}
     * @memberof UserStats
     */
    'activeUsers': number;
    /**
     * 
     * @type {number}
     * @memberof UserStats
     */
    'countPasskeyLogin': number;
    /**
     * 
     * @type {number}
     * @memberof UserStats
     */
    'countEmailLogin': number;
    /**
     * 
     * @type {number}
     * @memberof UserStats
     */
    'countPasswordLogin': number;
    /**
     * 
     * @type {number}
     * @memberof UserStats
     */
    'successfulLogins': number;
    /**
     * 
     * @type {number}
     * @memberof UserStats
     */
    'failedLogins': number;
}
/**
 * 
 * @export
 * @interface UserStatsListRsp
 */
export interface UserStatsListRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof UserStatsListRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof UserStatsListRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof UserStatsListRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof UserStatsListRsp
     */
    'runtime': number;
    /**
     * 
     * @type {UserStatsListRspAllOfData}
     * @memberof UserStatsListRsp
     */
    'data': UserStatsListRspAllOfData;
}
/**
 * 
 * @export
 * @interface UserStatsListRspAllOfData
 */
export interface UserStatsListRspAllOfData {
    /**
     * 
     * @type {Array<UserStats>}
     * @memberof UserStatsListRspAllOfData
     */
    'stats': Array<UserStats>;
    /**
     * 
     * @type {Paging}
     * @memberof UserStatsListRspAllOfData
     */
    'paging': Paging;
}
/**
 * 
 * @export
 * @interface UserUpdateReq
 */
export interface UserUpdateReq {
    /**
     * 
     * @type {string}
     * @memberof UserUpdateReq
     */
    'name'?: string;
    /**
     * 
     * @type {string}
     * @memberof UserUpdateReq
     */
    'fullName'?: string;
    /**
     * 
     * @type {string}
     * @memberof UserUpdateReq
     */
    'status'?: UserUpdateReqStatusEnum;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof UserUpdateReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof UserUpdateReq
     */
    'clientInfo'?: ClientInfo;
}

export const UserUpdateReqStatusEnum = {
    Active: 'active',
    Disabled: 'disabled'
} as const;

export type UserUpdateReqStatusEnum = typeof UserUpdateReqStatusEnum[keyof typeof UserUpdateReqStatusEnum];

/**
 * 
 * @export
 * @interface UserUpdateRsp
 */
export interface UserUpdateRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof UserUpdateRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof UserUpdateRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof UserUpdateRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof UserUpdateRsp
     */
    'runtime': number;
    /**
     * 
     * @type {User}
     * @memberof UserUpdateRsp
     */
    'data': User;
}
/**
 * 
 * @export
 * @interface ValidateEmailReq
 */
export interface ValidateEmailReq {
    /**
     * Email to validate
     * @type {string}
     * @memberof ValidateEmailReq
     */
    'email': string;
    /**
     * perform SMTP check for domain
     * @type {boolean}
     * @memberof ValidateEmailReq
     */
    'smtpCheck'?: boolean;
    /**
     * enables domain suggestion for misspelled domains
     * @type {boolean}
     * @memberof ValidateEmailReq
     */
    'suggestDomain'?: boolean;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof ValidateEmailReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof ValidateEmailReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface ValidateEmailRsp
 */
export interface ValidateEmailRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof ValidateEmailRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof ValidateEmailRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof ValidateEmailRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof ValidateEmailRsp
     */
    'runtime': number;
    /**
     * 
     * @type {EmailValidationResult}
     * @memberof ValidateEmailRsp
     */
    'data': EmailValidationResult;
}
/**
 * 
 * @export
 * @interface ValidatePhoneNumberReq
 */
export interface ValidatePhoneNumberReq {
    /**
     * ISO country or region code
     * @type {string}
     * @memberof ValidatePhoneNumberReq
     */
    'regionCode'?: string;
    /**
     * Phone number to validate
     * @type {string}
     * @memberof ValidatePhoneNumberReq
     */
    'phoneNumber': string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof ValidatePhoneNumberReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof ValidatePhoneNumberReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface ValidatePhoneNumberRsp
 */
export interface ValidatePhoneNumberRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof ValidatePhoneNumberRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof ValidatePhoneNumberRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof ValidatePhoneNumberRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof ValidatePhoneNumberRsp
     */
    'runtime': number;
    /**
     * 
     * @type {PhoneNumberValidationResult}
     * @memberof ValidatePhoneNumberRsp
     */
    'data': PhoneNumberValidationResult;
}
/**
 * 
 * @export
 * @interface ValidationEmail
 */
export interface ValidationEmail {
    /**
     * 
     * @type {string}
     * @memberof ValidationEmail
     */
    'username': string;
    /**
     * 
     * @type {string}
     * @memberof ValidationEmail
     */
    'domain': string;
    /**
     * 
     * @type {string}
     * @memberof ValidationEmail
     */
    'reachable': string;
    /**
     * 
     * @type {boolean}
     * @memberof ValidationEmail
     */
    'disposable': boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ValidationEmail
     */
    'free': boolean;
    /**
     * 
     * @type {boolean}
     * @memberof ValidationEmail
     */
    'hasMxRecords': boolean;
}
/**
 * 
 * @export
 * @interface ValidationPhoneNumber
 */
export interface ValidationPhoneNumber {
    /**
     * 
     * @type {number}
     * @memberof ValidationPhoneNumber
     */
    'nationalNumber': number;
    /**
     * 
     * @type {number}
     * @memberof ValidationPhoneNumber
     */
    'countryCode': number;
    /**
     * 
     * @type {string}
     * @memberof ValidationPhoneNumber
     */
    'regionCode': string;
    /**
     * 
     * @type {string}
     * @memberof ValidationPhoneNumber
     */
    'nationalFormatted': string;
    /**
     * 
     * @type {string}
     * @memberof ValidationPhoneNumber
     */
    'internationalFormatted': string;
}
/**
 * 
 * @export
 * @interface WebAuthnAssociateStartReq
 */
export interface WebAuthnAssociateStartReq {
    /**
     * 
     * @type {string}
     * @memberof WebAuthnAssociateStartReq
     */
    'associationToken': string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof WebAuthnAssociateStartReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof WebAuthnAssociateStartReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface WebAuthnAssociateStartRsp
 */
export interface WebAuthnAssociateStartRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof WebAuthnAssociateStartRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof WebAuthnAssociateStartRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof WebAuthnAssociateStartRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof WebAuthnAssociateStartRsp
     */
    'runtime': number;
    /**
     * Status represents information if user signup was successful or the user with its credentials already exists
     * @type {string}
     * @memberof WebAuthnAssociateStartRsp
     */
    'status': WebAuthnAssociateStartRspStatusEnum;
    /**
     * Contains JSON payload data to start Passkeys (Biometrics) sign up challenge
     * @type {string}
     * @memberof WebAuthnAssociateStartRsp
     */
    'publicKeyCredentialCreationOptions': string;
}

export const WebAuthnAssociateStartRspStatusEnum = {
    Success: 'success',
    Duplicate: 'duplicate'
} as const;

export type WebAuthnAssociateStartRspStatusEnum = typeof WebAuthnAssociateStartRspStatusEnum[keyof typeof WebAuthnAssociateStartRspStatusEnum];

/**
 * 
 * @export
 * @interface WebAuthnAuthenticateFinishRsp
 */
export interface WebAuthnAuthenticateFinishRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof WebAuthnAuthenticateFinishRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof WebAuthnAuthenticateFinishRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof WebAuthnAuthenticateFinishRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof WebAuthnAuthenticateFinishRsp
     */
    'runtime': number;
    /**
     * ID of the user
     * @type {string}
     * @memberof WebAuthnAuthenticateFinishRsp
     */
    'userID': string;
    /**
     * Username of current challenge
     * @type {string}
     * @memberof WebAuthnAuthenticateFinishRsp
     */
    'username': string;
    /**
     * Used credential ID
     * @type {string}
     * @memberof WebAuthnAuthenticateFinishRsp
     */
    'credentialID': string;
    /**
     * Optional user\'s full name to be used if the user wasn\'t found and needs to be created first
     * @type {string}
     * @memberof WebAuthnAuthenticateFinishRsp
     */
    'userFullName'?: string;
    /**
     * Status represents information if user signup was successful or the user with its credentials already exists
     * @type {string}
     * @memberof WebAuthnAuthenticateFinishRsp
     */
    'status': WebAuthnAuthenticateFinishRspStatusEnum;
}

export const WebAuthnAuthenticateFinishRspStatusEnum = {
    Success: 'success',
    UnconfirmedCredential: 'unconfirmedCredential'
} as const;

export type WebAuthnAuthenticateFinishRspStatusEnum = typeof WebAuthnAuthenticateFinishRspStatusEnum[keyof typeof WebAuthnAuthenticateFinishRspStatusEnum];

/**
 * 
 * @export
 * @interface WebAuthnAuthenticateStartReq
 */
export interface WebAuthnAuthenticateStartReq {
    /**
     * 
     * @type {string}
     * @memberof WebAuthnAuthenticateStartReq
     */
    'username': string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof WebAuthnAuthenticateStartReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof WebAuthnAuthenticateStartReq
     */
    'clientInfo': ClientInfo;
}
/**
 * 
 * @export
 * @interface WebAuthnAuthenticateStartRsp
 */
export interface WebAuthnAuthenticateStartRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof WebAuthnAuthenticateStartRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof WebAuthnAuthenticateStartRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof WebAuthnAuthenticateStartRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof WebAuthnAuthenticateStartRsp
     */
    'runtime': number;
    /**
     * Contains JSON payload data to start Passkeys (Biometrics) login challenge
     * @type {string}
     * @memberof WebAuthnAuthenticateStartRsp
     */
    'publicKeyCredentialRequestOptions': string;
    /**
     * Status represents information if authenticate start was successful or device is unknown
     * @type {string}
     * @memberof WebAuthnAuthenticateStartRsp
     */
    'status': WebAuthnAuthenticateStartRspStatusEnum;
}

export const WebAuthnAuthenticateStartRspStatusEnum = {
    Success: 'success',
    UnknownDevice: 'unknownDevice',
    UnconfirmedDevice: 'unconfirmedDevice'
} as const;

export type WebAuthnAuthenticateStartRspStatusEnum = typeof WebAuthnAuthenticateStartRspStatusEnum[keyof typeof WebAuthnAuthenticateStartRspStatusEnum];

/**
 * 
 * @export
 * @interface WebAuthnAuthenticateSuccess
 */
export interface WebAuthnAuthenticateSuccess {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof WebAuthnAuthenticateSuccess
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof WebAuthnAuthenticateSuccess
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof WebAuthnAuthenticateSuccess
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof WebAuthnAuthenticateSuccess
     */
    'runtime': number;
    /**
     * ID of the user
     * @type {string}
     * @memberof WebAuthnAuthenticateSuccess
     */
    'userID': string;
    /**
     * Username of current challenge
     * @type {string}
     * @memberof WebAuthnAuthenticateSuccess
     */
    'username': string;
    /**
     * Used credential ID
     * @type {string}
     * @memberof WebAuthnAuthenticateSuccess
     */
    'credentialID': string;
    /**
     * Optional user\'s full name to be used if the user wasn\'t found and needs to be created first
     * @type {string}
     * @memberof WebAuthnAuthenticateSuccess
     */
    'userFullName'?: string;
}
/**
 * 
 * @export
 * @interface WebAuthnAuthenticatorUpdateReq
 */
export interface WebAuthnAuthenticatorUpdateReq {
    /**
     * 
     * @type {string}
     * @memberof WebAuthnAuthenticatorUpdateReq
     */
    'name': string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof WebAuthnAuthenticatorUpdateReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof WebAuthnAuthenticatorUpdateReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface WebAuthnCredentialExistsReq
 */
export interface WebAuthnCredentialExistsReq {
    /**
     * 
     * @type {string}
     * @memberof WebAuthnCredentialExistsReq
     */
    'loginIdentifier': string;
    /**
     * 
     * @type {LoginIdentifierType}
     * @memberof WebAuthnCredentialExistsReq
     */
    'loginIdentifierType': LoginIdentifierType;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof WebAuthnCredentialExistsReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof WebAuthnCredentialExistsReq
     */
    'clientInfo': ClientInfo;
}


/**
 * 
 * @export
 * @interface WebAuthnCredentialExistsRsp
 */
export interface WebAuthnCredentialExistsRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof WebAuthnCredentialExistsRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof WebAuthnCredentialExistsRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof WebAuthnCredentialExistsRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof WebAuthnCredentialExistsRsp
     */
    'runtime': number;
    /**
     * 
     * @type {boolean}
     * @memberof WebAuthnCredentialExistsRsp
     */
    'exists': boolean;
}
/**
 * 
 * @export
 * @interface WebAuthnCredentialItemRsp
 */
export interface WebAuthnCredentialItemRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof WebAuthnCredentialItemRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof WebAuthnCredentialItemRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof WebAuthnCredentialItemRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof WebAuthnCredentialItemRsp
     */
    'runtime': number;
    /**
     * Credential ID
     * @type {string}
     * @memberof WebAuthnCredentialItemRsp
     */
    'id': string;
    /**
     * 
     * @type {string}
     * @memberof WebAuthnCredentialItemRsp
     */
    'credentialHash': string;
    /**
     * 
     * @type {string}
     * @memberof WebAuthnCredentialItemRsp
     */
    'aaguid': string;
    /**
     * 
     * @type {string}
     * @memberof WebAuthnCredentialItemRsp
     */
    'attestationType': string;
    /**
     * Backup state
     * @type {boolean}
     * @memberof WebAuthnCredentialItemRsp
     */
    'backupState'?: boolean;
    /**
     * Backup eligible
     * @type {boolean}
     * @memberof WebAuthnCredentialItemRsp
     */
    'backupEligible': boolean;
    /**
     * Transport
     * @type {Array<string>}
     * @memberof WebAuthnCredentialItemRsp
     */
    'transport': Array<WebAuthnCredentialItemRspTransportEnum>;
    /**
     * Status
     * @type {string}
     * @memberof WebAuthnCredentialItemRsp
     */
    'status': WebAuthnCredentialItemRspStatusEnum;
    /**
     * User agent
     * @type {string}
     * @memberof WebAuthnCredentialItemRsp
     */
    'userAgent': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof WebAuthnCredentialItemRsp
     */
    'created': string;
    /**
     * Authenticator ID
     * @type {string}
     * @memberof WebAuthnCredentialItemRsp
     */
    'authenticatorID': string;
    /**
     * 
     * @type {string}
     * @memberof WebAuthnCredentialItemRsp
     */
    'authenticatorName': string;
    /**
     * Timestamp of when the passkey was last used in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof WebAuthnCredentialItemRsp
     */
    'lastUsed': string;
    /**
     * 
     * @type {string}
     * @memberof WebAuthnCredentialItemRsp
     */
    'lastUsedDeviceName': string;
}

export const WebAuthnCredentialItemRspTransportEnum = {
    Usb: 'usb',
    Nfc: 'nfc',
    Ble: 'ble',
    Internal: 'internal',
    Hybrid: 'hybrid',
    SmartCard: 'smart-card'
} as const;

export type WebAuthnCredentialItemRspTransportEnum = typeof WebAuthnCredentialItemRspTransportEnum[keyof typeof WebAuthnCredentialItemRspTransportEnum];
export const WebAuthnCredentialItemRspStatusEnum = {
    Pending: 'pending',
    Active: 'active'
} as const;

export type WebAuthnCredentialItemRspStatusEnum = typeof WebAuthnCredentialItemRspStatusEnum[keyof typeof WebAuthnCredentialItemRspStatusEnum];

/**
 * 
 * @export
 * @interface WebAuthnCredentialListRsp
 */
export interface WebAuthnCredentialListRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof WebAuthnCredentialListRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof WebAuthnCredentialListRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof WebAuthnCredentialListRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof WebAuthnCredentialListRsp
     */
    'runtime': number;
    /**
     * 
     * @type {Array<WebAuthnCredentialItemRsp>}
     * @memberof WebAuthnCredentialListRsp
     */
    'rows': Array<WebAuthnCredentialItemRsp>;
    /**
     * 
     * @type {Paging}
     * @memberof WebAuthnCredentialListRsp
     */
    'paging': Paging;
}
/**
 * 
 * @export
 * @interface WebAuthnCredentialReq
 */
export interface WebAuthnCredentialReq {
    /**
     * 
     * @type {string}
     * @memberof WebAuthnCredentialReq
     */
    'status': WebAuthnCredentialReqStatusEnum;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof WebAuthnCredentialReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof WebAuthnCredentialReq
     */
    'clientInfo'?: ClientInfo;
}

export const WebAuthnCredentialReqStatusEnum = {
    Pending: 'pending',
    Active: 'active',
    Deleted: 'deleted'
} as const;

export type WebAuthnCredentialReqStatusEnum = typeof WebAuthnCredentialReqStatusEnum[keyof typeof WebAuthnCredentialReqStatusEnum];

/**
 * 
 * @export
 * @interface WebAuthnCredentialRsp
 */
export interface WebAuthnCredentialRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof WebAuthnCredentialRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof WebAuthnCredentialRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof WebAuthnCredentialRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof WebAuthnCredentialRsp
     */
    'runtime': number;
    /**
     * Status
     * @type {string}
     * @memberof WebAuthnCredentialRsp
     */
    'status': WebAuthnCredentialRspStatusEnum;
}

export const WebAuthnCredentialRspStatusEnum = {
    Pending: 'pending',
    Active: 'active',
    Deleted: 'deleted'
} as const;

export type WebAuthnCredentialRspStatusEnum = typeof WebAuthnCredentialRspStatusEnum[keyof typeof WebAuthnCredentialRspStatusEnum];

/**
 * 
 * @export
 * @interface WebAuthnFinishReq
 */
export interface WebAuthnFinishReq {
    /**
     * Contains JSON payload data for Passkeys (Biometrics) login finish challenge
     * @type {string}
     * @memberof WebAuthnFinishReq
     */
    'publicKeyCredential': string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof WebAuthnFinishReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof WebAuthnFinishReq
     */
    'clientInfo': ClientInfo;
}
/**
 * 
 * @export
 * @interface WebAuthnMediationStartReq
 */
export interface WebAuthnMediationStartReq {
    /**
     * Optional limits possible credentials matching to username
     * @type {string}
     * @memberof WebAuthnMediationStartReq
     */
    'username'?: string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof WebAuthnMediationStartReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof WebAuthnMediationStartReq
     */
    'clientInfo': ClientInfo;
}
/**
 * 
 * @export
 * @interface WebAuthnMediationStartRsp
 */
export interface WebAuthnMediationStartRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof WebAuthnMediationStartRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof WebAuthnMediationStartRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof WebAuthnMediationStartRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof WebAuthnMediationStartRsp
     */
    'runtime': number;
    /**
     * Contains JSON payload data to start Passkeys (Biometrics) login challenge
     * @type {string}
     * @memberof WebAuthnMediationStartRsp
     */
    'challenge': string;
}
/**
 * 
 * @export
 * @interface WebAuthnRegisterFinishRsp
 */
export interface WebAuthnRegisterFinishRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof WebAuthnRegisterFinishRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof WebAuthnRegisterFinishRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof WebAuthnRegisterFinishRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof WebAuthnRegisterFinishRsp
     */
    'runtime': number;
    /**
     * ID of the user
     * @type {string}
     * @memberof WebAuthnRegisterFinishRsp
     */
    'userID': string;
    /**
     * Username of current challenge
     * @type {string}
     * @memberof WebAuthnRegisterFinishRsp
     */
    'username': string;
    /**
     * Used credential ID
     * @type {string}
     * @memberof WebAuthnRegisterFinishRsp
     */
    'credentialID': string;
    /**
     * Optional user\'s full name to be used if the user wasn\'t found and needs to be created first
     * @type {string}
     * @memberof WebAuthnRegisterFinishRsp
     */
    'userFullName'?: string;
    /**
     * Status represents information if user sign up was successful or if the user with provided credentials already exists
     * @type {string}
     * @memberof WebAuthnRegisterFinishRsp
     */
    'status': WebAuthnRegisterFinishRspStatusEnum;
}

export const WebAuthnRegisterFinishRspStatusEnum = {
    Success: 'success',
    Duplicate: 'duplicate'
} as const;

export type WebAuthnRegisterFinishRspStatusEnum = typeof WebAuthnRegisterFinishRspStatusEnum[keyof typeof WebAuthnRegisterFinishRspStatusEnum];

/**
 * 
 * @export
 * @interface WebAuthnRegisterStartReq
 */
export interface WebAuthnRegisterStartReq {
    /**
     * 
     * @type {string}
     * @memberof WebAuthnRegisterStartReq
     */
    'username': string;
    /**
     * Optional user\'s full name to be used if the user wasn\'t found and needs to be created first
     * @type {string}
     * @memberof WebAuthnRegisterStartReq
     */
    'userFullName'?: string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof WebAuthnRegisterStartReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof WebAuthnRegisterStartReq
     */
    'clientInfo': ClientInfo;
    /**
     * Sets credential status into active and pending. Pending status dont allow a login until the credential gets confirmed by an api call.
     * @type {string}
     * @memberof WebAuthnRegisterStartReq
     */
    'credentialStatus'?: WebAuthnRegisterStartReqCredentialStatusEnum;
}

export const WebAuthnRegisterStartReqCredentialStatusEnum = {
    Active: 'active',
    Pending: 'pending'
} as const;

export type WebAuthnRegisterStartReqCredentialStatusEnum = typeof WebAuthnRegisterStartReqCredentialStatusEnum[keyof typeof WebAuthnRegisterStartReqCredentialStatusEnum];

/**
 * 
 * @export
 * @interface WebAuthnRegisterStartRsp
 */
export interface WebAuthnRegisterStartRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof WebAuthnRegisterStartRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof WebAuthnRegisterStartRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof WebAuthnRegisterStartRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof WebAuthnRegisterStartRsp
     */
    'runtime': number;
    /**
     * Status represents information if user signup was successful or the user with its credentials already exists
     * @type {string}
     * @memberof WebAuthnRegisterStartRsp
     */
    'status': WebAuthnRegisterStartRspStatusEnum;
    /**
     * Contains JSON payload data to start Passkeys (Biometrics) sign up challenge
     * @type {string}
     * @memberof WebAuthnRegisterStartRsp
     */
    'publicKeyCredentialCreationOptions': string;
}

export const WebAuthnRegisterStartRspStatusEnum = {
    Success: 'success',
    Duplicate: 'duplicate'
} as const;

export type WebAuthnRegisterStartRspStatusEnum = typeof WebAuthnRegisterStartRspStatusEnum[keyof typeof WebAuthnRegisterStartRspStatusEnum];

/**
 * 
 * @export
 * @interface WebauthnSettingCreate
 */
export interface WebauthnSettingCreate {
    /**
     * Name of this setting
     * @type {string}
     * @memberof WebauthnSettingCreate
     */
    'name': string;
    /**
     * Define here either a url incl. schema or an android-apk-key-hash
     * @type {string}
     * @memberof WebauthnSettingCreate
     */
    'origin': string;
}
/**
 * 
 * @export
 * @interface WebauthnSettingCreateReq
 */
export interface WebauthnSettingCreateReq {
    /**
     * Name of this setting
     * @type {string}
     * @memberof WebauthnSettingCreateReq
     */
    'name': string;
    /**
     * Define here either a url incl. schema or an android-apk-key-hash
     * @type {string}
     * @memberof WebauthnSettingCreateReq
     */
    'origin': string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof WebauthnSettingCreateReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof WebauthnSettingCreateReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface WebauthnSettingCreateRsp
 */
export interface WebauthnSettingCreateRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof WebauthnSettingCreateRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof WebauthnSettingCreateRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof WebauthnSettingCreateRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof WebauthnSettingCreateRsp
     */
    'runtime': number;
    /**
     * Name of this setting
     * @type {string}
     * @memberof WebauthnSettingCreateRsp
     */
    'name': string;
    /**
     * Define here either a url incl. schema or an android-apk-key-hash
     * @type {string}
     * @memberof WebauthnSettingCreateRsp
     */
    'origin': string;
    /**
     * ID of WebAuthn setting
     * @type {string}
     * @memberof WebauthnSettingCreateRsp
     */
    'id': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof WebauthnSettingCreateRsp
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof WebauthnSettingCreateRsp
     */
    'updated': string;
}
/**
 * 
 * @export
 * @interface WebauthnSettingDeleteReq
 */
export interface WebauthnSettingDeleteReq {
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof WebauthnSettingDeleteReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof WebauthnSettingDeleteReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface WebauthnSettingGetRsp
 */
export interface WebauthnSettingGetRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof WebauthnSettingGetRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof WebauthnSettingGetRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof WebauthnSettingGetRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof WebauthnSettingGetRsp
     */
    'runtime': number;
    /**
     * Name of this setting
     * @type {string}
     * @memberof WebauthnSettingGetRsp
     */
    'name': string;
    /**
     * Define here either a url incl. schema or an android-apk-key-hash
     * @type {string}
     * @memberof WebauthnSettingGetRsp
     */
    'origin': string;
    /**
     * ID of WebAuthn setting
     * @type {string}
     * @memberof WebauthnSettingGetRsp
     */
    'id': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof WebauthnSettingGetRsp
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof WebauthnSettingGetRsp
     */
    'updated': string;
}
/**
 * 
 * @export
 * @interface WebauthnSettingItem
 */
export interface WebauthnSettingItem {
    /**
     * Name of this setting
     * @type {string}
     * @memberof WebauthnSettingItem
     */
    'name': string;
    /**
     * Define here either a url incl. schema or an android-apk-key-hash
     * @type {string}
     * @memberof WebauthnSettingItem
     */
    'origin': string;
    /**
     * ID of WebAuthn setting
     * @type {string}
     * @memberof WebauthnSettingItem
     */
    'id': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof WebauthnSettingItem
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof WebauthnSettingItem
     */
    'updated': string;
}
/**
 * 
 * @export
 * @interface WebauthnSettingListRsp
 */
export interface WebauthnSettingListRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof WebauthnSettingListRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof WebauthnSettingListRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof WebauthnSettingListRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof WebauthnSettingListRsp
     */
    'runtime': number;
    /**
     * 
     * @type {Array<WebauthnSettingItem>}
     * @memberof WebauthnSettingListRsp
     */
    'rows': Array<WebauthnSettingItem>;
    /**
     * 
     * @type {Paging}
     * @memberof WebauthnSettingListRsp
     */
    'paging': Paging;
}
/**
 * 
 * @export
 * @interface WebauthnSettingUpdateReq
 */
export interface WebauthnSettingUpdateReq {
    /**
     * Name of this setting
     * @type {string}
     * @memberof WebauthnSettingUpdateReq
     */
    'name': string;
    /**
     * Define here either a url incl. schema or an android-apk-key-hash
     * @type {string}
     * @memberof WebauthnSettingUpdateReq
     */
    'origin': string;
    /**
     * Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
     * @type {string}
     * @memberof WebauthnSettingUpdateReq
     */
    'requestID'?: string;
    /**
     * 
     * @type {ClientInfo}
     * @memberof WebauthnSettingUpdateReq
     */
    'clientInfo'?: ClientInfo;
}
/**
 * 
 * @export
 * @interface WebauthnSettingUpdateRsp
 */
export interface WebauthnSettingUpdateRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof WebauthnSettingUpdateRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof WebauthnSettingUpdateRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof WebauthnSettingUpdateRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof WebauthnSettingUpdateRsp
     */
    'runtime': number;
    /**
     * Name of this setting
     * @type {string}
     * @memberof WebauthnSettingUpdateRsp
     */
    'name': string;
    /**
     * Define here either a url incl. schema or an android-apk-key-hash
     * @type {string}
     * @memberof WebauthnSettingUpdateRsp
     */
    'origin': string;
    /**
     * ID of WebAuthn setting
     * @type {string}
     * @memberof WebauthnSettingUpdateRsp
     */
    'id': string;
    /**
     * Timestamp of when the entity was created in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof WebauthnSettingUpdateRsp
     */
    'created': string;
    /**
     * Timestamp of when the entity was last updated in yyyy-MM-dd\'T\'HH:mm:ss format
     * @type {string}
     * @memberof WebauthnSettingUpdateRsp
     */
    'updated': string;
}
/**
 * Webhook log entry
 * @export
 * @interface WebhookLog
 */
export interface WebhookLog {
    /**
     * Unique ID of webhook request which will be randomly generated on server side
     * @type {string}
     * @memberof WebhookLog
     */
    'webhookID': string;
    /**
     * ID of project
     * @type {string}
     * @memberof WebhookLog
     */
    'projectID': string;
    /**
     * Webhook action
     * @type {string}
     * @memberof WebhookLog
     */
    'action': string;
    /**
     * Unique ID of response, you can provide your own while responding to the webhook, if not the ID will be randomly generated on server side. This has the same meaning as overriding requestID for API requests. 
     * @type {string}
     * @memberof WebhookLog
     */
    'responseID': string;
    /**
     * Absolute request URL of webhook backend
     * @type {string}
     * @memberof WebhookLog
     */
    'requestURL': string;
    /**
     * Request contents that were sent to webhook backend
     * @type {string}
     * @memberof WebhookLog
     */
    'requestBody': string;
    /**
     * Response HTTP status that was returned by webhook backend
     * @type {number}
     * @memberof WebhookLog
     */
    'responseStatus': number;
    /**
     * Response HTTP headers that were returned by webhook backend
     * @type {object}
     * @memberof WebhookLog
     */
    'responseHeaders': object;
    /**
     * Response body JSON data that was returned by webhook backend
     * @type {string}
     * @memberof WebhookLog
     */
    'responseBody': string;
    /**
     * Response error if present
     * @type {string}
     * @memberof WebhookLog
     */
    'responseError': string;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof WebhookLog
     */
    'runtime': number;
    /**
     * Timestamp of when the request was performed in RFC3339 format
     * @type {string}
     * @memberof WebhookLog
     */
    'created': string;
}
/**
 * 
 * @export
 * @interface WebhookLogsListRsp
 */
export interface WebhookLogsListRsp {
    /**
     * HTTP status code of operation
     * @type {number}
     * @memberof WebhookLogsListRsp
     */
    'httpStatusCode': number;
    /**
     * 
     * @type {string}
     * @memberof WebhookLogsListRsp
     */
    'message': string;
    /**
     * 
     * @type {RequestData}
     * @memberof WebhookLogsListRsp
     */
    'requestData': RequestData;
    /**
     * Runtime in seconds for this request
     * @type {number}
     * @memberof WebhookLogsListRsp
     */
    'runtime': number;
    /**
     * 
     * @type {WebhookLogsListRspAllOfData}
     * @memberof WebhookLogsListRsp
     */
    'data': WebhookLogsListRspAllOfData;
}
/**
 * 
 * @export
 * @interface WebhookLogsListRspAllOfData
 */
export interface WebhookLogsListRspAllOfData {
    /**
     * 
     * @type {Array<WebhookLog>}
     * @memberof WebhookLogsListRspAllOfData
     */
    'logs': Array<WebhookLog>;
    /**
     * 
     * @type {Paging}
     * @memberof WebhookLogsListRspAllOfData
     */
    'paging': Paging;
}

/**
 * APISecretsApi - axios parameter creator
 * @export
 */
export const APISecretsApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Creates an API secret
         * @param {ProjectSecretCreateReq} [projectSecretCreateReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        projectSecretCreate: async (projectSecretCreateReq?: ProjectSecretCreateReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/v1/projectSecrets`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(projectSecretCreateReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Deletes API secret
         * @param {string} secretID Secret ID from create
         * @param {ProjectSecretDeleteReq} [projectSecretDeleteReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        projectSecretDelete: async (secretID: string, projectSecretDeleteReq?: ProjectSecretDeleteReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'secretID' is not null or undefined
            assertParamExists('projectSecretDelete', 'secretID', secretID)
            const localVarPath = `/v1/projectSecrets/{secretID}`
                .replace(`{${"secretID"}}`, encodeURIComponent(String(secretID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'DELETE', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(projectSecretDeleteReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Lists API secrets
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        projectSecretList: async (options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/v1/projectSecrets`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * APISecretsApi - functional programming interface
 * @export
 */
export const APISecretsApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = APISecretsApiAxiosParamCreator(configuration)
    return {
        /**
         * Creates an API secret
         * @param {ProjectSecretCreateReq} [projectSecretCreateReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async projectSecretCreate(projectSecretCreateReq?: ProjectSecretCreateReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<ProjectSecretCreateRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.projectSecretCreate(projectSecretCreateReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['APISecretsApi.projectSecretCreate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Deletes API secret
         * @param {string} secretID Secret ID from create
         * @param {ProjectSecretDeleteReq} [projectSecretDeleteReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async projectSecretDelete(secretID: string, projectSecretDeleteReq?: ProjectSecretDeleteReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<GenericRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.projectSecretDelete(secretID, projectSecretDeleteReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['APISecretsApi.projectSecretDelete']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Lists API secrets
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async projectSecretList(options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<ProjectSecretListRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.projectSecretList(options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['APISecretsApi.projectSecretList']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * APISecretsApi - factory interface
 * @export
 */
export const APISecretsApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = APISecretsApiFp(configuration)
    return {
        /**
         * Creates an API secret
         * @param {ProjectSecretCreateReq} [projectSecretCreateReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        projectSecretCreate(projectSecretCreateReq?: ProjectSecretCreateReq, options?: any): AxiosPromise<ProjectSecretCreateRsp> {
            return localVarFp.projectSecretCreate(projectSecretCreateReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Deletes API secret
         * @param {string} secretID Secret ID from create
         * @param {ProjectSecretDeleteReq} [projectSecretDeleteReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        projectSecretDelete(secretID: string, projectSecretDeleteReq?: ProjectSecretDeleteReq, options?: any): AxiosPromise<GenericRsp> {
            return localVarFp.projectSecretDelete(secretID, projectSecretDeleteReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Lists API secrets
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        projectSecretList(options?: any): AxiosPromise<ProjectSecretListRsp> {
            return localVarFp.projectSecretList(options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * APISecretsApi - object-oriented interface
 * @export
 * @class APISecretsApi
 * @extends {BaseAPI}
 */
export class APISecretsApi extends BaseAPI {
    /**
     * Creates an API secret
     * @param {ProjectSecretCreateReq} [projectSecretCreateReq] 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof APISecretsApi
     */
    public projectSecretCreate(projectSecretCreateReq?: ProjectSecretCreateReq, options?: RawAxiosRequestConfig) {
        return APISecretsApiFp(this.configuration).projectSecretCreate(projectSecretCreateReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Deletes API secret
     * @param {string} secretID Secret ID from create
     * @param {ProjectSecretDeleteReq} [projectSecretDeleteReq] 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof APISecretsApi
     */
    public projectSecretDelete(secretID: string, projectSecretDeleteReq?: ProjectSecretDeleteReq, options?: RawAxiosRequestConfig) {
        return APISecretsApiFp(this.configuration).projectSecretDelete(secretID, projectSecretDeleteReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Lists API secrets
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof APISecretsApi
     */
    public projectSecretList(options?: RawAxiosRequestConfig) {
        return APISecretsApiFp(this.configuration).projectSecretList(options).then((request) => request(this.axios, this.basePath));
    }
}



/**
 * AnalyzerApi - axios parameter creator
 * @export
 */
export const AnalyzerApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Provides project\'s passkeys raw tracking data per visitor
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        trackingAllRequest: async (remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/v1/tracking`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }

            if (sort !== undefined) {
                localVarQueryParameter['sort'] = sort;
            }

            if (filter) {
                localVarQueryParameter['filter[]'] = filter;
            }

            if (page !== undefined) {
                localVarQueryParameter['page'] = page;
            }

            if (pageSize !== undefined) {
                localVarQueryParameter['pageSize'] = pageSize;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Provides tracking credential backup state data
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        trackingBackupStateGet: async (remoteAddress?: string, userAgent?: string, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/v1/tracking/backupState`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Provides detailed browser tracking data
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        trackingBrowserDetailedStatsList: async (granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'granularity' is not null or undefined
            assertParamExists('trackingBrowserDetailedStatsList', 'granularity', granularity)
            const localVarPath = `/v1/tracking/browser/stats/detailed`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }

            if (sort !== undefined) {
                localVarQueryParameter['sort'] = sort;
            }

            if (filter) {
                localVarQueryParameter['filter[]'] = filter;
            }

            if (page !== undefined) {
                localVarQueryParameter['page'] = page;
            }

            if (pageSize !== undefined) {
                localVarQueryParameter['pageSize'] = pageSize;
            }

            if (granularity !== undefined) {
                localVarQueryParameter['granularity'] = granularity;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Provides browser tracking data
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        trackingBrowserStatsList: async (granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'granularity' is not null or undefined
            assertParamExists('trackingBrowserStatsList', 'granularity', granularity)
            const localVarPath = `/v1/tracking/browser/stats`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }

            if (sort !== undefined) {
                localVarQueryParameter['sort'] = sort;
            }

            if (filter) {
                localVarQueryParameter['filter[]'] = filter;
            }

            if (page !== undefined) {
                localVarQueryParameter['page'] = page;
            }

            if (pageSize !== undefined) {
                localVarQueryParameter['pageSize'] = pageSize;
            }

            if (granularity !== undefined) {
                localVarQueryParameter['granularity'] = granularity;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Provides detailed tracking data
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        trackingDetailedStatsList: async (granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'granularity' is not null or undefined
            assertParamExists('trackingDetailedStatsList', 'granularity', granularity)
            const localVarPath = `/v1/tracking/stats/detailed`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }

            if (sort !== undefined) {
                localVarQueryParameter['sort'] = sort;
            }

            if (filter) {
                localVarQueryParameter['filter[]'] = filter;
            }

            if (page !== undefined) {
                localVarQueryParameter['page'] = page;
            }

            if (pageSize !== undefined) {
                localVarQueryParameter['pageSize'] = pageSize;
            }

            if (granularity !== undefined) {
                localVarQueryParameter['granularity'] = granularity;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Provides tracking enum values
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        trackingEnumsGet: async (remoteAddress?: string, userAgent?: string, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/v1/tracking/enums`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Provides detailed OS tracking data
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        trackingOSDetailedStatsList: async (granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'granularity' is not null or undefined
            assertParamExists('trackingOSDetailedStatsList', 'granularity', granularity)
            const localVarPath = `/v1/tracking/os/stats/detailed`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }

            if (sort !== undefined) {
                localVarQueryParameter['sort'] = sort;
            }

            if (filter) {
                localVarQueryParameter['filter[]'] = filter;
            }

            if (page !== undefined) {
                localVarQueryParameter['page'] = page;
            }

            if (pageSize !== undefined) {
                localVarQueryParameter['pageSize'] = pageSize;
            }

            if (granularity !== undefined) {
                localVarQueryParameter['granularity'] = granularity;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Provides os tracking data
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        trackingOSStatsList: async (granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'granularity' is not null or undefined
            assertParamExists('trackingOSStatsList', 'granularity', granularity)
            const localVarPath = `/v1/tracking/os/stats`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }

            if (sort !== undefined) {
                localVarQueryParameter['sort'] = sort;
            }

            if (filter) {
                localVarQueryParameter['filter[]'] = filter;
            }

            if (page !== undefined) {
                localVarQueryParameter['page'] = page;
            }

            if (pageSize !== undefined) {
                localVarQueryParameter['pageSize'] = pageSize;
            }

            if (granularity !== undefined) {
                localVarQueryParameter['granularity'] = granularity;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Provides aggregated statstics for project\'s passkeys tracking data
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        trackingStatsList: async (granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'granularity' is not null or undefined
            assertParamExists('trackingStatsList', 'granularity', granularity)
            const localVarPath = `/v1/tracking/stats`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }

            if (sort !== undefined) {
                localVarQueryParameter['sort'] = sort;
            }

            if (filter) {
                localVarQueryParameter['filter[]'] = filter;
            }

            if (page !== undefined) {
                localVarQueryParameter['page'] = page;
            }

            if (pageSize !== undefined) {
                localVarQueryParameter['pageSize'] = pageSize;
            }

            if (granularity !== undefined) {
                localVarQueryParameter['granularity'] = granularity;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * AnalyzerApi - functional programming interface
 * @export
 */
export const AnalyzerApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = AnalyzerApiAxiosParamCreator(configuration)
    return {
        /**
         * Provides project\'s passkeys raw tracking data per visitor
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async trackingAllRequest(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<TrackingRawListRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.trackingAllRequest(remoteAddress, userAgent, sort, filter, page, pageSize, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['AnalyzerApi.trackingAllRequest']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Provides tracking credential backup state data
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async trackingBackupStateGet(remoteAddress?: string, userAgent?: string, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<TrackingBackupStateGetRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.trackingBackupStateGet(remoteAddress, userAgent, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['AnalyzerApi.trackingBackupStateGet']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Provides detailed browser tracking data
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async trackingBrowserDetailedStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<TrackingBrowserDetailedStatsListRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.trackingBrowserDetailedStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['AnalyzerApi.trackingBrowserDetailedStatsList']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Provides browser tracking data
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async trackingBrowserStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<TrackingBrowserStatsListRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.trackingBrowserStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['AnalyzerApi.trackingBrowserStatsList']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Provides detailed tracking data
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async trackingDetailedStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<TrackingDetailedStatsListRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.trackingDetailedStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['AnalyzerApi.trackingDetailedStatsList']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Provides tracking enum values
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async trackingEnumsGet(remoteAddress?: string, userAgent?: string, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<TrackingEnumsGetRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.trackingEnumsGet(remoteAddress, userAgent, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['AnalyzerApi.trackingEnumsGet']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Provides detailed OS tracking data
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async trackingOSDetailedStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<TrackingOSDetailedStatsListRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.trackingOSDetailedStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['AnalyzerApi.trackingOSDetailedStatsList']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Provides os tracking data
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async trackingOSStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<TrackingOSStatsListRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.trackingOSStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['AnalyzerApi.trackingOSStatsList']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Provides aggregated statstics for project\'s passkeys tracking data
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async trackingStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<TrackingStatsListRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.trackingStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['AnalyzerApi.trackingStatsList']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * AnalyzerApi - factory interface
 * @export
 */
export const AnalyzerApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = AnalyzerApiFp(configuration)
    return {
        /**
         * Provides project\'s passkeys raw tracking data per visitor
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        trackingAllRequest(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: any): AxiosPromise<TrackingRawListRsp> {
            return localVarFp.trackingAllRequest(remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(axios, basePath));
        },
        /**
         * Provides tracking credential backup state data
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        trackingBackupStateGet(remoteAddress?: string, userAgent?: string, options?: any): AxiosPromise<TrackingBackupStateGetRsp> {
            return localVarFp.trackingBackupStateGet(remoteAddress, userAgent, options).then((request) => request(axios, basePath));
        },
        /**
         * Provides detailed browser tracking data
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        trackingBrowserDetailedStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: any): AxiosPromise<TrackingBrowserDetailedStatsListRsp> {
            return localVarFp.trackingBrowserDetailedStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(axios, basePath));
        },
        /**
         * Provides browser tracking data
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        trackingBrowserStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: any): AxiosPromise<TrackingBrowserStatsListRsp> {
            return localVarFp.trackingBrowserStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(axios, basePath));
        },
        /**
         * Provides detailed tracking data
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        trackingDetailedStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: any): AxiosPromise<TrackingDetailedStatsListRsp> {
            return localVarFp.trackingDetailedStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(axios, basePath));
        },
        /**
         * Provides tracking enum values
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        trackingEnumsGet(remoteAddress?: string, userAgent?: string, options?: any): AxiosPromise<TrackingEnumsGetRsp> {
            return localVarFp.trackingEnumsGet(remoteAddress, userAgent, options).then((request) => request(axios, basePath));
        },
        /**
         * Provides detailed OS tracking data
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        trackingOSDetailedStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: any): AxiosPromise<TrackingOSDetailedStatsListRsp> {
            return localVarFp.trackingOSDetailedStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(axios, basePath));
        },
        /**
         * Provides os tracking data
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        trackingOSStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: any): AxiosPromise<TrackingOSStatsListRsp> {
            return localVarFp.trackingOSStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(axios, basePath));
        },
        /**
         * Provides aggregated statstics for project\'s passkeys tracking data
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        trackingStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: any): AxiosPromise<TrackingStatsListRsp> {
            return localVarFp.trackingStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * AnalyzerApi - object-oriented interface
 * @export
 * @class AnalyzerApi
 * @extends {BaseAPI}
 */
export class AnalyzerApi extends BaseAPI {
    /**
     * Provides project\'s passkeys raw tracking data per visitor
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {string} [sort] Field sorting
     * @param {Array<string>} [filter] Field filtering
     * @param {number} [page] Page number
     * @param {number} [pageSize] Number of items per page
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof AnalyzerApi
     */
    public trackingAllRequest(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig) {
        return AnalyzerApiFp(this.configuration).trackingAllRequest(remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Provides tracking credential backup state data
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof AnalyzerApi
     */
    public trackingBackupStateGet(remoteAddress?: string, userAgent?: string, options?: RawAxiosRequestConfig) {
        return AnalyzerApiFp(this.configuration).trackingBackupStateGet(remoteAddress, userAgent, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Provides detailed browser tracking data
     * @param {string} granularity Data granularity
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {string} [sort] Field sorting
     * @param {Array<string>} [filter] Field filtering
     * @param {number} [page] Page number
     * @param {number} [pageSize] Number of items per page
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof AnalyzerApi
     */
    public trackingBrowserDetailedStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig) {
        return AnalyzerApiFp(this.configuration).trackingBrowserDetailedStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Provides browser tracking data
     * @param {string} granularity Data granularity
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {string} [sort] Field sorting
     * @param {Array<string>} [filter] Field filtering
     * @param {number} [page] Page number
     * @param {number} [pageSize] Number of items per page
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof AnalyzerApi
     */
    public trackingBrowserStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig) {
        return AnalyzerApiFp(this.configuration).trackingBrowserStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Provides detailed tracking data
     * @param {string} granularity Data granularity
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {string} [sort] Field sorting
     * @param {Array<string>} [filter] Field filtering
     * @param {number} [page] Page number
     * @param {number} [pageSize] Number of items per page
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof AnalyzerApi
     */
    public trackingDetailedStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig) {
        return AnalyzerApiFp(this.configuration).trackingDetailedStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Provides tracking enum values
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof AnalyzerApi
     */
    public trackingEnumsGet(remoteAddress?: string, userAgent?: string, options?: RawAxiosRequestConfig) {
        return AnalyzerApiFp(this.configuration).trackingEnumsGet(remoteAddress, userAgent, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Provides detailed OS tracking data
     * @param {string} granularity Data granularity
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {string} [sort] Field sorting
     * @param {Array<string>} [filter] Field filtering
     * @param {number} [page] Page number
     * @param {number} [pageSize] Number of items per page
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof AnalyzerApi
     */
    public trackingOSDetailedStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig) {
        return AnalyzerApiFp(this.configuration).trackingOSDetailedStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Provides os tracking data
     * @param {string} granularity Data granularity
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {string} [sort] Field sorting
     * @param {Array<string>} [filter] Field filtering
     * @param {number} [page] Page number
     * @param {number} [pageSize] Number of items per page
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof AnalyzerApi
     */
    public trackingOSStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig) {
        return AnalyzerApiFp(this.configuration).trackingOSStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Provides aggregated statstics for project\'s passkeys tracking data
     * @param {string} granularity Data granularity
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {string} [sort] Field sorting
     * @param {Array<string>} [filter] Field filtering
     * @param {number} [page] Page number
     * @param {number} [pageSize] Number of items per page
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof AnalyzerApi
     */
    public trackingStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig) {
        return AnalyzerApiFp(this.configuration).trackingStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(this.axios, this.basePath));
    }
}



/**
 * AndroidAppConfigApi - axios parameter creator
 * @export
 */
export const AndroidAppConfigApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Creates a new Android App Configuration
         * @param {AndroidAppConfigSaveReq} androidAppConfigSaveReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        androidAppConfigCreate: async (androidAppConfigSaveReq: AndroidAppConfigSaveReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'androidAppConfigSaveReq' is not null or undefined
            assertParamExists('androidAppConfigCreate', 'androidAppConfigSaveReq', androidAppConfigSaveReq)
            const localVarPath = `/v1/androidappconfig`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(androidAppConfigSaveReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Deletes an Android App Config
         * @param {string} androidAppConfigID Android App Config ID from create
         * @param {AndroidAppConfigDeleteReq} [androidAppConfigDeleteReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        androidAppConfigDelete: async (androidAppConfigID: string, androidAppConfigDeleteReq?: AndroidAppConfigDeleteReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'androidAppConfigID' is not null or undefined
            assertParamExists('androidAppConfigDelete', 'androidAppConfigID', androidAppConfigID)
            const localVarPath = `/v1/androidappconfig/{androidAppConfigID}`
                .replace(`{${"androidAppConfigID"}}`, encodeURIComponent(String(androidAppConfigID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'DELETE', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(androidAppConfigDeleteReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Lists Android App Configurations for a project
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        androidAppConfigGet: async (options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/v1/androidappconfig`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Updates an Android app config by id
         * @param {string} androidAppConfigID ID from Android config create
         * @param {AndroidAppConfigUpdateReq} [androidAppConfigUpdateReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        androidAppConfigPut: async (androidAppConfigID: string, androidAppConfigUpdateReq?: AndroidAppConfigUpdateReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'androidAppConfigID' is not null or undefined
            assertParamExists('androidAppConfigPut', 'androidAppConfigID', androidAppConfigID)
            const localVarPath = `/v1/androidappconfig/{androidAppConfigID}`
                .replace(`{${"androidAppConfigID"}}`, encodeURIComponent(String(androidAppConfigID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'PUT', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(androidAppConfigUpdateReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * AndroidAppConfigApi - functional programming interface
 * @export
 */
export const AndroidAppConfigApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = AndroidAppConfigApiAxiosParamCreator(configuration)
    return {
        /**
         * Creates a new Android App Configuration
         * @param {AndroidAppConfigSaveReq} androidAppConfigSaveReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async androidAppConfigCreate(androidAppConfigSaveReq: AndroidAppConfigSaveReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<AndroidAppConfigSaveRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.androidAppConfigCreate(androidAppConfigSaveReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['AndroidAppConfigApi.androidAppConfigCreate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Deletes an Android App Config
         * @param {string} androidAppConfigID Android App Config ID from create
         * @param {AndroidAppConfigDeleteReq} [androidAppConfigDeleteReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async androidAppConfigDelete(androidAppConfigID: string, androidAppConfigDeleteReq?: AndroidAppConfigDeleteReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<GenericRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.androidAppConfigDelete(androidAppConfigID, androidAppConfigDeleteReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['AndroidAppConfigApi.androidAppConfigDelete']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Lists Android App Configurations for a project
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async androidAppConfigGet(options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<AndroidAppConfigListRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.androidAppConfigGet(options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['AndroidAppConfigApi.androidAppConfigGet']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Updates an Android app config by id
         * @param {string} androidAppConfigID ID from Android config create
         * @param {AndroidAppConfigUpdateReq} [androidAppConfigUpdateReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async androidAppConfigPut(androidAppConfigID: string, androidAppConfigUpdateReq?: AndroidAppConfigUpdateReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<AndroidAppConfigUpdateRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.androidAppConfigPut(androidAppConfigID, androidAppConfigUpdateReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['AndroidAppConfigApi.androidAppConfigPut']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * AndroidAppConfigApi - factory interface
 * @export
 */
export const AndroidAppConfigApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = AndroidAppConfigApiFp(configuration)
    return {
        /**
         * Creates a new Android App Configuration
         * @param {AndroidAppConfigSaveReq} androidAppConfigSaveReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        androidAppConfigCreate(androidAppConfigSaveReq: AndroidAppConfigSaveReq, options?: any): AxiosPromise<AndroidAppConfigSaveRsp> {
            return localVarFp.androidAppConfigCreate(androidAppConfigSaveReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Deletes an Android App Config
         * @param {string} androidAppConfigID Android App Config ID from create
         * @param {AndroidAppConfigDeleteReq} [androidAppConfigDeleteReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        androidAppConfigDelete(androidAppConfigID: string, androidAppConfigDeleteReq?: AndroidAppConfigDeleteReq, options?: any): AxiosPromise<GenericRsp> {
            return localVarFp.androidAppConfigDelete(androidAppConfigID, androidAppConfigDeleteReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Lists Android App Configurations for a project
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        androidAppConfigGet(options?: any): AxiosPromise<AndroidAppConfigListRsp> {
            return localVarFp.androidAppConfigGet(options).then((request) => request(axios, basePath));
        },
        /**
         * Updates an Android app config by id
         * @param {string} androidAppConfigID ID from Android config create
         * @param {AndroidAppConfigUpdateReq} [androidAppConfigUpdateReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        androidAppConfigPut(androidAppConfigID: string, androidAppConfigUpdateReq?: AndroidAppConfigUpdateReq, options?: any): AxiosPromise<AndroidAppConfigUpdateRsp> {
            return localVarFp.androidAppConfigPut(androidAppConfigID, androidAppConfigUpdateReq, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * AndroidAppConfigApi - object-oriented interface
 * @export
 * @class AndroidAppConfigApi
 * @extends {BaseAPI}
 */
export class AndroidAppConfigApi extends BaseAPI {
    /**
     * Creates a new Android App Configuration
     * @param {AndroidAppConfigSaveReq} androidAppConfigSaveReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof AndroidAppConfigApi
     */
    public androidAppConfigCreate(androidAppConfigSaveReq: AndroidAppConfigSaveReq, options?: RawAxiosRequestConfig) {
        return AndroidAppConfigApiFp(this.configuration).androidAppConfigCreate(androidAppConfigSaveReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Deletes an Android App Config
     * @param {string} androidAppConfigID Android App Config ID from create
     * @param {AndroidAppConfigDeleteReq} [androidAppConfigDeleteReq] 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof AndroidAppConfigApi
     */
    public androidAppConfigDelete(androidAppConfigID: string, androidAppConfigDeleteReq?: AndroidAppConfigDeleteReq, options?: RawAxiosRequestConfig) {
        return AndroidAppConfigApiFp(this.configuration).androidAppConfigDelete(androidAppConfigID, androidAppConfigDeleteReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Lists Android App Configurations for a project
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof AndroidAppConfigApi
     */
    public androidAppConfigGet(options?: RawAxiosRequestConfig) {
        return AndroidAppConfigApiFp(this.configuration).androidAppConfigGet(options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Updates an Android app config by id
     * @param {string} androidAppConfigID ID from Android config create
     * @param {AndroidAppConfigUpdateReq} [androidAppConfigUpdateReq] 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof AndroidAppConfigApi
     */
    public androidAppConfigPut(androidAppConfigID: string, androidAppConfigUpdateReq?: AndroidAppConfigUpdateReq, options?: RawAxiosRequestConfig) {
        return AndroidAppConfigApiFp(this.configuration).androidAppConfigPut(androidAppConfigID, androidAppConfigUpdateReq, options).then((request) => request(this.axios, this.basePath));
    }
}



/**
 * AssociationTokensApi - axios parameter creator
 * @export
 */
export const AssociationTokensApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Creates a new association token
         * @param {AssociationTokenCreateReq} associationTokenCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        associationTokenCreate: async (associationTokenCreateReq: AssociationTokenCreateReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'associationTokenCreateReq' is not null or undefined
            assertParamExists('associationTokenCreate', 'associationTokenCreateReq', associationTokenCreateReq)
            const localVarPath = `/v1/associationTokens`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(associationTokenCreateReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * AssociationTokensApi - functional programming interface
 * @export
 */
export const AssociationTokensApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = AssociationTokensApiAxiosParamCreator(configuration)
    return {
        /**
         * Creates a new association token
         * @param {AssociationTokenCreateReq} associationTokenCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async associationTokenCreate(associationTokenCreateReq: AssociationTokenCreateReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<AssociationTokenCreateRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.associationTokenCreate(associationTokenCreateReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['AssociationTokensApi.associationTokenCreate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * AssociationTokensApi - factory interface
 * @export
 */
export const AssociationTokensApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = AssociationTokensApiFp(configuration)
    return {
        /**
         * Creates a new association token
         * @param {AssociationTokenCreateReq} associationTokenCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        associationTokenCreate(associationTokenCreateReq: AssociationTokenCreateReq, options?: any): AxiosPromise<AssociationTokenCreateRsp> {
            return localVarFp.associationTokenCreate(associationTokenCreateReq, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * AssociationTokensApi - object-oriented interface
 * @export
 * @class AssociationTokensApi
 * @extends {BaseAPI}
 */
export class AssociationTokensApi extends BaseAPI {
    /**
     * Creates a new association token
     * @param {AssociationTokenCreateReq} associationTokenCreateReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof AssociationTokensApi
     */
    public associationTokenCreate(associationTokenCreateReq: AssociationTokenCreateReq, options?: RawAxiosRequestConfig) {
        return AssociationTokensApiFp(this.configuration).associationTokenCreate(associationTokenCreateReq, options).then((request) => request(this.axios, this.basePath));
    }
}



/**
 * AuthMethodsApi - axios parameter creator
 * @export
 */
export const AuthMethodsApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Retrieves possible authentication methods for provided username
         * @param {AuthMethodsListReq} authMethodsListReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        authMethodsList: async (authMethodsListReq: AuthMethodsListReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'authMethodsListReq' is not null or undefined
            assertParamExists('authMethodsList', 'authMethodsListReq', authMethodsListReq)
            const localVarPath = `/v1/authMethods`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(authMethodsListReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * AuthMethodsApi - functional programming interface
 * @export
 */
export const AuthMethodsApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = AuthMethodsApiAxiosParamCreator(configuration)
    return {
        /**
         * Retrieves possible authentication methods for provided username
         * @param {AuthMethodsListReq} authMethodsListReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async authMethodsList(authMethodsListReq: AuthMethodsListReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<AuthMethodsListRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.authMethodsList(authMethodsListReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['AuthMethodsApi.authMethodsList']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * AuthMethodsApi - factory interface
 * @export
 */
export const AuthMethodsApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = AuthMethodsApiFp(configuration)
    return {
        /**
         * Retrieves possible authentication methods for provided username
         * @param {AuthMethodsListReq} authMethodsListReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        authMethodsList(authMethodsListReq: AuthMethodsListReq, options?: any): AxiosPromise<AuthMethodsListRsp> {
            return localVarFp.authMethodsList(authMethodsListReq, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * AuthMethodsApi - object-oriented interface
 * @export
 * @class AuthMethodsApi
 * @extends {BaseAPI}
 */
export class AuthMethodsApi extends BaseAPI {
    /**
     * Retrieves possible authentication methods for provided username
     * @param {AuthMethodsListReq} authMethodsListReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof AuthMethodsApi
     */
    public authMethodsList(authMethodsListReq: AuthMethodsListReq, options?: RawAxiosRequestConfig) {
        return AuthMethodsApiFp(this.configuration).authMethodsList(authMethodsListReq, options).then((request) => request(this.axios, this.basePath));
    }
}



/**
 * AuthTokensApi - axios parameter creator
 * @export
 */
export const AuthTokensApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Validates auth token and returns attached user data
         * @param {AuthTokenValidateReq} authTokenValidateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        authTokenValidate: async (authTokenValidateReq: AuthTokenValidateReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'authTokenValidateReq' is not null or undefined
            assertParamExists('authTokenValidate', 'authTokenValidateReq', authTokenValidateReq)
            const localVarPath = `/v1/authTokens/validate`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(authTokenValidateReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Creates a new session token for provided user data
         * @param {SessionTokenCreateReq} sessionTokenCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        sessionTokenCreate: async (sessionTokenCreateReq: SessionTokenCreateReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'sessionTokenCreateReq' is not null or undefined
            assertParamExists('sessionTokenCreate', 'sessionTokenCreateReq', sessionTokenCreateReq)
            const localVarPath = `/v1/sessions`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(sessionTokenCreateReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Verifies session token and returns attached user data
         * @param {SessionTokenVerifyReq} sessionTokenVerifyReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        sessionTokenVerify: async (sessionTokenVerifyReq: SessionTokenVerifyReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'sessionTokenVerifyReq' is not null or undefined
            assertParamExists('sessionTokenVerify', 'sessionTokenVerifyReq', sessionTokenVerifyReq)
            const localVarPath = `/v1/sessions/verify`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(sessionTokenVerifyReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * AuthTokensApi - functional programming interface
 * @export
 */
export const AuthTokensApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = AuthTokensApiAxiosParamCreator(configuration)
    return {
        /**
         * Validates auth token and returns attached user data
         * @param {AuthTokenValidateReq} authTokenValidateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async authTokenValidate(authTokenValidateReq: AuthTokenValidateReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<AuthTokenValidateRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.authTokenValidate(authTokenValidateReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['AuthTokensApi.authTokenValidate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Creates a new session token for provided user data
         * @param {SessionTokenCreateReq} sessionTokenCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async sessionTokenCreate(sessionTokenCreateReq: SessionTokenCreateReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<SessionTokenCreateRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.sessionTokenCreate(sessionTokenCreateReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['AuthTokensApi.sessionTokenCreate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Verifies session token and returns attached user data
         * @param {SessionTokenVerifyReq} sessionTokenVerifyReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async sessionTokenVerify(sessionTokenVerifyReq: SessionTokenVerifyReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<SessionTokenVerifyRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.sessionTokenVerify(sessionTokenVerifyReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['AuthTokensApi.sessionTokenVerify']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * AuthTokensApi - factory interface
 * @export
 */
export const AuthTokensApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = AuthTokensApiFp(configuration)
    return {
        /**
         * Validates auth token and returns attached user data
         * @param {AuthTokenValidateReq} authTokenValidateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        authTokenValidate(authTokenValidateReq: AuthTokenValidateReq, options?: any): AxiosPromise<AuthTokenValidateRsp> {
            return localVarFp.authTokenValidate(authTokenValidateReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Creates a new session token for provided user data
         * @param {SessionTokenCreateReq} sessionTokenCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        sessionTokenCreate(sessionTokenCreateReq: SessionTokenCreateReq, options?: any): AxiosPromise<SessionTokenCreateRsp> {
            return localVarFp.sessionTokenCreate(sessionTokenCreateReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Verifies session token and returns attached user data
         * @param {SessionTokenVerifyReq} sessionTokenVerifyReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        sessionTokenVerify(sessionTokenVerifyReq: SessionTokenVerifyReq, options?: any): AxiosPromise<SessionTokenVerifyRsp> {
            return localVarFp.sessionTokenVerify(sessionTokenVerifyReq, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * AuthTokensApi - object-oriented interface
 * @export
 * @class AuthTokensApi
 * @extends {BaseAPI}
 */
export class AuthTokensApi extends BaseAPI {
    /**
     * Validates auth token and returns attached user data
     * @param {AuthTokenValidateReq} authTokenValidateReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof AuthTokensApi
     */
    public authTokenValidate(authTokenValidateReq: AuthTokenValidateReq, options?: RawAxiosRequestConfig) {
        return AuthTokensApiFp(this.configuration).authTokenValidate(authTokenValidateReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Creates a new session token for provided user data
     * @param {SessionTokenCreateReq} sessionTokenCreateReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof AuthTokensApi
     */
    public sessionTokenCreate(sessionTokenCreateReq: SessionTokenCreateReq, options?: RawAxiosRequestConfig) {
        return AuthTokensApiFp(this.configuration).sessionTokenCreate(sessionTokenCreateReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Verifies session token and returns attached user data
     * @param {SessionTokenVerifyReq} sessionTokenVerifyReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof AuthTokensApi
     */
    public sessionTokenVerify(sessionTokenVerifyReq: SessionTokenVerifyReq, options?: RawAxiosRequestConfig) {
        return AuthTokensApiFp(this.configuration).sessionTokenVerify(sessionTokenVerifyReq, options).then((request) => request(this.axios, this.basePath));
    }
}



/**
 * EmailMagicLinksApi - axios parameter creator
 * @export
 */
export const EmailMagicLinksApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Deletes an email magic link
         * @param {string} emailLinkID ID of email magic link
         * @param {EmailLinksDeleteReq} [emailLinksDeleteReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        emailLinkDelete: async (emailLinkID: string, emailLinksDeleteReq?: EmailLinksDeleteReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'emailLinkID' is not null or undefined
            assertParamExists('emailLinkDelete', 'emailLinkID', emailLinkID)
            const localVarPath = `/v1/emailLinks/{emailLinkID}`
                .replace(`{${"emailLinkID"}}`, encodeURIComponent(String(emailLinkID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'DELETE', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(emailLinksDeleteReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Get an email magic link only one time after confirmed
         * @param {string} emailLinkID ID of email magic link
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        emailLinkGet: async (emailLinkID: string, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'emailLinkID' is not null or undefined
            assertParamExists('emailLinkGet', 'emailLinkID', emailLinkID)
            const localVarPath = `/v1/emailLinks/{emailLinkID}`
                .replace(`{${"emailLinkID"}}`, encodeURIComponent(String(emailLinkID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Creates email magic link and sends it to given email address
         * @param {EmailLinkSendReq} emailLinkSendReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        emailLinkSend: async (emailLinkSendReq: EmailLinkSendReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'emailLinkSendReq' is not null or undefined
            assertParamExists('emailLinkSend', 'emailLinkSendReq', emailLinkSendReq)
            const localVarPath = `/v1/emailLinks`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(emailLinkSendReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Validates email magic link token
         * @param {string} emailLinkID ID of email magic link
         * @param {EmailLinksValidateReq} emailLinksValidateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        emailLinkValidate: async (emailLinkID: string, emailLinksValidateReq: EmailLinksValidateReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'emailLinkID' is not null or undefined
            assertParamExists('emailLinkValidate', 'emailLinkID', emailLinkID)
            // verify required parameter 'emailLinksValidateReq' is not null or undefined
            assertParamExists('emailLinkValidate', 'emailLinksValidateReq', emailLinksValidateReq)
            const localVarPath = `/v1/emailLinks/{emailLinkID}/validate`
                .replace(`{${"emailLinkID"}}`, encodeURIComponent(String(emailLinkID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'PUT', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(emailLinksValidateReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * EmailMagicLinksApi - functional programming interface
 * @export
 */
export const EmailMagicLinksApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = EmailMagicLinksApiAxiosParamCreator(configuration)
    return {
        /**
         * Deletes an email magic link
         * @param {string} emailLinkID ID of email magic link
         * @param {EmailLinksDeleteReq} [emailLinksDeleteReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async emailLinkDelete(emailLinkID: string, emailLinksDeleteReq?: EmailLinksDeleteReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<EmailLinkValidateRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.emailLinkDelete(emailLinkID, emailLinksDeleteReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['EmailMagicLinksApi.emailLinkDelete']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Get an email magic link only one time after confirmed
         * @param {string} emailLinkID ID of email magic link
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async emailLinkGet(emailLinkID: string, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<EmailLinkGetRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.emailLinkGet(emailLinkID, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['EmailMagicLinksApi.emailLinkGet']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Creates email magic link and sends it to given email address
         * @param {EmailLinkSendReq} emailLinkSendReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async emailLinkSend(emailLinkSendReq: EmailLinkSendReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<EmailLinkSendRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.emailLinkSend(emailLinkSendReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['EmailMagicLinksApi.emailLinkSend']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Validates email magic link token
         * @param {string} emailLinkID ID of email magic link
         * @param {EmailLinksValidateReq} emailLinksValidateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async emailLinkValidate(emailLinkID: string, emailLinksValidateReq: EmailLinksValidateReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<EmailLinkValidateRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.emailLinkValidate(emailLinkID, emailLinksValidateReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['EmailMagicLinksApi.emailLinkValidate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * EmailMagicLinksApi - factory interface
 * @export
 */
export const EmailMagicLinksApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = EmailMagicLinksApiFp(configuration)
    return {
        /**
         * Deletes an email magic link
         * @param {string} emailLinkID ID of email magic link
         * @param {EmailLinksDeleteReq} [emailLinksDeleteReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        emailLinkDelete(emailLinkID: string, emailLinksDeleteReq?: EmailLinksDeleteReq, options?: any): AxiosPromise<EmailLinkValidateRsp> {
            return localVarFp.emailLinkDelete(emailLinkID, emailLinksDeleteReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Get an email magic link only one time after confirmed
         * @param {string} emailLinkID ID of email magic link
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        emailLinkGet(emailLinkID: string, options?: any): AxiosPromise<EmailLinkGetRsp> {
            return localVarFp.emailLinkGet(emailLinkID, options).then((request) => request(axios, basePath));
        },
        /**
         * Creates email magic link and sends it to given email address
         * @param {EmailLinkSendReq} emailLinkSendReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        emailLinkSend(emailLinkSendReq: EmailLinkSendReq, options?: any): AxiosPromise<EmailLinkSendRsp> {
            return localVarFp.emailLinkSend(emailLinkSendReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Validates email magic link token
         * @param {string} emailLinkID ID of email magic link
         * @param {EmailLinksValidateReq} emailLinksValidateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        emailLinkValidate(emailLinkID: string, emailLinksValidateReq: EmailLinksValidateReq, options?: any): AxiosPromise<EmailLinkValidateRsp> {
            return localVarFp.emailLinkValidate(emailLinkID, emailLinksValidateReq, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * EmailMagicLinksApi - object-oriented interface
 * @export
 * @class EmailMagicLinksApi
 * @extends {BaseAPI}
 */
export class EmailMagicLinksApi extends BaseAPI {
    /**
     * Deletes an email magic link
     * @param {string} emailLinkID ID of email magic link
     * @param {EmailLinksDeleteReq} [emailLinksDeleteReq] 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof EmailMagicLinksApi
     */
    public emailLinkDelete(emailLinkID: string, emailLinksDeleteReq?: EmailLinksDeleteReq, options?: RawAxiosRequestConfig) {
        return EmailMagicLinksApiFp(this.configuration).emailLinkDelete(emailLinkID, emailLinksDeleteReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Get an email magic link only one time after confirmed
     * @param {string} emailLinkID ID of email magic link
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof EmailMagicLinksApi
     */
    public emailLinkGet(emailLinkID: string, options?: RawAxiosRequestConfig) {
        return EmailMagicLinksApiFp(this.configuration).emailLinkGet(emailLinkID, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Creates email magic link and sends it to given email address
     * @param {EmailLinkSendReq} emailLinkSendReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof EmailMagicLinksApi
     */
    public emailLinkSend(emailLinkSendReq: EmailLinkSendReq, options?: RawAxiosRequestConfig) {
        return EmailMagicLinksApiFp(this.configuration).emailLinkSend(emailLinkSendReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Validates email magic link token
     * @param {string} emailLinkID ID of email magic link
     * @param {EmailLinksValidateReq} emailLinksValidateReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof EmailMagicLinksApi
     */
    public emailLinkValidate(emailLinkID: string, emailLinksValidateReq: EmailLinksValidateReq, options?: RawAxiosRequestConfig) {
        return EmailMagicLinksApiFp(this.configuration).emailLinkValidate(emailLinkID, emailLinksValidateReq, options).then((request) => request(this.axios, this.basePath));
    }
}



/**
 * EmailOTPApi - axios parameter creator
 * @export
 */
export const EmailOTPApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Get an email OTP only one time after confirmed
         * @param {string} emailCodeID ID of email OTP
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        emailCodeGet: async (emailCodeID: string, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'emailCodeID' is not null or undefined
            assertParamExists('emailCodeGet', 'emailCodeID', emailCodeID)
            const localVarPath = `/v1/emailCodes/{emailCodeID}`
                .replace(`{${"emailCodeID"}}`, encodeURIComponent(String(emailCodeID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Creates email code and sends it to given email address
         * @param {EmailCodeSendReq} emailCodeSendReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        emailCodeSend: async (emailCodeSendReq: EmailCodeSendReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'emailCodeSendReq' is not null or undefined
            assertParamExists('emailCodeSend', 'emailCodeSendReq', emailCodeSendReq)
            const localVarPath = `/v1/emailCodes`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(emailCodeSendReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Validates email code
         * @param {string} emailCodeID ID of email OTP
         * @param {EmailCodeValidateReq} emailCodeValidateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        emailCodeValidate: async (emailCodeID: string, emailCodeValidateReq: EmailCodeValidateReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'emailCodeID' is not null or undefined
            assertParamExists('emailCodeValidate', 'emailCodeID', emailCodeID)
            // verify required parameter 'emailCodeValidateReq' is not null or undefined
            assertParamExists('emailCodeValidate', 'emailCodeValidateReq', emailCodeValidateReq)
            const localVarPath = `/v1/emailCodes/{emailCodeID}/validate`
                .replace(`{${"emailCodeID"}}`, encodeURIComponent(String(emailCodeID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'PUT', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(emailCodeValidateReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * EmailOTPApi - functional programming interface
 * @export
 */
export const EmailOTPApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = EmailOTPApiAxiosParamCreator(configuration)
    return {
        /**
         * Get an email OTP only one time after confirmed
         * @param {string} emailCodeID ID of email OTP
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async emailCodeGet(emailCodeID: string, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<EmailCodeGetRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.emailCodeGet(emailCodeID, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['EmailOTPApi.emailCodeGet']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Creates email code and sends it to given email address
         * @param {EmailCodeSendReq} emailCodeSendReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async emailCodeSend(emailCodeSendReq: EmailCodeSendReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<EmailCodeSendRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.emailCodeSend(emailCodeSendReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['EmailOTPApi.emailCodeSend']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Validates email code
         * @param {string} emailCodeID ID of email OTP
         * @param {EmailCodeValidateReq} emailCodeValidateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async emailCodeValidate(emailCodeID: string, emailCodeValidateReq: EmailCodeValidateReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<EmailCodeValidateRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.emailCodeValidate(emailCodeID, emailCodeValidateReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['EmailOTPApi.emailCodeValidate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * EmailOTPApi - factory interface
 * @export
 */
export const EmailOTPApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = EmailOTPApiFp(configuration)
    return {
        /**
         * Get an email OTP only one time after confirmed
         * @param {string} emailCodeID ID of email OTP
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        emailCodeGet(emailCodeID: string, options?: any): AxiosPromise<EmailCodeGetRsp> {
            return localVarFp.emailCodeGet(emailCodeID, options).then((request) => request(axios, basePath));
        },
        /**
         * Creates email code and sends it to given email address
         * @param {EmailCodeSendReq} emailCodeSendReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        emailCodeSend(emailCodeSendReq: EmailCodeSendReq, options?: any): AxiosPromise<EmailCodeSendRsp> {
            return localVarFp.emailCodeSend(emailCodeSendReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Validates email code
         * @param {string} emailCodeID ID of email OTP
         * @param {EmailCodeValidateReq} emailCodeValidateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        emailCodeValidate(emailCodeID: string, emailCodeValidateReq: EmailCodeValidateReq, options?: any): AxiosPromise<EmailCodeValidateRsp> {
            return localVarFp.emailCodeValidate(emailCodeID, emailCodeValidateReq, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * EmailOTPApi - object-oriented interface
 * @export
 * @class EmailOTPApi
 * @extends {BaseAPI}
 */
export class EmailOTPApi extends BaseAPI {
    /**
     * Get an email OTP only one time after confirmed
     * @param {string} emailCodeID ID of email OTP
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof EmailOTPApi
     */
    public emailCodeGet(emailCodeID: string, options?: RawAxiosRequestConfig) {
        return EmailOTPApiFp(this.configuration).emailCodeGet(emailCodeID, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Creates email code and sends it to given email address
     * @param {EmailCodeSendReq} emailCodeSendReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof EmailOTPApi
     */
    public emailCodeSend(emailCodeSendReq: EmailCodeSendReq, options?: RawAxiosRequestConfig) {
        return EmailOTPApiFp(this.configuration).emailCodeSend(emailCodeSendReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Validates email code
     * @param {string} emailCodeID ID of email OTP
     * @param {EmailCodeValidateReq} emailCodeValidateReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof EmailOTPApi
     */
    public emailCodeValidate(emailCodeID: string, emailCodeValidateReq: EmailCodeValidateReq, options?: RawAxiosRequestConfig) {
        return EmailOTPApiFp(this.configuration).emailCodeValidate(emailCodeID, emailCodeValidateReq, options).then((request) => request(this.axios, this.basePath));
    }
}



/**
 * EmailTemplatesApi - axios parameter creator
 * @export
 */
export const EmailTemplatesApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Creates a new email template
         * @param {EmailTemplateCreateReq} emailTemplateCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        emailTemplateCreate: async (emailTemplateCreateReq: EmailTemplateCreateReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'emailTemplateCreateReq' is not null or undefined
            assertParamExists('emailTemplateCreate', 'emailTemplateCreateReq', emailTemplateCreateReq)
            const localVarPath = `/v1/emailTemplates`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(emailTemplateCreateReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Deletes an email template
         * @param {string} emailTemplateID ID of email template
         * @param {EmailTemplateDeleteReq} emailTemplateDeleteReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        emailTemplateDelete: async (emailTemplateID: string, emailTemplateDeleteReq: EmailTemplateDeleteReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'emailTemplateID' is not null or undefined
            assertParamExists('emailTemplateDelete', 'emailTemplateID', emailTemplateID)
            // verify required parameter 'emailTemplateDeleteReq' is not null or undefined
            assertParamExists('emailTemplateDelete', 'emailTemplateDeleteReq', emailTemplateDeleteReq)
            const localVarPath = `/v1/emailTemplates/{emailTemplateID}`
                .replace(`{${"emailTemplateID"}}`, encodeURIComponent(String(emailTemplateID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'DELETE', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(emailTemplateDeleteReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * EmailTemplatesApi - functional programming interface
 * @export
 */
export const EmailTemplatesApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = EmailTemplatesApiAxiosParamCreator(configuration)
    return {
        /**
         * Creates a new email template
         * @param {EmailTemplateCreateReq} emailTemplateCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async emailTemplateCreate(emailTemplateCreateReq: EmailTemplateCreateReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<EmailTemplateCreateRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.emailTemplateCreate(emailTemplateCreateReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['EmailTemplatesApi.emailTemplateCreate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Deletes an email template
         * @param {string} emailTemplateID ID of email template
         * @param {EmailTemplateDeleteReq} emailTemplateDeleteReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async emailTemplateDelete(emailTemplateID: string, emailTemplateDeleteReq: EmailTemplateDeleteReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<GenericRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.emailTemplateDelete(emailTemplateID, emailTemplateDeleteReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['EmailTemplatesApi.emailTemplateDelete']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * EmailTemplatesApi - factory interface
 * @export
 */
export const EmailTemplatesApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = EmailTemplatesApiFp(configuration)
    return {
        /**
         * Creates a new email template
         * @param {EmailTemplateCreateReq} emailTemplateCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        emailTemplateCreate(emailTemplateCreateReq: EmailTemplateCreateReq, options?: any): AxiosPromise<EmailTemplateCreateRsp> {
            return localVarFp.emailTemplateCreate(emailTemplateCreateReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Deletes an email template
         * @param {string} emailTemplateID ID of email template
         * @param {EmailTemplateDeleteReq} emailTemplateDeleteReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        emailTemplateDelete(emailTemplateID: string, emailTemplateDeleteReq: EmailTemplateDeleteReq, options?: any): AxiosPromise<GenericRsp> {
            return localVarFp.emailTemplateDelete(emailTemplateID, emailTemplateDeleteReq, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * EmailTemplatesApi - object-oriented interface
 * @export
 * @class EmailTemplatesApi
 * @extends {BaseAPI}
 */
export class EmailTemplatesApi extends BaseAPI {
    /**
     * Creates a new email template
     * @param {EmailTemplateCreateReq} emailTemplateCreateReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof EmailTemplatesApi
     */
    public emailTemplateCreate(emailTemplateCreateReq: EmailTemplateCreateReq, options?: RawAxiosRequestConfig) {
        return EmailTemplatesApiFp(this.configuration).emailTemplateCreate(emailTemplateCreateReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Deletes an email template
     * @param {string} emailTemplateID ID of email template
     * @param {EmailTemplateDeleteReq} emailTemplateDeleteReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof EmailTemplatesApi
     */
    public emailTemplateDelete(emailTemplateID: string, emailTemplateDeleteReq: EmailTemplateDeleteReq, options?: RawAxiosRequestConfig) {
        return EmailTemplatesApiFp(this.configuration).emailTemplateDelete(emailTemplateID, emailTemplateDeleteReq, options).then((request) => request(this.axios, this.basePath));
    }
}



/**
 * ExamplesApi - axios parameter creator
 * @export
 */
export const ExamplesApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Retrieves file containing the named example project
         * @param {ExampleGetFileNameEnum} fileName Name of the example to get
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        exampleGet: async (fileName: ExampleGetFileNameEnum, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'fileName' is not null or undefined
            assertParamExists('exampleGet', 'fileName', fileName)
            const localVarPath = `/v1/examples/{fileName}`
                .replace(`{${"fileName"}}`, encodeURIComponent(String(fileName)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * ExamplesApi - functional programming interface
 * @export
 */
export const ExamplesApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = ExamplesApiAxiosParamCreator(configuration)
    return {
        /**
         * Retrieves file containing the named example project
         * @param {ExampleGetFileNameEnum} fileName Name of the example to get
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async exampleGet(fileName: ExampleGetFileNameEnum, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<ExampleGetRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.exampleGet(fileName, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['ExamplesApi.exampleGet']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * ExamplesApi - factory interface
 * @export
 */
export const ExamplesApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = ExamplesApiFp(configuration)
    return {
        /**
         * Retrieves file containing the named example project
         * @param {ExampleGetFileNameEnum} fileName Name of the example to get
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        exampleGet(fileName: ExampleGetFileNameEnum, options?: any): AxiosPromise<ExampleGetRsp> {
            return localVarFp.exampleGet(fileName, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * ExamplesApi - object-oriented interface
 * @export
 * @class ExamplesApi
 * @extends {BaseAPI}
 */
export class ExamplesApi extends BaseAPI {
    /**
     * Retrieves file containing the named example project
     * @param {ExampleGetFileNameEnum} fileName Name of the example to get
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof ExamplesApi
     */
    public exampleGet(fileName: ExampleGetFileNameEnum, options?: RawAxiosRequestConfig) {
        return ExamplesApiFp(this.configuration).exampleGet(fileName, options).then((request) => request(this.axios, this.basePath));
    }
}

/**
 * @export
 */
export const ExampleGetFileNameEnum = {
    Zip: 'webcomponent-php-symfony.zip',
    TarGz: 'webcomponent-php-symfony.tar.gz'
} as const;
export type ExampleGetFileNameEnum = typeof ExampleGetFileNameEnum[keyof typeof ExampleGetFileNameEnum];


/**
 * IOSAppConfigApi - axios parameter creator
 * @export
 */
export const IOSAppConfigApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Creates a new iOS App Config
         * @param {IOSAppConfigSaveReq} iOSAppConfigSaveReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        iOSAppConfigCreate: async (iOSAppConfigSaveReq: IOSAppConfigSaveReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'iOSAppConfigSaveReq' is not null or undefined
            assertParamExists('iOSAppConfigCreate', 'iOSAppConfigSaveReq', iOSAppConfigSaveReq)
            const localVarPath = `/v1/iosappconfig`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(iOSAppConfigSaveReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Deletes an iOS App Config
         * @param {string} iosAppConfigID iOS App Config ID from create
         * @param {IOSAppConfigDeleteReq} [iOSAppConfigDeleteReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        iOSAppConfigDelete: async (iosAppConfigID: string, iOSAppConfigDeleteReq?: IOSAppConfigDeleteReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'iosAppConfigID' is not null or undefined
            assertParamExists('iOSAppConfigDelete', 'iosAppConfigID', iosAppConfigID)
            const localVarPath = `/v1/iosappconfig/{iosAppConfigID}`
                .replace(`{${"iosAppConfigID"}}`, encodeURIComponent(String(iosAppConfigID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'DELETE', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(iOSAppConfigDeleteReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Lists iOS App Configs for a project
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        iOSAppConfigGet: async (options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/v1/iosappconfig`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Updates an iOS app config by id
         * @param {string} iosAppConfigID ID from iOS config create
         * @param {IOSAppConfigUpdateReq} [iOSAppConfigUpdateReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        iOSAppConfigPut: async (iosAppConfigID: string, iOSAppConfigUpdateReq?: IOSAppConfigUpdateReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'iosAppConfigID' is not null or undefined
            assertParamExists('iOSAppConfigPut', 'iosAppConfigID', iosAppConfigID)
            const localVarPath = `/v1/iosappconfig/{iosAppConfigID}`
                .replace(`{${"iosAppConfigID"}}`, encodeURIComponent(String(iosAppConfigID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'PUT', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(iOSAppConfigUpdateReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * IOSAppConfigApi - functional programming interface
 * @export
 */
export const IOSAppConfigApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = IOSAppConfigApiAxiosParamCreator(configuration)
    return {
        /**
         * Creates a new iOS App Config
         * @param {IOSAppConfigSaveReq} iOSAppConfigSaveReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async iOSAppConfigCreate(iOSAppConfigSaveReq: IOSAppConfigSaveReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<IOSAppConfigSaveRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.iOSAppConfigCreate(iOSAppConfigSaveReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['IOSAppConfigApi.iOSAppConfigCreate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Deletes an iOS App Config
         * @param {string} iosAppConfigID iOS App Config ID from create
         * @param {IOSAppConfigDeleteReq} [iOSAppConfigDeleteReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async iOSAppConfigDelete(iosAppConfigID: string, iOSAppConfigDeleteReq?: IOSAppConfigDeleteReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<GenericRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.iOSAppConfigDelete(iosAppConfigID, iOSAppConfigDeleteReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['IOSAppConfigApi.iOSAppConfigDelete']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Lists iOS App Configs for a project
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async iOSAppConfigGet(options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<IOSAppConfigListRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.iOSAppConfigGet(options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['IOSAppConfigApi.iOSAppConfigGet']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Updates an iOS app config by id
         * @param {string} iosAppConfigID ID from iOS config create
         * @param {IOSAppConfigUpdateReq} [iOSAppConfigUpdateReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async iOSAppConfigPut(iosAppConfigID: string, iOSAppConfigUpdateReq?: IOSAppConfigUpdateReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<IOSAppConfigUpdateRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.iOSAppConfigPut(iosAppConfigID, iOSAppConfigUpdateReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['IOSAppConfigApi.iOSAppConfigPut']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * IOSAppConfigApi - factory interface
 * @export
 */
export const IOSAppConfigApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = IOSAppConfigApiFp(configuration)
    return {
        /**
         * Creates a new iOS App Config
         * @param {IOSAppConfigSaveReq} iOSAppConfigSaveReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        iOSAppConfigCreate(iOSAppConfigSaveReq: IOSAppConfigSaveReq, options?: any): AxiosPromise<IOSAppConfigSaveRsp> {
            return localVarFp.iOSAppConfigCreate(iOSAppConfigSaveReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Deletes an iOS App Config
         * @param {string} iosAppConfigID iOS App Config ID from create
         * @param {IOSAppConfigDeleteReq} [iOSAppConfigDeleteReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        iOSAppConfigDelete(iosAppConfigID: string, iOSAppConfigDeleteReq?: IOSAppConfigDeleteReq, options?: any): AxiosPromise<GenericRsp> {
            return localVarFp.iOSAppConfigDelete(iosAppConfigID, iOSAppConfigDeleteReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Lists iOS App Configs for a project
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        iOSAppConfigGet(options?: any): AxiosPromise<IOSAppConfigListRsp> {
            return localVarFp.iOSAppConfigGet(options).then((request) => request(axios, basePath));
        },
        /**
         * Updates an iOS app config by id
         * @param {string} iosAppConfigID ID from iOS config create
         * @param {IOSAppConfigUpdateReq} [iOSAppConfigUpdateReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        iOSAppConfigPut(iosAppConfigID: string, iOSAppConfigUpdateReq?: IOSAppConfigUpdateReq, options?: any): AxiosPromise<IOSAppConfigUpdateRsp> {
            return localVarFp.iOSAppConfigPut(iosAppConfigID, iOSAppConfigUpdateReq, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * IOSAppConfigApi - object-oriented interface
 * @export
 * @class IOSAppConfigApi
 * @extends {BaseAPI}
 */
export class IOSAppConfigApi extends BaseAPI {
    /**
     * Creates a new iOS App Config
     * @param {IOSAppConfigSaveReq} iOSAppConfigSaveReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof IOSAppConfigApi
     */
    public iOSAppConfigCreate(iOSAppConfigSaveReq: IOSAppConfigSaveReq, options?: RawAxiosRequestConfig) {
        return IOSAppConfigApiFp(this.configuration).iOSAppConfigCreate(iOSAppConfigSaveReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Deletes an iOS App Config
     * @param {string} iosAppConfigID iOS App Config ID from create
     * @param {IOSAppConfigDeleteReq} [iOSAppConfigDeleteReq] 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof IOSAppConfigApi
     */
    public iOSAppConfigDelete(iosAppConfigID: string, iOSAppConfigDeleteReq?: IOSAppConfigDeleteReq, options?: RawAxiosRequestConfig) {
        return IOSAppConfigApiFp(this.configuration).iOSAppConfigDelete(iosAppConfigID, iOSAppConfigDeleteReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Lists iOS App Configs for a project
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof IOSAppConfigApi
     */
    public iOSAppConfigGet(options?: RawAxiosRequestConfig) {
        return IOSAppConfigApiFp(this.configuration).iOSAppConfigGet(options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Updates an iOS app config by id
     * @param {string} iosAppConfigID ID from iOS config create
     * @param {IOSAppConfigUpdateReq} [iOSAppConfigUpdateReq] 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof IOSAppConfigApi
     */
    public iOSAppConfigPut(iosAppConfigID: string, iOSAppConfigUpdateReq?: IOSAppConfigUpdateReq, options?: RawAxiosRequestConfig) {
        return IOSAppConfigApiFp(this.configuration).iOSAppConfigPut(iosAppConfigID, iOSAppConfigUpdateReq, options).then((request) => request(this.axios, this.basePath));
    }
}



/**
 * LongSessionsApi - axios parameter creator
 * @export
 */
export const LongSessionsApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Get a long session by sessionID
         * @param {string} sessionID ID of session
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        longSessionGet: async (sessionID: string, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'sessionID' is not null or undefined
            assertParamExists('longSessionGet', 'sessionID', sessionID)
            const localVarPath = `/v1/longSessions/{sessionID}`
                .replace(`{${"sessionID"}}`, encodeURIComponent(String(sessionID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Lists long sessions by provided filters
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        longSessionList: async (remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/v1/longSessions`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }

            if (sort !== undefined) {
                localVarQueryParameter['sort'] = sort;
            }

            if (filter) {
                localVarQueryParameter['filter[]'] = filter;
            }

            if (page !== undefined) {
                localVarQueryParameter['page'] = page;
            }

            if (pageSize !== undefined) {
                localVarQueryParameter['pageSize'] = pageSize;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Revokes an active long session by sessionID
         * @param {string} sessionID ID of session
         * @param {LongSessionRevokeReq} [longSessionRevokeReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        longSessionRevoke: async (sessionID: string, longSessionRevokeReq?: LongSessionRevokeReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'sessionID' is not null or undefined
            assertParamExists('longSessionRevoke', 'sessionID', sessionID)
            const localVarPath = `/v1/longSessions/{sessionID}/revoke`
                .replace(`{${"sessionID"}}`, encodeURIComponent(String(sessionID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'PUT', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(longSessionRevokeReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * LongSessionsApi - functional programming interface
 * @export
 */
export const LongSessionsApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = LongSessionsApiAxiosParamCreator(configuration)
    return {
        /**
         * Get a long session by sessionID
         * @param {string} sessionID ID of session
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async longSessionGet(sessionID: string, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<LongSessionGetRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.longSessionGet(sessionID, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['LongSessionsApi.longSessionGet']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Lists long sessions by provided filters
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async longSessionList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<LongSessionListRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.longSessionList(remoteAddress, userAgent, sort, filter, page, pageSize, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['LongSessionsApi.longSessionList']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Revokes an active long session by sessionID
         * @param {string} sessionID ID of session
         * @param {LongSessionRevokeReq} [longSessionRevokeReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async longSessionRevoke(sessionID: string, longSessionRevokeReq?: LongSessionRevokeReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<GenericRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.longSessionRevoke(sessionID, longSessionRevokeReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['LongSessionsApi.longSessionRevoke']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * LongSessionsApi - factory interface
 * @export
 */
export const LongSessionsApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = LongSessionsApiFp(configuration)
    return {
        /**
         * Get a long session by sessionID
         * @param {string} sessionID ID of session
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        longSessionGet(sessionID: string, options?: any): AxiosPromise<LongSessionGetRsp> {
            return localVarFp.longSessionGet(sessionID, options).then((request) => request(axios, basePath));
        },
        /**
         * Lists long sessions by provided filters
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        longSessionList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: any): AxiosPromise<LongSessionListRsp> {
            return localVarFp.longSessionList(remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(axios, basePath));
        },
        /**
         * Revokes an active long session by sessionID
         * @param {string} sessionID ID of session
         * @param {LongSessionRevokeReq} [longSessionRevokeReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        longSessionRevoke(sessionID: string, longSessionRevokeReq?: LongSessionRevokeReq, options?: any): AxiosPromise<GenericRsp> {
            return localVarFp.longSessionRevoke(sessionID, longSessionRevokeReq, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * LongSessionsApi - object-oriented interface
 * @export
 * @class LongSessionsApi
 * @extends {BaseAPI}
 */
export class LongSessionsApi extends BaseAPI {
    /**
     * Get a long session by sessionID
     * @param {string} sessionID ID of session
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof LongSessionsApi
     */
    public longSessionGet(sessionID: string, options?: RawAxiosRequestConfig) {
        return LongSessionsApiFp(this.configuration).longSessionGet(sessionID, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Lists long sessions by provided filters
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {string} [sort] Field sorting
     * @param {Array<string>} [filter] Field filtering
     * @param {number} [page] Page number
     * @param {number} [pageSize] Number of items per page
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof LongSessionsApi
     */
    public longSessionList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig) {
        return LongSessionsApiFp(this.configuration).longSessionList(remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Revokes an active long session by sessionID
     * @param {string} sessionID ID of session
     * @param {LongSessionRevokeReq} [longSessionRevokeReq] 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof LongSessionsApi
     */
    public longSessionRevoke(sessionID: string, longSessionRevokeReq?: LongSessionRevokeReq, options?: RawAxiosRequestConfig) {
        return LongSessionsApiFp(this.configuration).longSessionRevoke(sessionID, longSessionRevokeReq, options).then((request) => request(this.axios, this.basePath));
    }
}



/**
 * PasskeysBiometricsApi - axios parameter creator
 * @export
 */
export const PasskeysBiometricsApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Starts association token flow for Passkeys (Biometrics)
         * @param {WebAuthnAssociateStartReq} webAuthnAssociateStartReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnAssociateStart: async (webAuthnAssociateStartReq: WebAuthnAssociateStartReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'webAuthnAssociateStartReq' is not null or undefined
            assertParamExists('webAuthnAssociateStart', 'webAuthnAssociateStartReq', webAuthnAssociateStartReq)
            const localVarPath = `/v1/webauthn/associate/start`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(webAuthnAssociateStartReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Completes authentication of a user for Passkeys (Biometrics)
         * @param {WebAuthnFinishReq} webAuthnFinishReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnAuthenticateFinish: async (webAuthnFinishReq: WebAuthnFinishReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'webAuthnFinishReq' is not null or undefined
            assertParamExists('webAuthnAuthenticateFinish', 'webAuthnFinishReq', webAuthnFinishReq)
            const localVarPath = `/v1/webauthn/authenticate/finish`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(webAuthnFinishReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Starts authentication of a user for Passkeys (Biometrics)
         * @param {WebAuthnAuthenticateStartReq} webAuthnAuthenticateStartReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnAuthenticateStart: async (webAuthnAuthenticateStartReq: WebAuthnAuthenticateStartReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'webAuthnAuthenticateStartReq' is not null or undefined
            assertParamExists('webAuthnAuthenticateStart', 'webAuthnAuthenticateStartReq', webAuthnAuthenticateStartReq)
            const localVarPath = `/v1/webauthn/authenticate/start`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(webAuthnAuthenticateStartReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Update authenticator
         * @param {string} authenticatorID ID of authenticator
         * @param {WebAuthnAuthenticatorUpdateReq} webAuthnAuthenticatorUpdateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnAuthenticatorUpdate: async (authenticatorID: string, webAuthnAuthenticatorUpdateReq: WebAuthnAuthenticatorUpdateReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'authenticatorID' is not null or undefined
            assertParamExists('webAuthnAuthenticatorUpdate', 'authenticatorID', authenticatorID)
            // verify required parameter 'webAuthnAuthenticatorUpdateReq' is not null or undefined
            assertParamExists('webAuthnAuthenticatorUpdate', 'webAuthnAuthenticatorUpdateReq', webAuthnAuthenticatorUpdateReq)
            const localVarPath = `/v1/webauthn/authenticator/{authenticatorID}`
                .replace(`{${"authenticatorID"}}`, encodeURIComponent(String(authenticatorID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'PUT', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(webAuthnAuthenticatorUpdateReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Delete credential
         * @param {string} userID ID of user
         * @param {string} credentialID ID of credential
         * @param {EmptyReq} emptyReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnCredentialDelete: async (userID: string, credentialID: string, emptyReq: EmptyReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'userID' is not null or undefined
            assertParamExists('webAuthnCredentialDelete', 'userID', userID)
            // verify required parameter 'credentialID' is not null or undefined
            assertParamExists('webAuthnCredentialDelete', 'credentialID', credentialID)
            // verify required parameter 'emptyReq' is not null or undefined
            assertParamExists('webAuthnCredentialDelete', 'emptyReq', emptyReq)
            const localVarPath = `/v1/users/{userID}/credentials/{credentialID}`
                .replace(`{${"userID"}}`, encodeURIComponent(String(userID)))
                .replace(`{${"credentialID"}}`, encodeURIComponent(String(credentialID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'DELETE', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(emptyReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Checks if active webauthn credential exists for provided user and device
         * @param {WebAuthnCredentialExistsReq} webAuthnCredentialExistsReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnCredentialExists: async (webAuthnCredentialExistsReq: WebAuthnCredentialExistsReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'webAuthnCredentialExistsReq' is not null or undefined
            assertParamExists('webAuthnCredentialExists', 'webAuthnCredentialExistsReq', webAuthnCredentialExistsReq)
            const localVarPath = `/v1/webauthn/credential/exists`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(webAuthnCredentialExistsReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Lists webauthn credentials users
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnCredentialList: async (remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/v1/webauthn/credential`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }

            if (sort !== undefined) {
                localVarQueryParameter['sort'] = sort;
            }

            if (filter) {
                localVarQueryParameter['filter[]'] = filter;
            }

            if (page !== undefined) {
                localVarQueryParameter['page'] = page;
            }

            if (pageSize !== undefined) {
                localVarQueryParameter['pageSize'] = pageSize;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Update credential
         * @param {string} credentialID ID of credential
         * @param {WebAuthnCredentialReq} webAuthnCredentialReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnCredentialUpdate: async (credentialID: string, webAuthnCredentialReq: WebAuthnCredentialReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'credentialID' is not null or undefined
            assertParamExists('webAuthnCredentialUpdate', 'credentialID', credentialID)
            // verify required parameter 'webAuthnCredentialReq' is not null or undefined
            assertParamExists('webAuthnCredentialUpdate', 'webAuthnCredentialReq', webAuthnCredentialReq)
            const localVarPath = `/v1/webauthn/credential/{credentialID}`
                .replace(`{${"credentialID"}}`, encodeURIComponent(String(credentialID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'PUT', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(webAuthnCredentialReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Starts mediation for Passkeys (Biometrics)
         * @param {WebAuthnMediationStartReq} webAuthnMediationStartReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnMediationStart: async (webAuthnMediationStartReq: WebAuthnMediationStartReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'webAuthnMediationStartReq' is not null or undefined
            assertParamExists('webAuthnMediationStart', 'webAuthnMediationStartReq', webAuthnMediationStartReq)
            const localVarPath = `/v1/webauthn/mediation/start`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(webAuthnMediationStartReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Completes registration of a user for Passkeys (Biometrics)
         * @param {WebAuthnFinishReq} webAuthnFinishReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnRegisterFinish: async (webAuthnFinishReq: WebAuthnFinishReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'webAuthnFinishReq' is not null or undefined
            assertParamExists('webAuthnRegisterFinish', 'webAuthnFinishReq', webAuthnFinishReq)
            const localVarPath = `/v1/webauthn/register/finish`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(webAuthnFinishReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Starts registration of a user for Passkeys (Biometrics)
         * @param {WebAuthnRegisterStartReq} [webAuthnRegisterStartReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnRegisterStart: async (webAuthnRegisterStartReq?: WebAuthnRegisterStartReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/v1/webauthn/register/start`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(webAuthnRegisterStartReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Creates a new setting for Passkeys (Biometrics)
         * @param {WebauthnSettingCreateReq} [webauthnSettingCreateReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnSettingCreate: async (webauthnSettingCreateReq?: WebauthnSettingCreateReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/v1/webauthn/settings`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(webauthnSettingCreateReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Deletes a setting by id for Passkeys (Biometrics)
         * @param {string} settingID ID from create
         * @param {WebauthnSettingDeleteReq} [webauthnSettingDeleteReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnSettingDelete: async (settingID: string, webauthnSettingDeleteReq?: WebauthnSettingDeleteReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'settingID' is not null or undefined
            assertParamExists('webAuthnSettingDelete', 'settingID', settingID)
            const localVarPath = `/v1/webauthn/settings/{settingID}`
                .replace(`{${"settingID"}}`, encodeURIComponent(String(settingID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'DELETE', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(webauthnSettingDeleteReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Gets a setting by id for Passkeys (Biometrics)
         * @param {string} settingID ID from create
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnSettingGet: async (settingID: string, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'settingID' is not null or undefined
            assertParamExists('webAuthnSettingGet', 'settingID', settingID)
            const localVarPath = `/v1/webauthn/settings/{settingID}`
                .replace(`{${"settingID"}}`, encodeURIComponent(String(settingID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Lists all settings for Passkeys (Biometrics)
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnSettingList: async (remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/v1/webauthn/settings`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }

            if (sort !== undefined) {
                localVarQueryParameter['sort'] = sort;
            }

            if (filter) {
                localVarQueryParameter['filter[]'] = filter;
            }

            if (page !== undefined) {
                localVarQueryParameter['page'] = page;
            }

            if (pageSize !== undefined) {
                localVarQueryParameter['pageSize'] = pageSize;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Updates a setting by id for Passkeys (Biometrics)
         * @param {string} settingID ID from create
         * @param {WebauthnSettingUpdateReq} [webauthnSettingUpdateReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnSettingPut: async (settingID: string, webauthnSettingUpdateReq?: WebauthnSettingUpdateReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'settingID' is not null or undefined
            assertParamExists('webAuthnSettingPut', 'settingID', settingID)
            const localVarPath = `/v1/webauthn/settings/{settingID}`
                .replace(`{${"settingID"}}`, encodeURIComponent(String(settingID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'PUT', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(webauthnSettingUpdateReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * PasskeysBiometricsApi - functional programming interface
 * @export
 */
export const PasskeysBiometricsApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = PasskeysBiometricsApiAxiosParamCreator(configuration)
    return {
        /**
         * Starts association token flow for Passkeys (Biometrics)
         * @param {WebAuthnAssociateStartReq} webAuthnAssociateStartReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async webAuthnAssociateStart(webAuthnAssociateStartReq: WebAuthnAssociateStartReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<WebAuthnAssociateStartRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.webAuthnAssociateStart(webAuthnAssociateStartReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['PasskeysBiometricsApi.webAuthnAssociateStart']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Completes authentication of a user for Passkeys (Biometrics)
         * @param {WebAuthnFinishReq} webAuthnFinishReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async webAuthnAuthenticateFinish(webAuthnFinishReq: WebAuthnFinishReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<WebAuthnAuthenticateFinishRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.webAuthnAuthenticateFinish(webAuthnFinishReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['PasskeysBiometricsApi.webAuthnAuthenticateFinish']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Starts authentication of a user for Passkeys (Biometrics)
         * @param {WebAuthnAuthenticateStartReq} webAuthnAuthenticateStartReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async webAuthnAuthenticateStart(webAuthnAuthenticateStartReq: WebAuthnAuthenticateStartReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<WebAuthnAuthenticateStartRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.webAuthnAuthenticateStart(webAuthnAuthenticateStartReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['PasskeysBiometricsApi.webAuthnAuthenticateStart']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Update authenticator
         * @param {string} authenticatorID ID of authenticator
         * @param {WebAuthnAuthenticatorUpdateReq} webAuthnAuthenticatorUpdateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async webAuthnAuthenticatorUpdate(authenticatorID: string, webAuthnAuthenticatorUpdateReq: WebAuthnAuthenticatorUpdateReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<GenericRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.webAuthnAuthenticatorUpdate(authenticatorID, webAuthnAuthenticatorUpdateReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['PasskeysBiometricsApi.webAuthnAuthenticatorUpdate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Delete credential
         * @param {string} userID ID of user
         * @param {string} credentialID ID of credential
         * @param {EmptyReq} emptyReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async webAuthnCredentialDelete(userID: string, credentialID: string, emptyReq: EmptyReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<GenericRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.webAuthnCredentialDelete(userID, credentialID, emptyReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['PasskeysBiometricsApi.webAuthnCredentialDelete']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Checks if active webauthn credential exists for provided user and device
         * @param {WebAuthnCredentialExistsReq} webAuthnCredentialExistsReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async webAuthnCredentialExists(webAuthnCredentialExistsReq: WebAuthnCredentialExistsReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<WebAuthnCredentialExistsRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.webAuthnCredentialExists(webAuthnCredentialExistsReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['PasskeysBiometricsApi.webAuthnCredentialExists']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Lists webauthn credentials users
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async webAuthnCredentialList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<WebAuthnCredentialListRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.webAuthnCredentialList(remoteAddress, userAgent, sort, filter, page, pageSize, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['PasskeysBiometricsApi.webAuthnCredentialList']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Update credential
         * @param {string} credentialID ID of credential
         * @param {WebAuthnCredentialReq} webAuthnCredentialReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async webAuthnCredentialUpdate(credentialID: string, webAuthnCredentialReq: WebAuthnCredentialReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<WebAuthnCredentialRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.webAuthnCredentialUpdate(credentialID, webAuthnCredentialReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['PasskeysBiometricsApi.webAuthnCredentialUpdate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Starts mediation for Passkeys (Biometrics)
         * @param {WebAuthnMediationStartReq} webAuthnMediationStartReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async webAuthnMediationStart(webAuthnMediationStartReq: WebAuthnMediationStartReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<WebAuthnMediationStartRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.webAuthnMediationStart(webAuthnMediationStartReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['PasskeysBiometricsApi.webAuthnMediationStart']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Completes registration of a user for Passkeys (Biometrics)
         * @param {WebAuthnFinishReq} webAuthnFinishReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async webAuthnRegisterFinish(webAuthnFinishReq: WebAuthnFinishReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<WebAuthnRegisterFinishRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.webAuthnRegisterFinish(webAuthnFinishReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['PasskeysBiometricsApi.webAuthnRegisterFinish']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Starts registration of a user for Passkeys (Biometrics)
         * @param {WebAuthnRegisterStartReq} [webAuthnRegisterStartReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async webAuthnRegisterStart(webAuthnRegisterStartReq?: WebAuthnRegisterStartReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<WebAuthnRegisterStartRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.webAuthnRegisterStart(webAuthnRegisterStartReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['PasskeysBiometricsApi.webAuthnRegisterStart']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Creates a new setting for Passkeys (Biometrics)
         * @param {WebauthnSettingCreateReq} [webauthnSettingCreateReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async webAuthnSettingCreate(webauthnSettingCreateReq?: WebauthnSettingCreateReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<WebauthnSettingCreateRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.webAuthnSettingCreate(webauthnSettingCreateReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['PasskeysBiometricsApi.webAuthnSettingCreate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Deletes a setting by id for Passkeys (Biometrics)
         * @param {string} settingID ID from create
         * @param {WebauthnSettingDeleteReq} [webauthnSettingDeleteReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async webAuthnSettingDelete(settingID: string, webauthnSettingDeleteReq?: WebauthnSettingDeleteReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<GenericRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.webAuthnSettingDelete(settingID, webauthnSettingDeleteReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['PasskeysBiometricsApi.webAuthnSettingDelete']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Gets a setting by id for Passkeys (Biometrics)
         * @param {string} settingID ID from create
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async webAuthnSettingGet(settingID: string, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<WebauthnSettingGetRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.webAuthnSettingGet(settingID, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['PasskeysBiometricsApi.webAuthnSettingGet']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Lists all settings for Passkeys (Biometrics)
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async webAuthnSettingList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<WebauthnSettingListRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.webAuthnSettingList(remoteAddress, userAgent, sort, filter, page, pageSize, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['PasskeysBiometricsApi.webAuthnSettingList']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Updates a setting by id for Passkeys (Biometrics)
         * @param {string} settingID ID from create
         * @param {WebauthnSettingUpdateReq} [webauthnSettingUpdateReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async webAuthnSettingPut(settingID: string, webauthnSettingUpdateReq?: WebauthnSettingUpdateReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<WebauthnSettingUpdateRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.webAuthnSettingPut(settingID, webauthnSettingUpdateReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['PasskeysBiometricsApi.webAuthnSettingPut']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * PasskeysBiometricsApi - factory interface
 * @export
 */
export const PasskeysBiometricsApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = PasskeysBiometricsApiFp(configuration)
    return {
        /**
         * Starts association token flow for Passkeys (Biometrics)
         * @param {WebAuthnAssociateStartReq} webAuthnAssociateStartReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnAssociateStart(webAuthnAssociateStartReq: WebAuthnAssociateStartReq, options?: any): AxiosPromise<WebAuthnAssociateStartRsp> {
            return localVarFp.webAuthnAssociateStart(webAuthnAssociateStartReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Completes authentication of a user for Passkeys (Biometrics)
         * @param {WebAuthnFinishReq} webAuthnFinishReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnAuthenticateFinish(webAuthnFinishReq: WebAuthnFinishReq, options?: any): AxiosPromise<WebAuthnAuthenticateFinishRsp> {
            return localVarFp.webAuthnAuthenticateFinish(webAuthnFinishReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Starts authentication of a user for Passkeys (Biometrics)
         * @param {WebAuthnAuthenticateStartReq} webAuthnAuthenticateStartReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnAuthenticateStart(webAuthnAuthenticateStartReq: WebAuthnAuthenticateStartReq, options?: any): AxiosPromise<WebAuthnAuthenticateStartRsp> {
            return localVarFp.webAuthnAuthenticateStart(webAuthnAuthenticateStartReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Update authenticator
         * @param {string} authenticatorID ID of authenticator
         * @param {WebAuthnAuthenticatorUpdateReq} webAuthnAuthenticatorUpdateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnAuthenticatorUpdate(authenticatorID: string, webAuthnAuthenticatorUpdateReq: WebAuthnAuthenticatorUpdateReq, options?: any): AxiosPromise<GenericRsp> {
            return localVarFp.webAuthnAuthenticatorUpdate(authenticatorID, webAuthnAuthenticatorUpdateReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Delete credential
         * @param {string} userID ID of user
         * @param {string} credentialID ID of credential
         * @param {EmptyReq} emptyReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnCredentialDelete(userID: string, credentialID: string, emptyReq: EmptyReq, options?: any): AxiosPromise<GenericRsp> {
            return localVarFp.webAuthnCredentialDelete(userID, credentialID, emptyReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Checks if active webauthn credential exists for provided user and device
         * @param {WebAuthnCredentialExistsReq} webAuthnCredentialExistsReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnCredentialExists(webAuthnCredentialExistsReq: WebAuthnCredentialExistsReq, options?: any): AxiosPromise<WebAuthnCredentialExistsRsp> {
            return localVarFp.webAuthnCredentialExists(webAuthnCredentialExistsReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Lists webauthn credentials users
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnCredentialList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: any): AxiosPromise<WebAuthnCredentialListRsp> {
            return localVarFp.webAuthnCredentialList(remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(axios, basePath));
        },
        /**
         * Update credential
         * @param {string} credentialID ID of credential
         * @param {WebAuthnCredentialReq} webAuthnCredentialReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnCredentialUpdate(credentialID: string, webAuthnCredentialReq: WebAuthnCredentialReq, options?: any): AxiosPromise<WebAuthnCredentialRsp> {
            return localVarFp.webAuthnCredentialUpdate(credentialID, webAuthnCredentialReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Starts mediation for Passkeys (Biometrics)
         * @param {WebAuthnMediationStartReq} webAuthnMediationStartReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnMediationStart(webAuthnMediationStartReq: WebAuthnMediationStartReq, options?: any): AxiosPromise<WebAuthnMediationStartRsp> {
            return localVarFp.webAuthnMediationStart(webAuthnMediationStartReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Completes registration of a user for Passkeys (Biometrics)
         * @param {WebAuthnFinishReq} webAuthnFinishReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnRegisterFinish(webAuthnFinishReq: WebAuthnFinishReq, options?: any): AxiosPromise<WebAuthnRegisterFinishRsp> {
            return localVarFp.webAuthnRegisterFinish(webAuthnFinishReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Starts registration of a user for Passkeys (Biometrics)
         * @param {WebAuthnRegisterStartReq} [webAuthnRegisterStartReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnRegisterStart(webAuthnRegisterStartReq?: WebAuthnRegisterStartReq, options?: any): AxiosPromise<WebAuthnRegisterStartRsp> {
            return localVarFp.webAuthnRegisterStart(webAuthnRegisterStartReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Creates a new setting for Passkeys (Biometrics)
         * @param {WebauthnSettingCreateReq} [webauthnSettingCreateReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnSettingCreate(webauthnSettingCreateReq?: WebauthnSettingCreateReq, options?: any): AxiosPromise<WebauthnSettingCreateRsp> {
            return localVarFp.webAuthnSettingCreate(webauthnSettingCreateReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Deletes a setting by id for Passkeys (Biometrics)
         * @param {string} settingID ID from create
         * @param {WebauthnSettingDeleteReq} [webauthnSettingDeleteReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnSettingDelete(settingID: string, webauthnSettingDeleteReq?: WebauthnSettingDeleteReq, options?: any): AxiosPromise<GenericRsp> {
            return localVarFp.webAuthnSettingDelete(settingID, webauthnSettingDeleteReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Gets a setting by id for Passkeys (Biometrics)
         * @param {string} settingID ID from create
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnSettingGet(settingID: string, options?: any): AxiosPromise<WebauthnSettingGetRsp> {
            return localVarFp.webAuthnSettingGet(settingID, options).then((request) => request(axios, basePath));
        },
        /**
         * Lists all settings for Passkeys (Biometrics)
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnSettingList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: any): AxiosPromise<WebauthnSettingListRsp> {
            return localVarFp.webAuthnSettingList(remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(axios, basePath));
        },
        /**
         * Updates a setting by id for Passkeys (Biometrics)
         * @param {string} settingID ID from create
         * @param {WebauthnSettingUpdateReq} [webauthnSettingUpdateReq] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webAuthnSettingPut(settingID: string, webauthnSettingUpdateReq?: WebauthnSettingUpdateReq, options?: any): AxiosPromise<WebauthnSettingUpdateRsp> {
            return localVarFp.webAuthnSettingPut(settingID, webauthnSettingUpdateReq, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * PasskeysBiometricsApi - object-oriented interface
 * @export
 * @class PasskeysBiometricsApi
 * @extends {BaseAPI}
 */
export class PasskeysBiometricsApi extends BaseAPI {
    /**
     * Starts association token flow for Passkeys (Biometrics)
     * @param {WebAuthnAssociateStartReq} webAuthnAssociateStartReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof PasskeysBiometricsApi
     */
    public webAuthnAssociateStart(webAuthnAssociateStartReq: WebAuthnAssociateStartReq, options?: RawAxiosRequestConfig) {
        return PasskeysBiometricsApiFp(this.configuration).webAuthnAssociateStart(webAuthnAssociateStartReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Completes authentication of a user for Passkeys (Biometrics)
     * @param {WebAuthnFinishReq} webAuthnFinishReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof PasskeysBiometricsApi
     */
    public webAuthnAuthenticateFinish(webAuthnFinishReq: WebAuthnFinishReq, options?: RawAxiosRequestConfig) {
        return PasskeysBiometricsApiFp(this.configuration).webAuthnAuthenticateFinish(webAuthnFinishReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Starts authentication of a user for Passkeys (Biometrics)
     * @param {WebAuthnAuthenticateStartReq} webAuthnAuthenticateStartReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof PasskeysBiometricsApi
     */
    public webAuthnAuthenticateStart(webAuthnAuthenticateStartReq: WebAuthnAuthenticateStartReq, options?: RawAxiosRequestConfig) {
        return PasskeysBiometricsApiFp(this.configuration).webAuthnAuthenticateStart(webAuthnAuthenticateStartReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Update authenticator
     * @param {string} authenticatorID ID of authenticator
     * @param {WebAuthnAuthenticatorUpdateReq} webAuthnAuthenticatorUpdateReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof PasskeysBiometricsApi
     */
    public webAuthnAuthenticatorUpdate(authenticatorID: string, webAuthnAuthenticatorUpdateReq: WebAuthnAuthenticatorUpdateReq, options?: RawAxiosRequestConfig) {
        return PasskeysBiometricsApiFp(this.configuration).webAuthnAuthenticatorUpdate(authenticatorID, webAuthnAuthenticatorUpdateReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Delete credential
     * @param {string} userID ID of user
     * @param {string} credentialID ID of credential
     * @param {EmptyReq} emptyReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof PasskeysBiometricsApi
     */
    public webAuthnCredentialDelete(userID: string, credentialID: string, emptyReq: EmptyReq, options?: RawAxiosRequestConfig) {
        return PasskeysBiometricsApiFp(this.configuration).webAuthnCredentialDelete(userID, credentialID, emptyReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Checks if active webauthn credential exists for provided user and device
     * @param {WebAuthnCredentialExistsReq} webAuthnCredentialExistsReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof PasskeysBiometricsApi
     */
    public webAuthnCredentialExists(webAuthnCredentialExistsReq: WebAuthnCredentialExistsReq, options?: RawAxiosRequestConfig) {
        return PasskeysBiometricsApiFp(this.configuration).webAuthnCredentialExists(webAuthnCredentialExistsReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Lists webauthn credentials users
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {string} [sort] Field sorting
     * @param {Array<string>} [filter] Field filtering
     * @param {number} [page] Page number
     * @param {number} [pageSize] Number of items per page
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof PasskeysBiometricsApi
     */
    public webAuthnCredentialList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig) {
        return PasskeysBiometricsApiFp(this.configuration).webAuthnCredentialList(remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Update credential
     * @param {string} credentialID ID of credential
     * @param {WebAuthnCredentialReq} webAuthnCredentialReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof PasskeysBiometricsApi
     */
    public webAuthnCredentialUpdate(credentialID: string, webAuthnCredentialReq: WebAuthnCredentialReq, options?: RawAxiosRequestConfig) {
        return PasskeysBiometricsApiFp(this.configuration).webAuthnCredentialUpdate(credentialID, webAuthnCredentialReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Starts mediation for Passkeys (Biometrics)
     * @param {WebAuthnMediationStartReq} webAuthnMediationStartReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof PasskeysBiometricsApi
     */
    public webAuthnMediationStart(webAuthnMediationStartReq: WebAuthnMediationStartReq, options?: RawAxiosRequestConfig) {
        return PasskeysBiometricsApiFp(this.configuration).webAuthnMediationStart(webAuthnMediationStartReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Completes registration of a user for Passkeys (Biometrics)
     * @param {WebAuthnFinishReq} webAuthnFinishReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof PasskeysBiometricsApi
     */
    public webAuthnRegisterFinish(webAuthnFinishReq: WebAuthnFinishReq, options?: RawAxiosRequestConfig) {
        return PasskeysBiometricsApiFp(this.configuration).webAuthnRegisterFinish(webAuthnFinishReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Starts registration of a user for Passkeys (Biometrics)
     * @param {WebAuthnRegisterStartReq} [webAuthnRegisterStartReq] 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof PasskeysBiometricsApi
     */
    public webAuthnRegisterStart(webAuthnRegisterStartReq?: WebAuthnRegisterStartReq, options?: RawAxiosRequestConfig) {
        return PasskeysBiometricsApiFp(this.configuration).webAuthnRegisterStart(webAuthnRegisterStartReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Creates a new setting for Passkeys (Biometrics)
     * @param {WebauthnSettingCreateReq} [webauthnSettingCreateReq] 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof PasskeysBiometricsApi
     */
    public webAuthnSettingCreate(webauthnSettingCreateReq?: WebauthnSettingCreateReq, options?: RawAxiosRequestConfig) {
        return PasskeysBiometricsApiFp(this.configuration).webAuthnSettingCreate(webauthnSettingCreateReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Deletes a setting by id for Passkeys (Biometrics)
     * @param {string} settingID ID from create
     * @param {WebauthnSettingDeleteReq} [webauthnSettingDeleteReq] 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof PasskeysBiometricsApi
     */
    public webAuthnSettingDelete(settingID: string, webauthnSettingDeleteReq?: WebauthnSettingDeleteReq, options?: RawAxiosRequestConfig) {
        return PasskeysBiometricsApiFp(this.configuration).webAuthnSettingDelete(settingID, webauthnSettingDeleteReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Gets a setting by id for Passkeys (Biometrics)
     * @param {string} settingID ID from create
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof PasskeysBiometricsApi
     */
    public webAuthnSettingGet(settingID: string, options?: RawAxiosRequestConfig) {
        return PasskeysBiometricsApiFp(this.configuration).webAuthnSettingGet(settingID, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Lists all settings for Passkeys (Biometrics)
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {string} [sort] Field sorting
     * @param {Array<string>} [filter] Field filtering
     * @param {number} [page] Page number
     * @param {number} [pageSize] Number of items per page
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof PasskeysBiometricsApi
     */
    public webAuthnSettingList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig) {
        return PasskeysBiometricsApiFp(this.configuration).webAuthnSettingList(remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Updates a setting by id for Passkeys (Biometrics)
     * @param {string} settingID ID from create
     * @param {WebauthnSettingUpdateReq} [webauthnSettingUpdateReq] 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof PasskeysBiometricsApi
     */
    public webAuthnSettingPut(settingID: string, webauthnSettingUpdateReq?: WebauthnSettingUpdateReq, options?: RawAxiosRequestConfig) {
        return PasskeysBiometricsApiFp(this.configuration).webAuthnSettingPut(settingID, webauthnSettingUpdateReq, options).then((request) => request(this.axios, this.basePath));
    }
}



/**
 * ProjectConfigApi - axios parameter creator
 * @export
 */
export const ProjectConfigApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Activates the project
         * @param {EmptyReq} emptyReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        projectActivate: async (emptyReq: EmptyReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'emptyReq' is not null or undefined
            assertParamExists('projectActivate', 'emptyReq', emptyReq)
            const localVarPath = `/v1/projects/activate`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'PUT', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(emptyReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Retrieves project config by projectID inferred from authentication
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        projectConfigGet: async (options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/v1/projectConfig`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Saves project config
         * @param {ProjectConfigSaveReq} projectConfigSaveReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        projectConfigSave: async (projectConfigSaveReq: ProjectConfigSaveReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'projectConfigSaveReq' is not null or undefined
            assertParamExists('projectConfigSave', 'projectConfigSaveReq', projectConfigSaveReq)
            const localVarPath = `/v1/projectConfig`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(projectConfigSaveReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Tests webhook backend
         * @param {ProjectConfigWebhookTestReq} projectConfigWebhookTestReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        projectConfigWebhookTest: async (projectConfigWebhookTestReq: ProjectConfigWebhookTestReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'projectConfigWebhookTestReq' is not null or undefined
            assertParamExists('projectConfigWebhookTest', 'projectConfigWebhookTestReq', projectConfigWebhookTestReq)
            const localVarPath = `/v1/projectConfig/testWebhook`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'PUT', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(projectConfigWebhookTestReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * ProjectConfigApi - functional programming interface
 * @export
 */
export const ProjectConfigApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = ProjectConfigApiAxiosParamCreator(configuration)
    return {
        /**
         * Activates the project
         * @param {EmptyReq} emptyReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async projectActivate(emptyReq: EmptyReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<GenericRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.projectActivate(emptyReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['ProjectConfigApi.projectActivate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Retrieves project config by projectID inferred from authentication
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async projectConfigGet(options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<ProjectConfigGetRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.projectConfigGet(options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['ProjectConfigApi.projectConfigGet']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Saves project config
         * @param {ProjectConfigSaveReq} projectConfigSaveReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async projectConfigSave(projectConfigSaveReq: ProjectConfigSaveReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<GenericRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.projectConfigSave(projectConfigSaveReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['ProjectConfigApi.projectConfigSave']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Tests webhook backend
         * @param {ProjectConfigWebhookTestReq} projectConfigWebhookTestReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async projectConfigWebhookTest(projectConfigWebhookTestReq: ProjectConfigWebhookTestReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<ProjectConfigWebhookTestRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.projectConfigWebhookTest(projectConfigWebhookTestReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['ProjectConfigApi.projectConfigWebhookTest']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * ProjectConfigApi - factory interface
 * @export
 */
export const ProjectConfigApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = ProjectConfigApiFp(configuration)
    return {
        /**
         * Activates the project
         * @param {EmptyReq} emptyReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        projectActivate(emptyReq: EmptyReq, options?: any): AxiosPromise<GenericRsp> {
            return localVarFp.projectActivate(emptyReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Retrieves project config by projectID inferred from authentication
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        projectConfigGet(options?: any): AxiosPromise<ProjectConfigGetRsp> {
            return localVarFp.projectConfigGet(options).then((request) => request(axios, basePath));
        },
        /**
         * Saves project config
         * @param {ProjectConfigSaveReq} projectConfigSaveReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        projectConfigSave(projectConfigSaveReq: ProjectConfigSaveReq, options?: any): AxiosPromise<GenericRsp> {
            return localVarFp.projectConfigSave(projectConfigSaveReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Tests webhook backend
         * @param {ProjectConfigWebhookTestReq} projectConfigWebhookTestReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        projectConfigWebhookTest(projectConfigWebhookTestReq: ProjectConfigWebhookTestReq, options?: any): AxiosPromise<ProjectConfigWebhookTestRsp> {
            return localVarFp.projectConfigWebhookTest(projectConfigWebhookTestReq, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * ProjectConfigApi - object-oriented interface
 * @export
 * @class ProjectConfigApi
 * @extends {BaseAPI}
 */
export class ProjectConfigApi extends BaseAPI {
    /**
     * Activates the project
     * @param {EmptyReq} emptyReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof ProjectConfigApi
     */
    public projectActivate(emptyReq: EmptyReq, options?: RawAxiosRequestConfig) {
        return ProjectConfigApiFp(this.configuration).projectActivate(emptyReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Retrieves project config by projectID inferred from authentication
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof ProjectConfigApi
     */
    public projectConfigGet(options?: RawAxiosRequestConfig) {
        return ProjectConfigApiFp(this.configuration).projectConfigGet(options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Saves project config
     * @param {ProjectConfigSaveReq} projectConfigSaveReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof ProjectConfigApi
     */
    public projectConfigSave(projectConfigSaveReq: ProjectConfigSaveReq, options?: RawAxiosRequestConfig) {
        return ProjectConfigApiFp(this.configuration).projectConfigSave(projectConfigSaveReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Tests webhook backend
     * @param {ProjectConfigWebhookTestReq} projectConfigWebhookTestReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof ProjectConfigApi
     */
    public projectConfigWebhookTest(projectConfigWebhookTestReq: ProjectConfigWebhookTestReq, options?: RawAxiosRequestConfig) {
        return ProjectConfigApiFp(this.configuration).projectConfigWebhookTest(projectConfigWebhookTestReq, options).then((request) => request(this.axios, this.basePath));
    }
}



/**
 * RequestLogsApi - axios parameter creator
 * @export
 */
export const RequestLogsApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Retrieves request log entry by ID. If multiple requests with the same ID are found, the most recent one is returned
         * @param {string} requestID ID of request
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        requestLogGet: async (requestID: string, remoteAddress?: string, userAgent?: string, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'requestID' is not null or undefined
            assertParamExists('requestLogGet', 'requestID', requestID)
            const localVarPath = `/v1/requestLogs/{requestID}`
                .replace(`{${"requestID"}}`, encodeURIComponent(String(requestID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Lists request logs for given filters
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        requestLogsList: async (remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/v1/requestLogs`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }

            if (sort !== undefined) {
                localVarQueryParameter['sort'] = sort;
            }

            if (filter) {
                localVarQueryParameter['filter[]'] = filter;
            }

            if (page !== undefined) {
                localVarQueryParameter['page'] = page;
            }

            if (pageSize !== undefined) {
                localVarQueryParameter['pageSize'] = pageSize;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * RequestLogsApi - functional programming interface
 * @export
 */
export const RequestLogsApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = RequestLogsApiAxiosParamCreator(configuration)
    return {
        /**
         * Retrieves request log entry by ID. If multiple requests with the same ID are found, the most recent one is returned
         * @param {string} requestID ID of request
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async requestLogGet(requestID: string, remoteAddress?: string, userAgent?: string, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<RequestLogGetRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.requestLogGet(requestID, remoteAddress, userAgent, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['RequestLogsApi.requestLogGet']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Lists request logs for given filters
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async requestLogsList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<RequestLogsListRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.requestLogsList(remoteAddress, userAgent, sort, filter, page, pageSize, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['RequestLogsApi.requestLogsList']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * RequestLogsApi - factory interface
 * @export
 */
export const RequestLogsApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = RequestLogsApiFp(configuration)
    return {
        /**
         * Retrieves request log entry by ID. If multiple requests with the same ID are found, the most recent one is returned
         * @param {string} requestID ID of request
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        requestLogGet(requestID: string, remoteAddress?: string, userAgent?: string, options?: any): AxiosPromise<RequestLogGetRsp> {
            return localVarFp.requestLogGet(requestID, remoteAddress, userAgent, options).then((request) => request(axios, basePath));
        },
        /**
         * Lists request logs for given filters
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        requestLogsList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: any): AxiosPromise<RequestLogsListRsp> {
            return localVarFp.requestLogsList(remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * RequestLogsApi - object-oriented interface
 * @export
 * @class RequestLogsApi
 * @extends {BaseAPI}
 */
export class RequestLogsApi extends BaseAPI {
    /**
     * Retrieves request log entry by ID. If multiple requests with the same ID are found, the most recent one is returned
     * @param {string} requestID ID of request
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof RequestLogsApi
     */
    public requestLogGet(requestID: string, remoteAddress?: string, userAgent?: string, options?: RawAxiosRequestConfig) {
        return RequestLogsApiFp(this.configuration).requestLogGet(requestID, remoteAddress, userAgent, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Lists request logs for given filters
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {string} [sort] Field sorting
     * @param {Array<string>} [filter] Field filtering
     * @param {number} [page] Page number
     * @param {number} [pageSize] Number of items per page
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof RequestLogsApi
     */
    public requestLogsList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig) {
        return RequestLogsApiFp(this.configuration).requestLogsList(remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(this.axios, this.basePath));
    }
}



/**
 * SMSOTPApi - axios parameter creator
 * @export
 */
export const SMSOTPApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Creates SMS OTP and sends it to given phone number
         * @param {SmsCodeSendReq} smsCodeSendReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        smsCodeSend: async (smsCodeSendReq: SmsCodeSendReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'smsCodeSendReq' is not null or undefined
            assertParamExists('smsCodeSend', 'smsCodeSendReq', smsCodeSendReq)
            const localVarPath = `/v1/smsCodes`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(smsCodeSendReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Validates SMS OTP
         * @param {string} smsCodeID ID of SMS OTP
         * @param {SmsCodeValidateReq} smsCodeValidateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        smsCodeValidate: async (smsCodeID: string, smsCodeValidateReq: SmsCodeValidateReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'smsCodeID' is not null or undefined
            assertParamExists('smsCodeValidate', 'smsCodeID', smsCodeID)
            // verify required parameter 'smsCodeValidateReq' is not null or undefined
            assertParamExists('smsCodeValidate', 'smsCodeValidateReq', smsCodeValidateReq)
            const localVarPath = `/v1/smsCodes/{smsCodeID}/validate`
                .replace(`{${"smsCodeID"}}`, encodeURIComponent(String(smsCodeID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'PUT', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(smsCodeValidateReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * SMSOTPApi - functional programming interface
 * @export
 */
export const SMSOTPApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = SMSOTPApiAxiosParamCreator(configuration)
    return {
        /**
         * Creates SMS OTP and sends it to given phone number
         * @param {SmsCodeSendReq} smsCodeSendReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async smsCodeSend(smsCodeSendReq: SmsCodeSendReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<SmsCodeSendRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.smsCodeSend(smsCodeSendReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['SMSOTPApi.smsCodeSend']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Validates SMS OTP
         * @param {string} smsCodeID ID of SMS OTP
         * @param {SmsCodeValidateReq} smsCodeValidateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async smsCodeValidate(smsCodeID: string, smsCodeValidateReq: SmsCodeValidateReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<SmsCodeValidateRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.smsCodeValidate(smsCodeID, smsCodeValidateReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['SMSOTPApi.smsCodeValidate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * SMSOTPApi - factory interface
 * @export
 */
export const SMSOTPApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = SMSOTPApiFp(configuration)
    return {
        /**
         * Creates SMS OTP and sends it to given phone number
         * @param {SmsCodeSendReq} smsCodeSendReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        smsCodeSend(smsCodeSendReq: SmsCodeSendReq, options?: any): AxiosPromise<SmsCodeSendRsp> {
            return localVarFp.smsCodeSend(smsCodeSendReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Validates SMS OTP
         * @param {string} smsCodeID ID of SMS OTP
         * @param {SmsCodeValidateReq} smsCodeValidateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        smsCodeValidate(smsCodeID: string, smsCodeValidateReq: SmsCodeValidateReq, options?: any): AxiosPromise<SmsCodeValidateRsp> {
            return localVarFp.smsCodeValidate(smsCodeID, smsCodeValidateReq, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * SMSOTPApi - object-oriented interface
 * @export
 * @class SMSOTPApi
 * @extends {BaseAPI}
 */
export class SMSOTPApi extends BaseAPI {
    /**
     * Creates SMS OTP and sends it to given phone number
     * @param {SmsCodeSendReq} smsCodeSendReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof SMSOTPApi
     */
    public smsCodeSend(smsCodeSendReq: SmsCodeSendReq, options?: RawAxiosRequestConfig) {
        return SMSOTPApiFp(this.configuration).smsCodeSend(smsCodeSendReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Validates SMS OTP
     * @param {string} smsCodeID ID of SMS OTP
     * @param {SmsCodeValidateReq} smsCodeValidateReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof SMSOTPApi
     */
    public smsCodeValidate(smsCodeID: string, smsCodeValidateReq: SmsCodeValidateReq, options?: RawAxiosRequestConfig) {
        return SMSOTPApiFp(this.configuration).smsCodeValidate(smsCodeID, smsCodeValidateReq, options).then((request) => request(this.axios, this.basePath));
    }
}



/**
 * SMSTemplatesApi - axios parameter creator
 * @export
 */
export const SMSTemplatesApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Creates a new SMS template
         * @param {SmsTemplateCreateReq} smsTemplateCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        smsTemplateCreate: async (smsTemplateCreateReq: SmsTemplateCreateReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'smsTemplateCreateReq' is not null or undefined
            assertParamExists('smsTemplateCreate', 'smsTemplateCreateReq', smsTemplateCreateReq)
            const localVarPath = `/v1/smsTemplates`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(smsTemplateCreateReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Deletes an SMS template
         * @param {string} smsTemplateID ID of SMS template
         * @param {SmsTemplateDeleteReq} smsTemplateDeleteReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        smsTemplateDelete: async (smsTemplateID: string, smsTemplateDeleteReq: SmsTemplateDeleteReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'smsTemplateID' is not null or undefined
            assertParamExists('smsTemplateDelete', 'smsTemplateID', smsTemplateID)
            // verify required parameter 'smsTemplateDeleteReq' is not null or undefined
            assertParamExists('smsTemplateDelete', 'smsTemplateDeleteReq', smsTemplateDeleteReq)
            const localVarPath = `/v1/smsTemplates/{smsTemplateID}`
                .replace(`{${"smsTemplateID"}}`, encodeURIComponent(String(smsTemplateID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'DELETE', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(smsTemplateDeleteReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * SMSTemplatesApi - functional programming interface
 * @export
 */
export const SMSTemplatesApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = SMSTemplatesApiAxiosParamCreator(configuration)
    return {
        /**
         * Creates a new SMS template
         * @param {SmsTemplateCreateReq} smsTemplateCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async smsTemplateCreate(smsTemplateCreateReq: SmsTemplateCreateReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<SmsTemplateCreateRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.smsTemplateCreate(smsTemplateCreateReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['SMSTemplatesApi.smsTemplateCreate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Deletes an SMS template
         * @param {string} smsTemplateID ID of SMS template
         * @param {SmsTemplateDeleteReq} smsTemplateDeleteReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async smsTemplateDelete(smsTemplateID: string, smsTemplateDeleteReq: SmsTemplateDeleteReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<GenericRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.smsTemplateDelete(smsTemplateID, smsTemplateDeleteReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['SMSTemplatesApi.smsTemplateDelete']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * SMSTemplatesApi - factory interface
 * @export
 */
export const SMSTemplatesApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = SMSTemplatesApiFp(configuration)
    return {
        /**
         * Creates a new SMS template
         * @param {SmsTemplateCreateReq} smsTemplateCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        smsTemplateCreate(smsTemplateCreateReq: SmsTemplateCreateReq, options?: any): AxiosPromise<SmsTemplateCreateRsp> {
            return localVarFp.smsTemplateCreate(smsTemplateCreateReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Deletes an SMS template
         * @param {string} smsTemplateID ID of SMS template
         * @param {SmsTemplateDeleteReq} smsTemplateDeleteReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        smsTemplateDelete(smsTemplateID: string, smsTemplateDeleteReq: SmsTemplateDeleteReq, options?: any): AxiosPromise<GenericRsp> {
            return localVarFp.smsTemplateDelete(smsTemplateID, smsTemplateDeleteReq, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * SMSTemplatesApi - object-oriented interface
 * @export
 * @class SMSTemplatesApi
 * @extends {BaseAPI}
 */
export class SMSTemplatesApi extends BaseAPI {
    /**
     * Creates a new SMS template
     * @param {SmsTemplateCreateReq} smsTemplateCreateReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof SMSTemplatesApi
     */
    public smsTemplateCreate(smsTemplateCreateReq: SmsTemplateCreateReq, options?: RawAxiosRequestConfig) {
        return SMSTemplatesApiFp(this.configuration).smsTemplateCreate(smsTemplateCreateReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Deletes an SMS template
     * @param {string} smsTemplateID ID of SMS template
     * @param {SmsTemplateDeleteReq} smsTemplateDeleteReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof SMSTemplatesApi
     */
    public smsTemplateDelete(smsTemplateID: string, smsTemplateDeleteReq: SmsTemplateDeleteReq, options?: RawAxiosRequestConfig) {
        return SMSTemplatesApiFp(this.configuration).smsTemplateDelete(smsTemplateID, smsTemplateDeleteReq, options).then((request) => request(this.axios, this.basePath));
    }
}



/**
 * SessionConfigApi - axios parameter creator
 * @export
 */
export const SessionConfigApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Retrieves session config by projectID inferred from authentication
         * @param {AppType} [appType] Application type
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        sessionConfigGet: async (appType?: AppType, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/v1/sessionConfig`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (appType !== undefined) {
                localVarQueryParameter['appType'] = appType;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Updates session config
         * @param {SessionConfigUpdateReq} sessionConfigUpdateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        sessionConfigUpdate: async (sessionConfigUpdateReq: SessionConfigUpdateReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'sessionConfigUpdateReq' is not null or undefined
            assertParamExists('sessionConfigUpdate', 'sessionConfigUpdateReq', sessionConfigUpdateReq)
            const localVarPath = `/v1/sessionConfig`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'PUT', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(sessionConfigUpdateReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * SessionConfigApi - functional programming interface
 * @export
 */
export const SessionConfigApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = SessionConfigApiAxiosParamCreator(configuration)
    return {
        /**
         * Retrieves session config by projectID inferred from authentication
         * @param {AppType} [appType] Application type
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async sessionConfigGet(appType?: AppType, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<SessionConfigGetRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.sessionConfigGet(appType, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['SessionConfigApi.sessionConfigGet']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Updates session config
         * @param {SessionConfigUpdateReq} sessionConfigUpdateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async sessionConfigUpdate(sessionConfigUpdateReq: SessionConfigUpdateReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<GenericRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.sessionConfigUpdate(sessionConfigUpdateReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['SessionConfigApi.sessionConfigUpdate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * SessionConfigApi - factory interface
 * @export
 */
export const SessionConfigApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = SessionConfigApiFp(configuration)
    return {
        /**
         * Retrieves session config by projectID inferred from authentication
         * @param {AppType} [appType] Application type
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        sessionConfigGet(appType?: AppType, options?: any): AxiosPromise<SessionConfigGetRsp> {
            return localVarFp.sessionConfigGet(appType, options).then((request) => request(axios, basePath));
        },
        /**
         * Updates session config
         * @param {SessionConfigUpdateReq} sessionConfigUpdateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        sessionConfigUpdate(sessionConfigUpdateReq: SessionConfigUpdateReq, options?: any): AxiosPromise<GenericRsp> {
            return localVarFp.sessionConfigUpdate(sessionConfigUpdateReq, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * SessionConfigApi - object-oriented interface
 * @export
 * @class SessionConfigApi
 * @extends {BaseAPI}
 */
export class SessionConfigApi extends BaseAPI {
    /**
     * Retrieves session config by projectID inferred from authentication
     * @param {AppType} [appType] Application type
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof SessionConfigApi
     */
    public sessionConfigGet(appType?: AppType, options?: RawAxiosRequestConfig) {
        return SessionConfigApiFp(this.configuration).sessionConfigGet(appType, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Updates session config
     * @param {SessionConfigUpdateReq} sessionConfigUpdateReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof SessionConfigApi
     */
    public sessionConfigUpdate(sessionConfigUpdateReq: SessionConfigUpdateReq, options?: RawAxiosRequestConfig) {
        return SessionConfigApiFp(this.configuration).sessionConfigUpdate(sessionConfigUpdateReq, options).then((request) => request(this.axios, this.basePath));
    }
}



/**
 * UserApi - axios parameter creator
 * @export
 */
export const UserApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Lists user auth log
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userAuthLogList: async (remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/v1/userauthlogs`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }

            if (sort !== undefined) {
                localVarQueryParameter['sort'] = sort;
            }

            if (filter) {
                localVarQueryParameter['filter[]'] = filter;
            }

            if (page !== undefined) {
                localVarQueryParameter['page'] = page;
            }

            if (pageSize !== undefined) {
                localVarQueryParameter['pageSize'] = pageSize;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Creates a new user
         * @param {UserCreateReq} userCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userCreate: async (userCreateReq: UserCreateReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'userCreateReq' is not null or undefined
            assertParamExists('userCreate', 'userCreateReq', userCreateReq)
            const localVarPath = `/v1/users`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(userCreateReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Add a custom login identifier to an existing user
         * @param {string} userID ID of user
         * @param {UserCustomLoginIdentifierCreateReq} userCustomLoginIdentifierCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userCustomLoginIdentifierCreate: async (userID: string, userCustomLoginIdentifierCreateReq: UserCustomLoginIdentifierCreateReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'userID' is not null or undefined
            assertParamExists('userCustomLoginIdentifierCreate', 'userID', userID)
            // verify required parameter 'userCustomLoginIdentifierCreateReq' is not null or undefined
            assertParamExists('userCustomLoginIdentifierCreate', 'userCustomLoginIdentifierCreateReq', userCustomLoginIdentifierCreateReq)
            const localVarPath = `/v1/users/{userID}/customLoginIdentifiers`
                .replace(`{${"userID"}}`, encodeURIComponent(String(userID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(userCustomLoginIdentifierCreateReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Delete a user\'s custom login identifier
         * @param {string} userID ID of user
         * @param {string} customLoginIdentifierID ID of custom login identifier
         * @param {UserCustomLoginIdentifierDeleteReq} userCustomLoginIdentifierDeleteReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userCustomLoginIdentifierDelete: async (userID: string, customLoginIdentifierID: string, userCustomLoginIdentifierDeleteReq: UserCustomLoginIdentifierDeleteReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'userID' is not null or undefined
            assertParamExists('userCustomLoginIdentifierDelete', 'userID', userID)
            // verify required parameter 'customLoginIdentifierID' is not null or undefined
            assertParamExists('userCustomLoginIdentifierDelete', 'customLoginIdentifierID', customLoginIdentifierID)
            // verify required parameter 'userCustomLoginIdentifierDeleteReq' is not null or undefined
            assertParamExists('userCustomLoginIdentifierDelete', 'userCustomLoginIdentifierDeleteReq', userCustomLoginIdentifierDeleteReq)
            const localVarPath = `/v1/users/{userID}/customLoginIdentifiers/{customLoginIdentifierID}`
                .replace(`{${"userID"}}`, encodeURIComponent(String(userID)))
                .replace(`{${"customLoginIdentifierID"}}`, encodeURIComponent(String(customLoginIdentifierID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'DELETE', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(userCustomLoginIdentifierDeleteReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Get a user\'s custom login identifier
         * @param {string} userID ID of user
         * @param {string} customLoginIdentifierID ID of custom login identifier
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userCustomLoginIdentifierGet: async (userID: string, customLoginIdentifierID: string, remoteAddress?: string, userAgent?: string, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'userID' is not null or undefined
            assertParamExists('userCustomLoginIdentifierGet', 'userID', userID)
            // verify required parameter 'customLoginIdentifierID' is not null or undefined
            assertParamExists('userCustomLoginIdentifierGet', 'customLoginIdentifierID', customLoginIdentifierID)
            const localVarPath = `/v1/users/{userID}/customLoginIdentifiers/{customLoginIdentifierID}`
                .replace(`{${"userID"}}`, encodeURIComponent(String(userID)))
                .replace(`{${"customLoginIdentifierID"}}`, encodeURIComponent(String(customLoginIdentifierID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Deletes a user
         * @param {string} userID ID of user
         * @param {UserDeleteReq} userDeleteReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userDelete: async (userID: string, userDeleteReq: UserDeleteReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'userID' is not null or undefined
            assertParamExists('userDelete', 'userID', userID)
            // verify required parameter 'userDeleteReq' is not null or undefined
            assertParamExists('userDelete', 'userDeleteReq', userDeleteReq)
            const localVarPath = `/v1/users/{userID}`
                .replace(`{${"userID"}}`, encodeURIComponent(String(userID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'DELETE', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(userDeleteReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Provides all register devices for given user
         * @param {string} userID ID of user
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userDeviceList: async (userID: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'userID' is not null or undefined
            assertParamExists('userDeviceList', 'userID', userID)
            const localVarPath = `/v1/users/{userID}/devices`
                .replace(`{${"userID"}}`, encodeURIComponent(String(userID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }

            if (sort !== undefined) {
                localVarQueryParameter['sort'] = sort;
            }

            if (filter) {
                localVarQueryParameter['filter[]'] = filter;
            }

            if (page !== undefined) {
                localVarQueryParameter['page'] = page;
            }

            if (pageSize !== undefined) {
                localVarQueryParameter['pageSize'] = pageSize;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Add an email to an existing user
         * @param {string} userID ID of user
         * @param {UserEmailCreateReq} userEmailCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userEmailCreate: async (userID: string, userEmailCreateReq: UserEmailCreateReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'userID' is not null or undefined
            assertParamExists('userEmailCreate', 'userID', userID)
            // verify required parameter 'userEmailCreateReq' is not null or undefined
            assertParamExists('userEmailCreate', 'userEmailCreateReq', userEmailCreateReq)
            const localVarPath = `/v1/users/{userID}/emails`
                .replace(`{${"userID"}}`, encodeURIComponent(String(userID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(userEmailCreateReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Delete a user\'s email
         * @param {string} userID ID of user
         * @param {string} emailID ID of email
         * @param {UserEmailDeleteReq} userEmailDeleteReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userEmailDelete: async (userID: string, emailID: string, userEmailDeleteReq: UserEmailDeleteReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'userID' is not null or undefined
            assertParamExists('userEmailDelete', 'userID', userID)
            // verify required parameter 'emailID' is not null or undefined
            assertParamExists('userEmailDelete', 'emailID', emailID)
            // verify required parameter 'userEmailDeleteReq' is not null or undefined
            assertParamExists('userEmailDelete', 'userEmailDeleteReq', userEmailDeleteReq)
            const localVarPath = `/v1/users/{userID}/emails/{emailID}`
                .replace(`{${"userID"}}`, encodeURIComponent(String(userID)))
                .replace(`{${"emailID"}}`, encodeURIComponent(String(emailID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'DELETE', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(userEmailDeleteReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Get a user\'s email
         * @param {string} userID ID of user
         * @param {string} emailID ID of email
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userEmailGet: async (userID: string, emailID: string, remoteAddress?: string, userAgent?: string, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'userID' is not null or undefined
            assertParamExists('userEmailGet', 'userID', userID)
            // verify required parameter 'emailID' is not null or undefined
            assertParamExists('userEmailGet', 'emailID', emailID)
            const localVarPath = `/v1/users/{userID}/emails/{emailID}`
                .replace(`{${"userID"}}`, encodeURIComponent(String(userID)))
                .replace(`{${"emailID"}}`, encodeURIComponent(String(emailID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Get a user by ID
         * @param {string} userID ID of user
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userGet: async (userID: string, remoteAddress?: string, userAgent?: string, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'userID' is not null or undefined
            assertParamExists('userGet', 'userID', userID)
            const localVarPath = `/v1/users/{userID}`
                .replace(`{${"userID"}}`, encodeURIComponent(String(userID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Lists project users
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userList: async (remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/v1/users`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }

            if (sort !== undefined) {
                localVarQueryParameter['sort'] = sort;
            }

            if (filter) {
                localVarQueryParameter['filter[]'] = filter;
            }

            if (page !== undefined) {
                localVarQueryParameter['page'] = page;
            }

            if (pageSize !== undefined) {
                localVarQueryParameter['pageSize'] = pageSize;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Add a phone number to an existing user
         * @param {string} userID ID of user
         * @param {UserPhoneNumberCreateReq} userPhoneNumberCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userPhoneNumberCreate: async (userID: string, userPhoneNumberCreateReq: UserPhoneNumberCreateReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'userID' is not null or undefined
            assertParamExists('userPhoneNumberCreate', 'userID', userID)
            // verify required parameter 'userPhoneNumberCreateReq' is not null or undefined
            assertParamExists('userPhoneNumberCreate', 'userPhoneNumberCreateReq', userPhoneNumberCreateReq)
            const localVarPath = `/v1/users/{userID}/phoneNumbers`
                .replace(`{${"userID"}}`, encodeURIComponent(String(userID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(userPhoneNumberCreateReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Delete a user\'s phone number
         * @param {string} userID ID of user
         * @param {string} phoneNumberID ID of phone number
         * @param {UserPhoneNumberDeleteReq} userPhoneNumberDeleteReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userPhoneNumberDelete: async (userID: string, phoneNumberID: string, userPhoneNumberDeleteReq: UserPhoneNumberDeleteReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'userID' is not null or undefined
            assertParamExists('userPhoneNumberDelete', 'userID', userID)
            // verify required parameter 'phoneNumberID' is not null or undefined
            assertParamExists('userPhoneNumberDelete', 'phoneNumberID', phoneNumberID)
            // verify required parameter 'userPhoneNumberDeleteReq' is not null or undefined
            assertParamExists('userPhoneNumberDelete', 'userPhoneNumberDeleteReq', userPhoneNumberDeleteReq)
            const localVarPath = `/v1/users/{userID}/phoneNumbers/{phoneNumberID}`
                .replace(`{${"userID"}}`, encodeURIComponent(String(userID)))
                .replace(`{${"phoneNumberID"}}`, encodeURIComponent(String(phoneNumberID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'DELETE', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(userPhoneNumberDeleteReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Get a user\'s phone number
         * @param {string} userID ID of user
         * @param {string} phoneNumberID ID of phone number
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userPhoneNumberGet: async (userID: string, phoneNumberID: string, remoteAddress?: string, userAgent?: string, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'userID' is not null or undefined
            assertParamExists('userPhoneNumberGet', 'userID', userID)
            // verify required parameter 'phoneNumberID' is not null or undefined
            assertParamExists('userPhoneNumberGet', 'phoneNumberID', phoneNumberID)
            const localVarPath = `/v1/users/{userID}/phoneNumbers/{phoneNumberID}`
                .replace(`{${"userID"}}`, encodeURIComponent(String(userID)))
                .replace(`{${"phoneNumberID"}}`, encodeURIComponent(String(phoneNumberID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Provides aggregated user stats for project
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userStatsList: async (granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'granularity' is not null or undefined
            assertParamExists('userStatsList', 'granularity', granularity)
            const localVarPath = `/v1/users/stats`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }

            if (sort !== undefined) {
                localVarQueryParameter['sort'] = sort;
            }

            if (filter) {
                localVarQueryParameter['filter[]'] = filter;
            }

            if (page !== undefined) {
                localVarQueryParameter['page'] = page;
            }

            if (pageSize !== undefined) {
                localVarQueryParameter['pageSize'] = pageSize;
            }

            if (granularity !== undefined) {
                localVarQueryParameter['granularity'] = granularity;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Updates a user
         * @param {string} userID ID of user
         * @param {UserUpdateReq} userUpdateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userUpdate: async (userID: string, userUpdateReq: UserUpdateReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'userID' is not null or undefined
            assertParamExists('userUpdate', 'userID', userID)
            // verify required parameter 'userUpdateReq' is not null or undefined
            assertParamExists('userUpdate', 'userUpdateReq', userUpdateReq)
            const localVarPath = `/v1/users/{userID}`
                .replace(`{${"userID"}}`, encodeURIComponent(String(userID)));
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'PUT', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(userUpdateReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * UserApi - functional programming interface
 * @export
 */
export const UserApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = UserApiAxiosParamCreator(configuration)
    return {
        /**
         * Lists user auth log
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async userAuthLogList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<UserAuthLogListRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.userAuthLogList(remoteAddress, userAgent, sort, filter, page, pageSize, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['UserApi.userAuthLogList']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Creates a new user
         * @param {UserCreateReq} userCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async userCreate(userCreateReq: UserCreateReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<UserCreateRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.userCreate(userCreateReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['UserApi.userCreate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Add a custom login identifier to an existing user
         * @param {string} userID ID of user
         * @param {UserCustomLoginIdentifierCreateReq} userCustomLoginIdentifierCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async userCustomLoginIdentifierCreate(userID: string, userCustomLoginIdentifierCreateReq: UserCustomLoginIdentifierCreateReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<UserCustomLoginIdentifierCreateRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.userCustomLoginIdentifierCreate(userID, userCustomLoginIdentifierCreateReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['UserApi.userCustomLoginIdentifierCreate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Delete a user\'s custom login identifier
         * @param {string} userID ID of user
         * @param {string} customLoginIdentifierID ID of custom login identifier
         * @param {UserCustomLoginIdentifierDeleteReq} userCustomLoginIdentifierDeleteReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async userCustomLoginIdentifierDelete(userID: string, customLoginIdentifierID: string, userCustomLoginIdentifierDeleteReq: UserCustomLoginIdentifierDeleteReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<GenericRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.userCustomLoginIdentifierDelete(userID, customLoginIdentifierID, userCustomLoginIdentifierDeleteReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['UserApi.userCustomLoginIdentifierDelete']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Get a user\'s custom login identifier
         * @param {string} userID ID of user
         * @param {string} customLoginIdentifierID ID of custom login identifier
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async userCustomLoginIdentifierGet(userID: string, customLoginIdentifierID: string, remoteAddress?: string, userAgent?: string, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<UserCustomLoginIdentifierGetRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.userCustomLoginIdentifierGet(userID, customLoginIdentifierID, remoteAddress, userAgent, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['UserApi.userCustomLoginIdentifierGet']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Deletes a user
         * @param {string} userID ID of user
         * @param {UserDeleteReq} userDeleteReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async userDelete(userID: string, userDeleteReq: UserDeleteReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<GenericRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.userDelete(userID, userDeleteReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['UserApi.userDelete']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Provides all register devices for given user
         * @param {string} userID ID of user
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async userDeviceList(userID: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<UserDeviceListRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.userDeviceList(userID, remoteAddress, userAgent, sort, filter, page, pageSize, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['UserApi.userDeviceList']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Add an email to an existing user
         * @param {string} userID ID of user
         * @param {UserEmailCreateReq} userEmailCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async userEmailCreate(userID: string, userEmailCreateReq: UserEmailCreateReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<UserEmailCreateRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.userEmailCreate(userID, userEmailCreateReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['UserApi.userEmailCreate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Delete a user\'s email
         * @param {string} userID ID of user
         * @param {string} emailID ID of email
         * @param {UserEmailDeleteReq} userEmailDeleteReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async userEmailDelete(userID: string, emailID: string, userEmailDeleteReq: UserEmailDeleteReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<GenericRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.userEmailDelete(userID, emailID, userEmailDeleteReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['UserApi.userEmailDelete']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Get a user\'s email
         * @param {string} userID ID of user
         * @param {string} emailID ID of email
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async userEmailGet(userID: string, emailID: string, remoteAddress?: string, userAgent?: string, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<UserEmailGetRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.userEmailGet(userID, emailID, remoteAddress, userAgent, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['UserApi.userEmailGet']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Get a user by ID
         * @param {string} userID ID of user
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async userGet(userID: string, remoteAddress?: string, userAgent?: string, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<UserGetRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.userGet(userID, remoteAddress, userAgent, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['UserApi.userGet']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Lists project users
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async userList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<UserListRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.userList(remoteAddress, userAgent, sort, filter, page, pageSize, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['UserApi.userList']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Add a phone number to an existing user
         * @param {string} userID ID of user
         * @param {UserPhoneNumberCreateReq} userPhoneNumberCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async userPhoneNumberCreate(userID: string, userPhoneNumberCreateReq: UserPhoneNumberCreateReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<UserPhoneNumberCreateRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.userPhoneNumberCreate(userID, userPhoneNumberCreateReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['UserApi.userPhoneNumberCreate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Delete a user\'s phone number
         * @param {string} userID ID of user
         * @param {string} phoneNumberID ID of phone number
         * @param {UserPhoneNumberDeleteReq} userPhoneNumberDeleteReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async userPhoneNumberDelete(userID: string, phoneNumberID: string, userPhoneNumberDeleteReq: UserPhoneNumberDeleteReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<GenericRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.userPhoneNumberDelete(userID, phoneNumberID, userPhoneNumberDeleteReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['UserApi.userPhoneNumberDelete']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Get a user\'s phone number
         * @param {string} userID ID of user
         * @param {string} phoneNumberID ID of phone number
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async userPhoneNumberGet(userID: string, phoneNumberID: string, remoteAddress?: string, userAgent?: string, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<UserPhoneNumberGetRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.userPhoneNumberGet(userID, phoneNumberID, remoteAddress, userAgent, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['UserApi.userPhoneNumberGet']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Provides aggregated user stats for project
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async userStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<UserStatsListRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.userStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['UserApi.userStatsList']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Updates a user
         * @param {string} userID ID of user
         * @param {UserUpdateReq} userUpdateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async userUpdate(userID: string, userUpdateReq: UserUpdateReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<UserUpdateRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.userUpdate(userID, userUpdateReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['UserApi.userUpdate']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * UserApi - factory interface
 * @export
 */
export const UserApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = UserApiFp(configuration)
    return {
        /**
         * Lists user auth log
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userAuthLogList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: any): AxiosPromise<UserAuthLogListRsp> {
            return localVarFp.userAuthLogList(remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(axios, basePath));
        },
        /**
         * Creates a new user
         * @param {UserCreateReq} userCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userCreate(userCreateReq: UserCreateReq, options?: any): AxiosPromise<UserCreateRsp> {
            return localVarFp.userCreate(userCreateReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Add a custom login identifier to an existing user
         * @param {string} userID ID of user
         * @param {UserCustomLoginIdentifierCreateReq} userCustomLoginIdentifierCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userCustomLoginIdentifierCreate(userID: string, userCustomLoginIdentifierCreateReq: UserCustomLoginIdentifierCreateReq, options?: any): AxiosPromise<UserCustomLoginIdentifierCreateRsp> {
            return localVarFp.userCustomLoginIdentifierCreate(userID, userCustomLoginIdentifierCreateReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Delete a user\'s custom login identifier
         * @param {string} userID ID of user
         * @param {string} customLoginIdentifierID ID of custom login identifier
         * @param {UserCustomLoginIdentifierDeleteReq} userCustomLoginIdentifierDeleteReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userCustomLoginIdentifierDelete(userID: string, customLoginIdentifierID: string, userCustomLoginIdentifierDeleteReq: UserCustomLoginIdentifierDeleteReq, options?: any): AxiosPromise<GenericRsp> {
            return localVarFp.userCustomLoginIdentifierDelete(userID, customLoginIdentifierID, userCustomLoginIdentifierDeleteReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Get a user\'s custom login identifier
         * @param {string} userID ID of user
         * @param {string} customLoginIdentifierID ID of custom login identifier
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userCustomLoginIdentifierGet(userID: string, customLoginIdentifierID: string, remoteAddress?: string, userAgent?: string, options?: any): AxiosPromise<UserCustomLoginIdentifierGetRsp> {
            return localVarFp.userCustomLoginIdentifierGet(userID, customLoginIdentifierID, remoteAddress, userAgent, options).then((request) => request(axios, basePath));
        },
        /**
         * Deletes a user
         * @param {string} userID ID of user
         * @param {UserDeleteReq} userDeleteReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userDelete(userID: string, userDeleteReq: UserDeleteReq, options?: any): AxiosPromise<GenericRsp> {
            return localVarFp.userDelete(userID, userDeleteReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Provides all register devices for given user
         * @param {string} userID ID of user
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userDeviceList(userID: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: any): AxiosPromise<UserDeviceListRsp> {
            return localVarFp.userDeviceList(userID, remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(axios, basePath));
        },
        /**
         * Add an email to an existing user
         * @param {string} userID ID of user
         * @param {UserEmailCreateReq} userEmailCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userEmailCreate(userID: string, userEmailCreateReq: UserEmailCreateReq, options?: any): AxiosPromise<UserEmailCreateRsp> {
            return localVarFp.userEmailCreate(userID, userEmailCreateReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Delete a user\'s email
         * @param {string} userID ID of user
         * @param {string} emailID ID of email
         * @param {UserEmailDeleteReq} userEmailDeleteReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userEmailDelete(userID: string, emailID: string, userEmailDeleteReq: UserEmailDeleteReq, options?: any): AxiosPromise<GenericRsp> {
            return localVarFp.userEmailDelete(userID, emailID, userEmailDeleteReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Get a user\'s email
         * @param {string} userID ID of user
         * @param {string} emailID ID of email
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userEmailGet(userID: string, emailID: string, remoteAddress?: string, userAgent?: string, options?: any): AxiosPromise<UserEmailGetRsp> {
            return localVarFp.userEmailGet(userID, emailID, remoteAddress, userAgent, options).then((request) => request(axios, basePath));
        },
        /**
         * Get a user by ID
         * @param {string} userID ID of user
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userGet(userID: string, remoteAddress?: string, userAgent?: string, options?: any): AxiosPromise<UserGetRsp> {
            return localVarFp.userGet(userID, remoteAddress, userAgent, options).then((request) => request(axios, basePath));
        },
        /**
         * Lists project users
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: any): AxiosPromise<UserListRsp> {
            return localVarFp.userList(remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(axios, basePath));
        },
        /**
         * Add a phone number to an existing user
         * @param {string} userID ID of user
         * @param {UserPhoneNumberCreateReq} userPhoneNumberCreateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userPhoneNumberCreate(userID: string, userPhoneNumberCreateReq: UserPhoneNumberCreateReq, options?: any): AxiosPromise<UserPhoneNumberCreateRsp> {
            return localVarFp.userPhoneNumberCreate(userID, userPhoneNumberCreateReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Delete a user\'s phone number
         * @param {string} userID ID of user
         * @param {string} phoneNumberID ID of phone number
         * @param {UserPhoneNumberDeleteReq} userPhoneNumberDeleteReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userPhoneNumberDelete(userID: string, phoneNumberID: string, userPhoneNumberDeleteReq: UserPhoneNumberDeleteReq, options?: any): AxiosPromise<GenericRsp> {
            return localVarFp.userPhoneNumberDelete(userID, phoneNumberID, userPhoneNumberDeleteReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Get a user\'s phone number
         * @param {string} userID ID of user
         * @param {string} phoneNumberID ID of phone number
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userPhoneNumberGet(userID: string, phoneNumberID: string, remoteAddress?: string, userAgent?: string, options?: any): AxiosPromise<UserPhoneNumberGetRsp> {
            return localVarFp.userPhoneNumberGet(userID, phoneNumberID, remoteAddress, userAgent, options).then((request) => request(axios, basePath));
        },
        /**
         * Provides aggregated user stats for project
         * @param {string} granularity Data granularity
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: any): AxiosPromise<UserStatsListRsp> {
            return localVarFp.userStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(axios, basePath));
        },
        /**
         * Updates a user
         * @param {string} userID ID of user
         * @param {UserUpdateReq} userUpdateReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        userUpdate(userID: string, userUpdateReq: UserUpdateReq, options?: any): AxiosPromise<UserUpdateRsp> {
            return localVarFp.userUpdate(userID, userUpdateReq, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * UserApi - object-oriented interface
 * @export
 * @class UserApi
 * @extends {BaseAPI}
 */
export class UserApi extends BaseAPI {
    /**
     * Lists user auth log
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {string} [sort] Field sorting
     * @param {Array<string>} [filter] Field filtering
     * @param {number} [page] Page number
     * @param {number} [pageSize] Number of items per page
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof UserApi
     */
    public userAuthLogList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig) {
        return UserApiFp(this.configuration).userAuthLogList(remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Creates a new user
     * @param {UserCreateReq} userCreateReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof UserApi
     */
    public userCreate(userCreateReq: UserCreateReq, options?: RawAxiosRequestConfig) {
        return UserApiFp(this.configuration).userCreate(userCreateReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Add a custom login identifier to an existing user
     * @param {string} userID ID of user
     * @param {UserCustomLoginIdentifierCreateReq} userCustomLoginIdentifierCreateReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof UserApi
     */
    public userCustomLoginIdentifierCreate(userID: string, userCustomLoginIdentifierCreateReq: UserCustomLoginIdentifierCreateReq, options?: RawAxiosRequestConfig) {
        return UserApiFp(this.configuration).userCustomLoginIdentifierCreate(userID, userCustomLoginIdentifierCreateReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Delete a user\'s custom login identifier
     * @param {string} userID ID of user
     * @param {string} customLoginIdentifierID ID of custom login identifier
     * @param {UserCustomLoginIdentifierDeleteReq} userCustomLoginIdentifierDeleteReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof UserApi
     */
    public userCustomLoginIdentifierDelete(userID: string, customLoginIdentifierID: string, userCustomLoginIdentifierDeleteReq: UserCustomLoginIdentifierDeleteReq, options?: RawAxiosRequestConfig) {
        return UserApiFp(this.configuration).userCustomLoginIdentifierDelete(userID, customLoginIdentifierID, userCustomLoginIdentifierDeleteReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Get a user\'s custom login identifier
     * @param {string} userID ID of user
     * @param {string} customLoginIdentifierID ID of custom login identifier
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof UserApi
     */
    public userCustomLoginIdentifierGet(userID: string, customLoginIdentifierID: string, remoteAddress?: string, userAgent?: string, options?: RawAxiosRequestConfig) {
        return UserApiFp(this.configuration).userCustomLoginIdentifierGet(userID, customLoginIdentifierID, remoteAddress, userAgent, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Deletes a user
     * @param {string} userID ID of user
     * @param {UserDeleteReq} userDeleteReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof UserApi
     */
    public userDelete(userID: string, userDeleteReq: UserDeleteReq, options?: RawAxiosRequestConfig) {
        return UserApiFp(this.configuration).userDelete(userID, userDeleteReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Provides all register devices for given user
     * @param {string} userID ID of user
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {string} [sort] Field sorting
     * @param {Array<string>} [filter] Field filtering
     * @param {number} [page] Page number
     * @param {number} [pageSize] Number of items per page
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof UserApi
     */
    public userDeviceList(userID: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig) {
        return UserApiFp(this.configuration).userDeviceList(userID, remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Add an email to an existing user
     * @param {string} userID ID of user
     * @param {UserEmailCreateReq} userEmailCreateReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof UserApi
     */
    public userEmailCreate(userID: string, userEmailCreateReq: UserEmailCreateReq, options?: RawAxiosRequestConfig) {
        return UserApiFp(this.configuration).userEmailCreate(userID, userEmailCreateReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Delete a user\'s email
     * @param {string} userID ID of user
     * @param {string} emailID ID of email
     * @param {UserEmailDeleteReq} userEmailDeleteReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof UserApi
     */
    public userEmailDelete(userID: string, emailID: string, userEmailDeleteReq: UserEmailDeleteReq, options?: RawAxiosRequestConfig) {
        return UserApiFp(this.configuration).userEmailDelete(userID, emailID, userEmailDeleteReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Get a user\'s email
     * @param {string} userID ID of user
     * @param {string} emailID ID of email
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof UserApi
     */
    public userEmailGet(userID: string, emailID: string, remoteAddress?: string, userAgent?: string, options?: RawAxiosRequestConfig) {
        return UserApiFp(this.configuration).userEmailGet(userID, emailID, remoteAddress, userAgent, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Get a user by ID
     * @param {string} userID ID of user
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof UserApi
     */
    public userGet(userID: string, remoteAddress?: string, userAgent?: string, options?: RawAxiosRequestConfig) {
        return UserApiFp(this.configuration).userGet(userID, remoteAddress, userAgent, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Lists project users
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {string} [sort] Field sorting
     * @param {Array<string>} [filter] Field filtering
     * @param {number} [page] Page number
     * @param {number} [pageSize] Number of items per page
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof UserApi
     */
    public userList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig) {
        return UserApiFp(this.configuration).userList(remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Add a phone number to an existing user
     * @param {string} userID ID of user
     * @param {UserPhoneNumberCreateReq} userPhoneNumberCreateReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof UserApi
     */
    public userPhoneNumberCreate(userID: string, userPhoneNumberCreateReq: UserPhoneNumberCreateReq, options?: RawAxiosRequestConfig) {
        return UserApiFp(this.configuration).userPhoneNumberCreate(userID, userPhoneNumberCreateReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Delete a user\'s phone number
     * @param {string} userID ID of user
     * @param {string} phoneNumberID ID of phone number
     * @param {UserPhoneNumberDeleteReq} userPhoneNumberDeleteReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof UserApi
     */
    public userPhoneNumberDelete(userID: string, phoneNumberID: string, userPhoneNumberDeleteReq: UserPhoneNumberDeleteReq, options?: RawAxiosRequestConfig) {
        return UserApiFp(this.configuration).userPhoneNumberDelete(userID, phoneNumberID, userPhoneNumberDeleteReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Get a user\'s phone number
     * @param {string} userID ID of user
     * @param {string} phoneNumberID ID of phone number
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof UserApi
     */
    public userPhoneNumberGet(userID: string, phoneNumberID: string, remoteAddress?: string, userAgent?: string, options?: RawAxiosRequestConfig) {
        return UserApiFp(this.configuration).userPhoneNumberGet(userID, phoneNumberID, remoteAddress, userAgent, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Provides aggregated user stats for project
     * @param {string} granularity Data granularity
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {string} [sort] Field sorting
     * @param {Array<string>} [filter] Field filtering
     * @param {number} [page] Page number
     * @param {number} [pageSize] Number of items per page
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof UserApi
     */
    public userStatsList(granularity: string, remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig) {
        return UserApiFp(this.configuration).userStatsList(granularity, remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Updates a user
     * @param {string} userID ID of user
     * @param {UserUpdateReq} userUpdateReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof UserApi
     */
    public userUpdate(userID: string, userUpdateReq: UserUpdateReq, options?: RawAxiosRequestConfig) {
        return UserApiFp(this.configuration).userUpdate(userID, userUpdateReq, options).then((request) => request(this.axios, this.basePath));
    }
}



/**
 * ValidationApi - axios parameter creator
 * @export
 */
export const ValidationApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Validates email
         * @param {ValidateEmailReq} validateEmailReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        validateEmail: async (validateEmailReq: ValidateEmailReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'validateEmailReq' is not null or undefined
            assertParamExists('validateEmail', 'validateEmailReq', validateEmailReq)
            const localVarPath = `/v1/validate/email`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'PUT', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(validateEmailReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * Validates phone number
         * @param {ValidatePhoneNumberReq} validatePhoneNumberReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        validatePhoneNumber: async (validatePhoneNumberReq: ValidatePhoneNumberReq, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            // verify required parameter 'validatePhoneNumberReq' is not null or undefined
            assertParamExists('validatePhoneNumber', 'validatePhoneNumberReq', validatePhoneNumberReq)
            const localVarPath = `/v1/validate/phoneNumber`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'PUT', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(validatePhoneNumberReq, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * ValidationApi - functional programming interface
 * @export
 */
export const ValidationApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = ValidationApiAxiosParamCreator(configuration)
    return {
        /**
         * Validates email
         * @param {ValidateEmailReq} validateEmailReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async validateEmail(validateEmailReq: ValidateEmailReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<ValidateEmailRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.validateEmail(validateEmailReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['ValidationApi.validateEmail']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
        /**
         * Validates phone number
         * @param {ValidatePhoneNumberReq} validatePhoneNumberReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async validatePhoneNumber(validatePhoneNumberReq: ValidatePhoneNumberReq, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<ValidatePhoneNumberRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.validatePhoneNumber(validatePhoneNumberReq, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['ValidationApi.validatePhoneNumber']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * ValidationApi - factory interface
 * @export
 */
export const ValidationApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = ValidationApiFp(configuration)
    return {
        /**
         * Validates email
         * @param {ValidateEmailReq} validateEmailReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        validateEmail(validateEmailReq: ValidateEmailReq, options?: any): AxiosPromise<ValidateEmailRsp> {
            return localVarFp.validateEmail(validateEmailReq, options).then((request) => request(axios, basePath));
        },
        /**
         * Validates phone number
         * @param {ValidatePhoneNumberReq} validatePhoneNumberReq 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        validatePhoneNumber(validatePhoneNumberReq: ValidatePhoneNumberReq, options?: any): AxiosPromise<ValidatePhoneNumberRsp> {
            return localVarFp.validatePhoneNumber(validatePhoneNumberReq, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * ValidationApi - object-oriented interface
 * @export
 * @class ValidationApi
 * @extends {BaseAPI}
 */
export class ValidationApi extends BaseAPI {
    /**
     * Validates email
     * @param {ValidateEmailReq} validateEmailReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof ValidationApi
     */
    public validateEmail(validateEmailReq: ValidateEmailReq, options?: RawAxiosRequestConfig) {
        return ValidationApiFp(this.configuration).validateEmail(validateEmailReq, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * Validates phone number
     * @param {ValidatePhoneNumberReq} validatePhoneNumberReq 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof ValidationApi
     */
    public validatePhoneNumber(validatePhoneNumberReq: ValidatePhoneNumberReq, options?: RawAxiosRequestConfig) {
        return ValidationApiFp(this.configuration).validatePhoneNumber(validatePhoneNumberReq, options).then((request) => request(this.axios, this.basePath));
    }
}



/**
 * WebhookLogsApi - axios parameter creator
 * @export
 */
export const WebhookLogsApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * Lists webhook logs for given filters
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webhookLogsList: async (remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options: RawAxiosRequestConfig = {}): Promise<RequestArgs> => {
            const localVarPath = `/v1/webhookLogs`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            // authentication basicAuth required
            // http basic authentication required
            setBasicAuthToObject(localVarRequestOptions, configuration)

            // authentication projectID required
            await setApiKeyToObject(localVarHeaderParameter, "X-Corbado-ProjectID", configuration)

            // authentication bearerAuth required
            // http bearer authentication required
            await setBearerAuthToObject(localVarHeaderParameter, configuration)

            if (remoteAddress !== undefined) {
                localVarQueryParameter['remoteAddress'] = remoteAddress;
            }

            if (userAgent !== undefined) {
                localVarQueryParameter['userAgent'] = userAgent;
            }

            if (sort !== undefined) {
                localVarQueryParameter['sort'] = sort;
            }

            if (filter) {
                localVarQueryParameter['filter[]'] = filter;
            }

            if (page !== undefined) {
                localVarQueryParameter['page'] = page;
            }

            if (pageSize !== undefined) {
                localVarQueryParameter['pageSize'] = pageSize;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * WebhookLogsApi - functional programming interface
 * @export
 */
export const WebhookLogsApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = WebhookLogsApiAxiosParamCreator(configuration)
    return {
        /**
         * Lists webhook logs for given filters
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async webhookLogsList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<WebhookLogsListRsp>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.webhookLogsList(remoteAddress, userAgent, sort, filter, page, pageSize, options);
            const index = configuration?.serverIndex ?? 0;
            const operationBasePath = operationServerMap['WebhookLogsApi.webhookLogsList']?.[index]?.url;
            return (axios, basePath) => createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration)(axios, operationBasePath || basePath);
        },
    }
};

/**
 * WebhookLogsApi - factory interface
 * @export
 */
export const WebhookLogsApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = WebhookLogsApiFp(configuration)
    return {
        /**
         * Lists webhook logs for given filters
         * @param {string} [remoteAddress] Client\&#39;s remote address
         * @param {string} [userAgent] Client\&#39;s user agent
         * @param {string} [sort] Field sorting
         * @param {Array<string>} [filter] Field filtering
         * @param {number} [page] Page number
         * @param {number} [pageSize] Number of items per page
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        webhookLogsList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: any): AxiosPromise<WebhookLogsListRsp> {
            return localVarFp.webhookLogsList(remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * WebhookLogsApi - object-oriented interface
 * @export
 * @class WebhookLogsApi
 * @extends {BaseAPI}
 */
export class WebhookLogsApi extends BaseAPI {
    /**
     * Lists webhook logs for given filters
     * @param {string} [remoteAddress] Client\&#39;s remote address
     * @param {string} [userAgent] Client\&#39;s user agent
     * @param {string} [sort] Field sorting
     * @param {Array<string>} [filter] Field filtering
     * @param {number} [page] Page number
     * @param {number} [pageSize] Number of items per page
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof WebhookLogsApi
     */
    public webhookLogsList(remoteAddress?: string, userAgent?: string, sort?: string, filter?: Array<string>, page?: number, pageSize?: number, options?: RawAxiosRequestConfig) {
        return WebhookLogsApiFp(this.configuration).webhookLogsList(remoteAddress, userAgent, sort, filter, page, pageSize, options).then((request) => request(this.axios, this.basePath));
    }
}



