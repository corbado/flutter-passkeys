# corbado_api.api.UsersApi

## Load the API package
```dart
import 'package:corbado_api/api.dart';
```

All URIs are relative to *https://auth.corbado.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**passKeyAppendFinish**](UsersApi.md#passkeyappendfinish) | **POST** /v1/users/passkey/append/finish | 
[**passKeyAppendStart**](UsersApi.md#passkeyappendstart) | **POST** /v1/users/passkey/append/start | 
[**passKeyLoginFinish**](UsersApi.md#passkeyloginfinish) | **POST** /v1/users/passkey/login/finish | 
[**passKeyLoginStart**](UsersApi.md#passkeyloginstart) | **POST** /v1/users/passkey/login/start | 
[**passKeyRegisterFinish**](UsersApi.md#passkeyregisterfinish) | **POST** /v1/users/passkey/register/finish | 
[**passKeyRegisterStart**](UsersApi.md#passkeyregisterstart) | **POST** /v1/users/passkey/register/start | 


# **passKeyAppendFinish**
> PassKeyAppendFinishRsp passKeyAppendFinish(passKeyFinishReq)



Performs passkey append finish

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

final api_instance = UsersApi();
final passKeyFinishReq = PassKeyFinishReq(); // PassKeyFinishReq | 

try {
    final result = api_instance.passKeyAppendFinish(passKeyFinishReq);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->passKeyAppendFinish: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passKeyFinishReq** | [**PassKeyFinishReq**](PassKeyFinishReq.md)|  | 

### Return type

[**PassKeyAppendFinishRsp**](PassKeyAppendFinishRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **passKeyAppendStart**
> PassKeyStartRsp passKeyAppendStart(emptyReq)



Performs passkey append start

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

final api_instance = UsersApi();
final emptyReq = EmptyReq(); // EmptyReq | 

try {
    final result = api_instance.passKeyAppendStart(emptyReq);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->passKeyAppendStart: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emptyReq** | [**EmptyReq**](EmptyReq.md)|  | 

### Return type

[**PassKeyStartRsp**](PassKeyStartRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **passKeyLoginFinish**
> PassKeyLoginFinishRsp passKeyLoginFinish(passKeyFinishReq)



Performs passkey login finish

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

final api_instance = UsersApi();
final passKeyFinishReq = PassKeyFinishReq(); // PassKeyFinishReq | 

try {
    final result = api_instance.passKeyLoginFinish(passKeyFinishReq);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->passKeyLoginFinish: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passKeyFinishReq** | [**PassKeyFinishReq**](PassKeyFinishReq.md)|  | 

### Return type

[**PassKeyLoginFinishRsp**](PassKeyLoginFinishRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **passKeyLoginStart**
> PassKeyStartRsp passKeyLoginStart(passKeyLoginStartReq)



Performs passkey login start

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

final api_instance = UsersApi();
final passKeyLoginStartReq = PassKeyLoginStartReq(); // PassKeyLoginStartReq | 

try {
    final result = api_instance.passKeyLoginStart(passKeyLoginStartReq);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->passKeyLoginStart: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passKeyLoginStartReq** | [**PassKeyLoginStartReq**](PassKeyLoginStartReq.md)|  | 

### Return type

[**PassKeyStartRsp**](PassKeyStartRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **passKeyRegisterFinish**
> PassKeyRegisterFinishRsp passKeyRegisterFinish(passKeyFinishReq)



Performs passkey register finish

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

final api_instance = UsersApi();
final passKeyFinishReq = PassKeyFinishReq(); // PassKeyFinishReq | 

try {
    final result = api_instance.passKeyRegisterFinish(passKeyFinishReq);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->passKeyRegisterFinish: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passKeyFinishReq** | [**PassKeyFinishReq**](PassKeyFinishReq.md)|  | 

### Return type

[**PassKeyRegisterFinishRsp**](PassKeyRegisterFinishRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **passKeyRegisterStart**
> PassKeyStartRsp passKeyRegisterStart(passKeyRegisterStartReq)



Performs passkey register start

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

final api_instance = UsersApi();
final passKeyRegisterStartReq = PassKeyRegisterStartReq(); // PassKeyRegisterStartReq | 

try {
    final result = api_instance.passKeyRegisterStart(passKeyRegisterStartReq);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->passKeyRegisterStart: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passKeyRegisterStartReq** | [**PassKeyRegisterStartReq**](PassKeyRegisterStartReq.md)|  | 

### Return type

[**PassKeyStartRsp**](PassKeyStartRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

