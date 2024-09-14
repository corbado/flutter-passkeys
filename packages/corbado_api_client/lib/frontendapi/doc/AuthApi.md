# corbado_api.api.AuthApi

## Load the API package
```dart
import 'package:corbado_api/api.dart';
```

All URIs are relative to *https://<project ID>.frontendapi.corbado.io*

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
[**phoneCollect**](AuthApi.md#phonecollect) | **POST** /v2/auth/phone/collect | 
[**processComplete**](AuthApi.md#processcomplete) | **POST** /v2/auth/process/complete | 
[**processGet**](AuthApi.md#processget) | **GET** /v2/auth/process | 
[**processInit**](AuthApi.md#processinit) | **POST** /v2/auth/process/init | 
[**processReset**](AuthApi.md#processreset) | **POST** /v2/auth/process/reset | 
[**signupInit**](AuthApi.md#signupinit) | **POST** /v2/auth/signup/init | 
[**socialVerifyCallback**](AuthApi.md#socialverifycallback) | **GET** /v2/auth/social/verify/callback | 
[**socialVerifyFinish**](AuthApi.md#socialverifyfinish) | **POST** /v2/auth/social/verify/finish | 
[**socialVerifyStart**](AuthApi.md#socialverifystart) | **POST** /v2/auth/social/verify/start | 
[**usernameCollect**](AuthApi.md#usernamecollect) | **POST** /v2/auth/username/collect | 


# **blockSkip**
> ProcessResponse blockSkip()



tbd

### Example
```dart
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();

try {
    final result = api_instance.blockSkip();
    print(result);
} catch (e) {
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
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final eventCreateReq = EventCreateReq(); // EventCreateReq | 

try {
    api_instance.eventCreate(eventCreateReq);
} catch (e) {
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
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final identifierUpdateReq = IdentifierUpdateReq(); // IdentifierUpdateReq | 

try {
    final result = api_instance.identifierUpdate(identifierUpdateReq);
    print(result);
} catch (e) {
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
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final identifierVerifyFinishReq = IdentifierVerifyFinishReq(); // IdentifierVerifyFinishReq | 

try {
    final result = api_instance.identifierVerifyFinish(identifierVerifyFinishReq);
    print(result);
} catch (e) {
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
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final identifierVerifyStartReq = IdentifierVerifyStartReq(); // IdentifierVerifyStartReq | 

try {
    final result = api_instance.identifierVerifyStart(identifierVerifyStartReq);
    print(result);
} catch (e) {
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
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();

try {
    final result = api_instance.identifierVerifyStatus();
    print(result);
} catch (e) {
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
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final loginInitReq = LoginInitReq(); // LoginInitReq | 

try {
    final result = api_instance.loginInit(loginInitReq);
    print(result);
} catch (e) {
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
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final passkeyAppendFinishReq = PasskeyAppendFinishReq(); // PasskeyAppendFinishReq | 

try {
    final result = api_instance.passkeyAppendFinish(passkeyAppendFinishReq);
    print(result);
} catch (e) {
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
> ProcessResponse passkeyAppendStart(body)



tbd

### Example
```dart
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final body = Object(); // Object | 

try {
    final result = api_instance.passkeyAppendStart(body);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->passkeyAppendStart: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **Object**|  | 

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
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final passkeyLoginFinishReq = PasskeyLoginFinishReq(); // PasskeyLoginFinishReq | 

try {
    final result = api_instance.passkeyLoginFinish(passkeyLoginFinishReq);
    print(result);
} catch (e) {
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
> ProcessResponse passkeyLoginStart(body)



tbd

### Example
```dart
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final body = Object(); // Object | 

try {
    final result = api_instance.passkeyLoginStart(body);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->passkeyLoginStart: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **Object**|  | 

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
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final passkeyMediationFinishReq = PasskeyMediationFinishReq(); // PasskeyMediationFinishReq | 

try {
    final result = api_instance.passkeyMediationFinish(passkeyMediationFinishReq);
    print(result);
} catch (e) {
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

# **phoneCollect**
> ProcessResponse phoneCollect(phoneCollectReq)



tbd

### Example
```dart
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final phoneCollectReq = PhoneCollectReq(); // PhoneCollectReq | 

try {
    final result = api_instance.phoneCollect(phoneCollectReq);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->phoneCollect: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **phoneCollectReq** | [**PhoneCollectReq**](PhoneCollectReq.md)|  | 

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
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();

try {
    final result = api_instance.processComplete();
    print(result);
} catch (e) {
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
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final preferredBlock = ; // BlockType | 

try {
    final result = api_instance.processGet(preferredBlock);
    print(result);
} catch (e) {
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
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final processInitReq = ProcessInitReq(); // ProcessInitReq | 

try {
    final result = api_instance.processInit(processInitReq);
    print(result);
} catch (e) {
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
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();

try {
    final result = api_instance.processReset();
    print(result);
} catch (e) {
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
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final signupInitReq = SignupInitReq(); // SignupInitReq | 

try {
    final result = api_instance.signupInit(signupInitReq);
    print(result);
} catch (e) {
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
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();

try {
    api_instance.socialVerifyCallback();
} catch (e) {
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
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final body = Object(); // Object | 

try {
    final result = api_instance.socialVerifyFinish(body);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->socialVerifyFinish: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **Object**|  | 

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
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final socialVerifyStartReq = SocialVerifyStartReq(); // SocialVerifyStartReq | 

try {
    final result = api_instance.socialVerifyStart(socialVerifyStartReq);
    print(result);
} catch (e) {
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

# **usernameCollect**
> ProcessResponse usernameCollect(usernameCollectReq)



tbd

### Example
```dart
import 'package:corbado_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final usernameCollectReq = UsernameCollectReq(); // UsernameCollectReq | 

try {
    final result = api_instance.usernameCollect(usernameCollectReq);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->usernameCollect: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **usernameCollectReq** | [**UsernameCollectReq**](UsernameCollectReq.md)|  | 

### Return type

[**ProcessResponse**](ProcessResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

