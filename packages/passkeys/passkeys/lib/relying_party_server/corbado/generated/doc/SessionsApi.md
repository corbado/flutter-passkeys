# corbado_api.api.SessionsApi

## Load the API package
```dart
import 'package:corbado_api/api.dart';
```

All URIs are relative to *https://<project ID>.frontendapi.corbado.io*

Method | HTTP request | Description
------------- | ------------- | -------------
[**sessionLogout**](SessionsApi.md#sessionlogout) | **DELETE** /v1/sessions/logout | 
[**sessionRefresh**](SessionsApi.md#sessionrefresh) | **PUT** /v1/sessions/refresh | 
[**wellKnownJWKSList**](SessionsApi.md#wellknownjwkslist) | **GET** /.well-known/jwks | 


# **sessionLogout**
> LogoutRsp sessionLogout(emptyReq)



Performs session logout

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

final api_instance = SessionsApi();
final emptyReq = EmptyReq(); // EmptyReq | 

try {
    final result = api_instance.sessionLogout(emptyReq);
    print(result);
} catch (e) {
    print('Exception when calling SessionsApi->sessionLogout: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emptyReq** | [**EmptyReq**](EmptyReq.md)|  | 

### Return type

[**LogoutRsp**](LogoutRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sessionRefresh**
> SessionRefreshRsp sessionRefresh(emptyReq)



Performs session refresh

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

final api_instance = SessionsApi();
final emptyReq = EmptyReq(); // EmptyReq | 

try {
    final result = api_instance.sessionRefresh(emptyReq);
    print(result);
} catch (e) {
    print('Exception when calling SessionsApi->sessionRefresh: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emptyReq** | [**EmptyReq**](EmptyReq.md)|  | 

### Return type

[**SessionRefreshRsp**](SessionRefreshRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **wellKnownJWKSList**
> WellKnownJWKSListRsp wellKnownJWKSList()



Retrieves well-known JWKS for Project ID

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

final api_instance = SessionsApi();

try {
    final result = api_instance.wellKnownJWKSList();
    print(result);
} catch (e) {
    print('Exception when calling SessionsApi->wellKnownJWKSList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**WellKnownJWKSListRsp**](WellKnownJWKSListRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

