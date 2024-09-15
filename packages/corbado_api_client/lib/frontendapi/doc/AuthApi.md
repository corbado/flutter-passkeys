# corbado_frontend_api_client.api.AuthApi

## Load the API package
```dart
import 'package:corbado_frontend_api_client/api.dart';
```

All URIs are relative to *https://&lt;project ID&gt;.frontendapi.corbado.io*

Method | HTTP request | Description
------------- | ------------- | -------------
[**blockSkip**](AuthApi.md#blockskip) | **POST** /v2/auth/block/skip | 
[**eventCreate**](AuthApi.md#eventcreate) | **POST** /v2/auth/events | 
[**identifierUpdate**](AuthApi.md#identifierupdate) | **POST** /v2/auth/identifier/update | 
[**identifierVerifyFinish**](AuthApi.md#identifierverifyfinish) | **POST** /v2/auth/identifier/verify/finish | 
[**identifierVerifyStart**](AuthApi.md#identifierverifystart) | **POST** /v2/auth/identifier/verify/start | 
[**identifierVerifyStatus**](AuthApi.md#identifierverifystatus) | **GET** /v2/auth/identifier/verify/status | 
[**loginInit**](AuthApi.md#logininit) | **POST** /v2/auth/login/init | 
[**passkeyAppendFinish**](AuthApi.md#passkeyappendfinish) | **POST** /v2/auth/passkey/append/finish | 
[**passkeyAppendStart**](AuthApi.md#passkeyappendstart) | **POST** /v2/auth/passkey/append/start | 
[**passkeyLoginFinish**](AuthApi.md#passkeyloginfinish) | **POST** /v2/auth/passkey/login/finish | 
[**passkeyLoginStart**](AuthApi.md#passkeyloginstart) | **POST** /v2/auth/passkey/login/start | 
[**passkeyMediationFinish**](AuthApi.md#passkeymediationfinish) | **POST** /v2/auth/passkey/mediation/finish | 
[**processComplete**](AuthApi.md#processcomplete) | **POST** /v2/auth/process/complete | 
[**processGet**](AuthApi.md#processget) | **GET** /v2/auth/process | 
[**processInit**](AuthApi.md#processinit) | **POST** /v2/auth/process/init | 
[**processReset**](AuthApi.md#processreset) | **POST** /v2/auth/process/reset | 
[**signupInit**](AuthApi.md#signupinit) | **POST** /v2/auth/signup/init | 
[**socialVerifyCallback**](AuthApi.md#socialverifycallback) | **GET** /v2/auth/social/verify/callback | 
[**socialVerifyFinish**](AuthApi.md#socialverifyfinish) | **POST** /v2/auth/social/verify/finish | 
[**socialVerifyStart**](AuthApi.md#socialverifystart) | **POST** /v2/auth/social/verify/start | 


# **blockSkip**
> ProcessResponse blockSkip()



tbd

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getAuthApi();

try {
    final response = api.blockSkip();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->blockSkip: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ProcessResponse**](ProcessResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventCreate**
> eventCreate(eventCreateReq)



Creates a new user generated complete event.

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getAuthApi();
final EventCreateReq eventCreateReq = ; // EventCreateReq | 

try {
    api.eventCreate(eventCreateReq);
} catch on DioException (e) {
    print('Exception when calling AuthApi->eventCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventCreateReq** | [**EventCreateReq**](EventCreateReq.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **identifierUpdate**
> ProcessResponse identifierUpdate(identifierUpdateReq)



tbd

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getAuthApi();
final IdentifierUpdateReq identifierUpdateReq = ; // IdentifierUpdateReq | 

try {
    final response = api.identifierUpdate(identifierUpdateReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->identifierUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **identifierUpdateReq** | [**IdentifierUpdateReq**](IdentifierUpdateReq.md)|  | 

### Return type

[**ProcessResponse**](ProcessResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **identifierVerifyFinish**
> ProcessResponse identifierVerifyFinish(identifierVerifyFinishReq)



tbd

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getAuthApi();
final IdentifierVerifyFinishReq identifierVerifyFinishReq = ; // IdentifierVerifyFinishReq | 

try {
    final response = api.identifierVerifyFinish(identifierVerifyFinishReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->identifierVerifyFinish: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **identifierVerifyFinishReq** | [**IdentifierVerifyFinishReq**](IdentifierVerifyFinishReq.md)|  | 

### Return type

[**ProcessResponse**](ProcessResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **identifierVerifyStart**
> ProcessResponse identifierVerifyStart(identifierVerifyStartReq)



tbd

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getAuthApi();
final IdentifierVerifyStartReq identifierVerifyStartReq = ; // IdentifierVerifyStartReq | 

try {
    final response = api.identifierVerifyStart(identifierVerifyStartReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->identifierVerifyStart: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **identifierVerifyStartReq** | [**IdentifierVerifyStartReq**](IdentifierVerifyStartReq.md)|  | 

### Return type

[**ProcessResponse**](ProcessResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **identifierVerifyStatus**
> ProcessResponse identifierVerifyStatus()



tbd

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getAuthApi();

try {
    final response = api.identifierVerifyStatus();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->identifierVerifyStatus: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ProcessResponse**](ProcessResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **loginInit**
> ProcessResponse loginInit(loginInitReq)



tbd

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getAuthApi();
final LoginInitReq loginInitReq = ; // LoginInitReq | 

try {
    final response = api.loginInit(loginInitReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->loginInit: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginInitReq** | [**LoginInitReq**](LoginInitReq.md)|  | 

### Return type

[**ProcessResponse**](ProcessResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **passkeyAppendFinish**
> ProcessResponse passkeyAppendFinish(passkeyAppendFinishReq)



tbd

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getAuthApi();
final PasskeyAppendFinishReq passkeyAppendFinishReq = ; // PasskeyAppendFinishReq | 

try {
    final response = api.passkeyAppendFinish(passkeyAppendFinishReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->passkeyAppendFinish: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passkeyAppendFinishReq** | [**PasskeyAppendFinishReq**](PasskeyAppendFinishReq.md)|  | 

### Return type

[**ProcessResponse**](ProcessResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **passkeyAppendStart**
> ProcessResponse passkeyAppendStart(passkeyAppendStartReq)



tbd

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getAuthApi();
final PasskeyAppendStartReq passkeyAppendStartReq = ; // PasskeyAppendStartReq | 

try {
    final response = api.passkeyAppendStart(passkeyAppendStartReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->passkeyAppendStart: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passkeyAppendStartReq** | [**PasskeyAppendStartReq**](PasskeyAppendStartReq.md)|  | 

### Return type

[**ProcessResponse**](ProcessResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **passkeyLoginFinish**
> ProcessResponse passkeyLoginFinish(passkeyLoginFinishReq)



tbd

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getAuthApi();
final PasskeyLoginFinishReq passkeyLoginFinishReq = ; // PasskeyLoginFinishReq | 

try {
    final response = api.passkeyLoginFinish(passkeyLoginFinishReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->passkeyLoginFinish: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passkeyLoginFinishReq** | [**PasskeyLoginFinishReq**](PasskeyLoginFinishReq.md)|  | 

### Return type

[**ProcessResponse**](ProcessResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **passkeyLoginStart**
> ProcessResponse passkeyLoginStart(passkeyLoginStartReq)



tbd

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getAuthApi();
final PasskeyLoginStartReq passkeyLoginStartReq = ; // PasskeyLoginStartReq | 

try {
    final response = api.passkeyLoginStart(passkeyLoginStartReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->passkeyLoginStart: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passkeyLoginStartReq** | [**PasskeyLoginStartReq**](PasskeyLoginStartReq.md)|  | 

### Return type

[**ProcessResponse**](ProcessResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **passkeyMediationFinish**
> ProcessResponse passkeyMediationFinish(passkeyMediationFinishReq)



tbd

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getAuthApi();
final PasskeyMediationFinishReq passkeyMediationFinishReq = ; // PasskeyMediationFinishReq | 

try {
    final response = api.passkeyMediationFinish(passkeyMediationFinishReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->passkeyMediationFinish: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passkeyMediationFinishReq** | [**PasskeyMediationFinishReq**](PasskeyMediationFinishReq.md)|  | 

### Return type

[**ProcessResponse**](ProcessResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **processComplete**
> ProcessResponse processComplete()



tbd

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getAuthApi();

try {
    final response = api.processComplete();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->processComplete: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ProcessResponse**](ProcessResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **processGet**
> ProcessResponse processGet(preferredBlock)



tbd

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getAuthApi();
final BlockType preferredBlock = ; // BlockType | 

try {
    final response = api.processGet(preferredBlock);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->processGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **preferredBlock** | [**BlockType**](.md)|  | [optional] 

### Return type

[**ProcessResponse**](ProcessResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **processInit**
> ProcessInitRsp processInit(processInitReq)



tbd

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getAuthApi();
final ProcessInitReq processInitReq = ; // ProcessInitReq | 

try {
    final response = api.processInit(processInitReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->processInit: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **processInitReq** | [**ProcessInitReq**](ProcessInitReq.md)|  | 

### Return type

[**ProcessInitRsp**](ProcessInitRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **processReset**
> ProcessResponse processReset()



tbd

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getAuthApi();

try {
    final response = api.processReset();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->processReset: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ProcessResponse**](ProcessResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **signupInit**
> ProcessResponse signupInit(signupInitReq)



tbd

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getAuthApi();
final SignupInitReq signupInitReq = ; // SignupInitReq | 

try {
    final response = api.signupInit(signupInitReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->signupInit: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **signupInitReq** | [**SignupInitReq**](SignupInitReq.md)|  | 

### Return type

[**ProcessResponse**](ProcessResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **socialVerifyCallback**
> socialVerifyCallback()



tbd

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getAuthApi();

try {
    api.socialVerifyCallback();
} catch on DioException (e) {
    print('Exception when calling AuthApi->socialVerifyCallback: $e\n');
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

# **socialVerifyFinish**
> ProcessResponse socialVerifyFinish(body)



tbd

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getAuthApi();
final JsonObject body = Object; // JsonObject | 

try {
    final response = api.socialVerifyFinish(body);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->socialVerifyFinish: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **JsonObject**|  | 

### Return type

[**ProcessResponse**](ProcessResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **socialVerifyStart**
> ProcessResponse socialVerifyStart(socialVerifyStartReq)



tbd

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getAuthApi();
final SocialVerifyStartReq socialVerifyStartReq = ; // SocialVerifyStartReq | 

try {
    final response = api.socialVerifyStart(socialVerifyStartReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->socialVerifyStart: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **socialVerifyStartReq** | [**SocialVerifyStartReq**](SocialVerifyStartReq.md)|  | 

### Return type

[**ProcessResponse**](ProcessResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

