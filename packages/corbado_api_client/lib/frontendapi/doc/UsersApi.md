# corbado_frontend_api_client.api.UsersApi

## Load the API package
```dart
import 'package:corbado_frontend_api_client/api.dart';
```

All URIs are relative to *https://&lt;project ID&gt;.frontendapi.corbado.io*

Method | HTTP request | Description
------------- | ------------- | -------------
[**currentUserDelete**](UsersApi.md#currentuserdelete) | **DELETE** /v2/me | 
[**currentUserGet**](UsersApi.md#currentuserget) | **GET** /v2/me | 
[**currentUserIdentifierCreate**](UsersApi.md#currentuseridentifiercreate) | **POST** /v2/me/identifier | 
[**currentUserIdentifierDelete**](UsersApi.md#currentuseridentifierdelete) | **DELETE** /v2/me/identifier | 
[**currentUserIdentifierUpdate**](UsersApi.md#currentuseridentifierupdate) | **PATCH** /v2/me/identifier | 
[**currentUserIdentifierVerifyFinish**](UsersApi.md#currentuseridentifierverifyfinish) | **POST** /v2/me/identifier/verify/finish | 
[**currentUserIdentifierVerifyStart**](UsersApi.md#currentuseridentifierverifystart) | **POST** /v2/me/identifier/verify/start | 
[**currentUserPasskeyAppendFinish**](UsersApi.md#currentuserpasskeyappendfinish) | **POST** /v2/me/passkeys/append/finish | 
[**currentUserPasskeyAppendStart**](UsersApi.md#currentuserpasskeyappendstart) | **POST** /v2/me/passkeys/append/start | 
[**currentUserPasskeyDelete**](UsersApi.md#currentuserpasskeydelete) | **DELETE** /v2/me/passkeys/{credentialID} | 
[**currentUserPasskeyGet**](UsersApi.md#currentuserpasskeyget) | **GET** /v2/me/passkeys | 
[**currentUserSessionLogout**](UsersApi.md#currentusersessionlogout) | **POST** /v2/me/logout | 
[**currentUserSessionRefresh**](UsersApi.md#currentusersessionrefresh) | **POST** /v2/me/refresh | 
[**currentUserUpdate**](UsersApi.md#currentuserupdate) | **PATCH** /v2/me | 


# **currentUserDelete**
> GenericRsp currentUserDelete()



Deletes current user

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getUsersApi();

try {
    final response = api.currentUserDelete();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->currentUserDelete: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GenericRsp**](GenericRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **currentUserGet**
> MeRsp currentUserGet()



Gets current user

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getUsersApi();

try {
    final response = api.currentUserGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->currentUserGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**MeRsp**](MeRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **currentUserIdentifierCreate**
> GenericRsp currentUserIdentifierCreate(meIdentifierCreateReq)



Creates an identifier

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getUsersApi();
final MeIdentifierCreateReq meIdentifierCreateReq = ; // MeIdentifierCreateReq | 

try {
    final response = api.currentUserIdentifierCreate(meIdentifierCreateReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->currentUserIdentifierCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **meIdentifierCreateReq** | [**MeIdentifierCreateReq**](MeIdentifierCreateReq.md)|  | 

### Return type

[**GenericRsp**](GenericRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **currentUserIdentifierDelete**
> GenericRsp currentUserIdentifierDelete(meIdentifierDeleteReq)



Deletes an identifier

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getUsersApi();
final MeIdentifierDeleteReq meIdentifierDeleteReq = ; // MeIdentifierDeleteReq | 

try {
    final response = api.currentUserIdentifierDelete(meIdentifierDeleteReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->currentUserIdentifierDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **meIdentifierDeleteReq** | [**MeIdentifierDeleteReq**](MeIdentifierDeleteReq.md)|  | 

### Return type

[**GenericRsp**](GenericRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **currentUserIdentifierUpdate**
> GenericRsp currentUserIdentifierUpdate(meIdentifierUpdateReq)



Modifies an identifier (only permitted for username; identifierID will change)

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getUsersApi();
final MeIdentifierUpdateReq meIdentifierUpdateReq = ; // MeIdentifierUpdateReq | 

try {
    final response = api.currentUserIdentifierUpdate(meIdentifierUpdateReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->currentUserIdentifierUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **meIdentifierUpdateReq** | [**MeIdentifierUpdateReq**](MeIdentifierUpdateReq.md)|  | 

### Return type

[**GenericRsp**](GenericRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **currentUserIdentifierVerifyFinish**
> GenericRsp currentUserIdentifierVerifyFinish(meIdentifierVerifyFinishReq)



Verifies challenge

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getUsersApi();
final MeIdentifierVerifyFinishReq meIdentifierVerifyFinishReq = ; // MeIdentifierVerifyFinishReq | 

try {
    final response = api.currentUserIdentifierVerifyFinish(meIdentifierVerifyFinishReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->currentUserIdentifierVerifyFinish: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **meIdentifierVerifyFinishReq** | [**MeIdentifierVerifyFinishReq**](MeIdentifierVerifyFinishReq.md)|  | 

### Return type

[**GenericRsp**](GenericRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **currentUserIdentifierVerifyStart**
> GenericRsp currentUserIdentifierVerifyStart(meIdentifierVerifyStartReq)



Creates challenge (only email otp and phone otp supported for now)

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getUsersApi();
final MeIdentifierVerifyStartReq meIdentifierVerifyStartReq = ; // MeIdentifierVerifyStartReq | 

try {
    final response = api.currentUserIdentifierVerifyStart(meIdentifierVerifyStartReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->currentUserIdentifierVerifyStart: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **meIdentifierVerifyStartReq** | [**MeIdentifierVerifyStartReq**](MeIdentifierVerifyStartReq.md)|  | 

### Return type

[**GenericRsp**](GenericRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **currentUserPasskeyAppendFinish**
> currentUserPasskeyAppendFinish(mePasskeysAppendFinishReq)



Finishes passkey append for current user

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getUsersApi();
final MePasskeysAppendFinishReq mePasskeysAppendFinishReq = ; // MePasskeysAppendFinishReq | 

try {
    api.currentUserPasskeyAppendFinish(mePasskeysAppendFinishReq);
} catch on DioException (e) {
    print('Exception when calling UsersApi->currentUserPasskeyAppendFinish: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **mePasskeysAppendFinishReq** | [**MePasskeysAppendFinishReq**](MePasskeysAppendFinishReq.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **currentUserPasskeyAppendStart**
> MePasskeysAppendStartRsp currentUserPasskeyAppendStart(mePasskeysAppendStartReq)



Starts passkey append for current user

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getUsersApi();
final MePasskeysAppendStartReq mePasskeysAppendStartReq = ; // MePasskeysAppendStartReq | 

try {
    final response = api.currentUserPasskeyAppendStart(mePasskeysAppendStartReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->currentUserPasskeyAppendStart: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **mePasskeysAppendStartReq** | [**MePasskeysAppendStartReq**](MePasskeysAppendStartReq.md)|  | 

### Return type

[**MePasskeysAppendStartRsp**](MePasskeysAppendStartRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **currentUserPasskeyDelete**
> MePasskeyDeleteRsp currentUserPasskeyDelete(credentialID)



Delete current user's passkeys

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getUsersApi();
final String credentialID = cre-abc123; // String | Credential ID from passkeys

try {
    final response = api.currentUserPasskeyDelete(credentialID);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->currentUserPasskeyDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **credentialID** | **String**| Credential ID from passkeys | 

### Return type

[**MePasskeyDeleteRsp**](MePasskeyDeleteRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **currentUserPasskeyGet**
> MePasskeyRsp currentUserPasskeyGet()



Gets current user's passkeys

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getUsersApi();

try {
    final response = api.currentUserPasskeyGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->currentUserPasskeyGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**MePasskeyRsp**](MePasskeyRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **currentUserSessionLogout**
> currentUserSessionLogout()



Performs session logout

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getUsersApi();

try {
    api.currentUserSessionLogout();
} catch on DioException (e) {
    print('Exception when calling UsersApi->currentUserSessionLogout: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **currentUserSessionRefresh**
> MeRefreshRsp currentUserSessionRefresh()



Performs session refresh

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getUsersApi();

try {
    final response = api.currentUserSessionRefresh();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->currentUserSessionRefresh: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**MeRefreshRsp**](MeRefreshRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **currentUserUpdate**
> GenericRsp currentUserUpdate(meUpdateReq)



Updates current user

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getUsersApi();
final MeUpdateReq meUpdateReq = ; // MeUpdateReq | 

try {
    final response = api.currentUserUpdate(meUpdateReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->currentUserUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **meUpdateReq** | [**MeUpdateReq**](MeUpdateReq.md)|  | 

### Return type

[**GenericRsp**](GenericRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

