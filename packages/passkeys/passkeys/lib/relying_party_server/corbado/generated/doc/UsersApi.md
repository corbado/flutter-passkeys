# corbado_api.api.UsersApi

## Load the API package
```dart
import 'package:corbado_api/api.dart';
```

All URIs are relative to *https://<project ID>.frontendapi.corbado.io*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authMethodsList**](UsersApi.md#authmethodslist) | **POST** /v1/users/authmethods | 
[**currentUserGet**](UsersApi.md#currentuserget) | **GET** /v1/me | 
[**emailLinkConfirm**](UsersApi.md#emaillinkconfirm) | **POST** /v1/users/emaillinks/confirm | 
[**emailLinkLoginStart**](UsersApi.md#emaillinkloginstart) | **POST** /v1/users/emaillinks/login/start | 
[**emailLinkRegisterStart**](UsersApi.md#emaillinkregisterstart) | **POST** /v1/users/emaillinks/register/start | 
[**emailLinkStatus**](UsersApi.md#emaillinkstatus) | **POST** /v1/users/emaillinks/status | 
[**loginToken**](UsersApi.md#logintoken) | **POST** /v1/users/logintoken | 
[**passKeyAppendFinish**](UsersApi.md#passkeyappendfinish) | **POST** /v1/users/passkey/append/finish | 
[**passKeyAppendStart**](UsersApi.md#passkeyappendstart) | **POST** /v1/users/passkey/append/start | 
[**passKeyLoginFinish**](UsersApi.md#passkeyloginfinish) | **POST** /v1/users/passkey/login/finish | 
[**passKeyLoginStart**](UsersApi.md#passkeyloginstart) | **POST** /v1/users/passkey/login/start | 
[**passKeyMediationStart**](UsersApi.md#passkeymediationstart) | **POST** /v1/users/passkey/mediation/start | 
[**passKeyRegisterFinish**](UsersApi.md#passkeyregisterfinish) | **POST** /v1/users/passkey/register/finish | 
[**passKeyRegisterStart**](UsersApi.md#passkeyregisterstart) | **POST** /v1/users/passkey/register/start | 
[**password**](UsersApi.md#password) | **POST** /v1/users/password/verify | 


# **authMethodsList**
> AuthMethodsListRsp authMethodsList(authMethodsListReq)



Lists user's available authentication methods

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
final authMethodsListReq = AuthMethodsListReq(); // AuthMethodsListReq | 

try {
    final result = api_instance.authMethodsList(authMethodsListReq);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->authMethodsList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authMethodsListReq** | [**AuthMethodsListReq**](AuthMethodsListReq.md)|  | 

### Return type

[**AuthMethodsListRsp**](AuthMethodsListRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **currentUserGet**
> MeRsp currentUserGet()



Gets current user

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

try {
    final result = api_instance.currentUserGet();
    print(result);
} catch (e) {
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

# **emailLinkConfirm**
> EmailLinkConfirmRsp emailLinkConfirm(emailLinkConfirmReq)



Performs email link register confirm

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
final emailLinkConfirmReq = EmailLinkConfirmReq(); // EmailLinkConfirmReq | 

try {
    final result = api_instance.emailLinkConfirm(emailLinkConfirmReq);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->emailLinkConfirm: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailLinkConfirmReq** | [**EmailLinkConfirmReq**](EmailLinkConfirmReq.md)|  | 

### Return type

[**EmailLinkConfirmRsp**](EmailLinkConfirmRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **emailLinkLoginStart**
> EmailLinkLoginStartRsp emailLinkLoginStart(emailLinkLoginStartReq)



Performs email link login start

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
final emailLinkLoginStartReq = EmailLinkLoginStartReq(); // EmailLinkLoginStartReq | 

try {
    final result = api_instance.emailLinkLoginStart(emailLinkLoginStartReq);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->emailLinkLoginStart: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailLinkLoginStartReq** | [**EmailLinkLoginStartReq**](EmailLinkLoginStartReq.md)|  | 

### Return type

[**EmailLinkLoginStartRsp**](EmailLinkLoginStartRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **emailLinkRegisterStart**
> EmailLinkRegisterStartRsp emailLinkRegisterStart(emailLinkRegisterStartReq)



Performs email link register start

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
final emailLinkRegisterStartReq = EmailLinkRegisterStartReq(); // EmailLinkRegisterStartReq | 

try {
    final result = api_instance.emailLinkRegisterStart(emailLinkRegisterStartReq);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->emailLinkRegisterStart: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailLinkRegisterStartReq** | [**EmailLinkRegisterStartReq**](EmailLinkRegisterStartReq.md)|  | 

### Return type

[**EmailLinkRegisterStartRsp**](EmailLinkRegisterStartRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **emailLinkStatus**
> EmailLinkStatusRsp emailLinkStatus(emailLinkStatusReq)



Performs email link login status check

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
final emailLinkStatusReq = EmailLinkStatusReq(); // EmailLinkStatusReq | 

try {
    final result = api_instance.emailLinkStatus(emailLinkStatusReq);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->emailLinkStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailLinkStatusReq** | [**EmailLinkStatusReq**](EmailLinkStatusReq.md)|  | 

### Return type

[**EmailLinkStatusRsp**](EmailLinkStatusRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **loginToken**
> LoginTokenRsp loginToken(loginTokenReq)



Performs login for given token

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
final loginTokenReq = LoginTokenReq(); // LoginTokenReq | 

try {
    final result = api_instance.loginToken(loginTokenReq);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->loginToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginTokenReq** | [**LoginTokenReq**](LoginTokenReq.md)|  | 

### Return type

[**LoginTokenRsp**](LoginTokenRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

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

# **passKeyMediationStart**
> PassKeyMediationStartRsp passKeyMediationStart(passKeyMediationStartReq)



Performs passkey mediation start

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
final passKeyMediationStartReq = PassKeyMediationStartReq(); // PassKeyMediationStartReq | 

try {
    final result = api_instance.passKeyMediationStart(passKeyMediationStartReq);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->passKeyMediationStart: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passKeyMediationStartReq** | [**PassKeyMediationStartReq**](PassKeyMediationStartReq.md)|  | 

### Return type

[**PassKeyMediationStartRsp**](PassKeyMediationStartRsp.md)

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

# **password**
> PasswordVerifyRsp password(passwordVerifyReq)



Performs password verify

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
final passwordVerifyReq = PasswordVerifyReq(); // PasswordVerifyReq | 

try {
    final result = api_instance.password(passwordVerifyReq);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->password: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passwordVerifyReq** | [**PasswordVerifyReq**](PasswordVerifyReq.md)|  | 

### Return type

[**PasswordVerifyRsp**](PasswordVerifyRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

