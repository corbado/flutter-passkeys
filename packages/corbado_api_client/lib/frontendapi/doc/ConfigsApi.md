# corbado_frontend_api_client.api.ConfigsApi

## Load the API package
```dart
import 'package:corbado_frontend_api_client/api.dart';
```

All URIs are relative to *https://&lt;project ID&gt;.frontendapi.corbado.io*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getSessionConfig**](ConfigsApi.md#getsessionconfig) | **GET** /v2/session-config | 
[**getUserDetailsConfig**](ConfigsApi.md#getuserdetailsconfig) | **GET** /v2/user-details-config | 


# **getSessionConfig**
> SessionConfigRsp getSessionConfig()



tbd

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getConfigsApi();

try {
    final response = api.getSessionConfig();
    print(response);
} catch on DioException (e) {
    print('Exception when calling ConfigsApi->getSessionConfig: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**SessionConfigRsp**](SessionConfigRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserDetailsConfig**
> UserDetailsConfigRsp getUserDetailsConfig()



Gets configs needed by the UserDetails component

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getConfigsApi();

try {
    final response = api.getUserDetailsConfig();
    print(response);
} catch on DioException (e) {
    print('Exception when calling ConfigsApi->getUserDetailsConfig: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserDetailsConfigRsp**](UserDetailsConfigRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

