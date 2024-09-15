# corbado_frontend_api_client.api.CorbadoConnectApi

## Load the API package
```dart
import 'package:corbado_frontend_api_client/api.dart';
```

All URIs are relative to *https://&lt;project ID&gt;.frontendapi.corbado.io*

Method | HTTP request | Description
------------- | ------------- | -------------
[**connectAppendFinish**](CorbadoConnectApi.md#connectappendfinish) | **POST** /v2/connect/append/finish | 
[**connectAppendInit**](CorbadoConnectApi.md#connectappendinit) | **POST** /v2/connect/append/init | 
[**connectAppendStart**](CorbadoConnectApi.md#connectappendstart) | **POST** /v2/connect/append/start | 
[**connectEventCreate**](CorbadoConnectApi.md#connecteventcreate) | **POST** /v2/connect/events | 
[**connectLoginFinish**](CorbadoConnectApi.md#connectloginfinish) | **POST** /v2/connect/login/finish | 
[**connectLoginInit**](CorbadoConnectApi.md#connectlogininit) | **POST** /v2/connect/login/init | 
[**connectLoginStart**](CorbadoConnectApi.md#connectloginstart) | **POST** /v2/connect/login/start | 
[**connectManageDelete**](CorbadoConnectApi.md#connectmanagedelete) | **POST** /v2/connect/manage/delete | 
[**connectManageInit**](CorbadoConnectApi.md#connectmanageinit) | **POST** /v2/connect/manage/init | 
[**connectManageList**](CorbadoConnectApi.md#connectmanagelist) | **POST** /v2/connect/manage/list | 


# **connectAppendFinish**
> ConnectAppendFinishRsp connectAppendFinish(connectAppendFinishReq)



Finishes an initialized connect passkey append process.

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getCorbadoConnectApi();
final ConnectAppendFinishReq connectAppendFinishReq = ; // ConnectAppendFinishReq | 

try {
    final response = api.connectAppendFinish(connectAppendFinishReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CorbadoConnectApi->connectAppendFinish: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connectAppendFinishReq** | [**ConnectAppendFinishReq**](ConnectAppendFinishReq.md)|  | 

### Return type

[**ConnectAppendFinishRsp**](ConnectAppendFinishRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **connectAppendInit**
> ConnectAppendInitRsp connectAppendInit(connectAppendInitReq)



Initializes a connect process for passkey append.

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getCorbadoConnectApi();
final ConnectAppendInitReq connectAppendInitReq = ; // ConnectAppendInitReq | 

try {
    final response = api.connectAppendInit(connectAppendInitReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CorbadoConnectApi->connectAppendInit: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connectAppendInitReq** | [**ConnectAppendInitReq**](ConnectAppendInitReq.md)|  | 

### Return type

[**ConnectAppendInitRsp**](ConnectAppendInitRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **connectAppendStart**
> ConnectAppendStartRsp connectAppendStart(connectAppendStartReq)



Starts an initialized connect passkey append process.

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getCorbadoConnectApi();
final ConnectAppendStartReq connectAppendStartReq = ; // ConnectAppendStartReq | 

try {
    final response = api.connectAppendStart(connectAppendStartReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CorbadoConnectApi->connectAppendStart: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connectAppendStartReq** | [**ConnectAppendStartReq**](ConnectAppendStartReq.md)|  | 

### Return type

[**ConnectAppendStartRsp**](ConnectAppendStartRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **connectEventCreate**
> connectEventCreate(connectEventCreateReq)



Creates a new user generated connect event.

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getCorbadoConnectApi();
final ConnectEventCreateReq connectEventCreateReq = ; // ConnectEventCreateReq | 

try {
    api.connectEventCreate(connectEventCreateReq);
} catch on DioException (e) {
    print('Exception when calling CorbadoConnectApi->connectEventCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connectEventCreateReq** | [**ConnectEventCreateReq**](ConnectEventCreateReq.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **connectLoginFinish**
> ConnectLoginFinishRsp connectLoginFinish(connectLoginFinishReq)



Finishes an initialized connect login process.

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getCorbadoConnectApi();
final ConnectLoginFinishReq connectLoginFinishReq = ; // ConnectLoginFinishReq | 

try {
    final response = api.connectLoginFinish(connectLoginFinishReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CorbadoConnectApi->connectLoginFinish: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connectLoginFinishReq** | [**ConnectLoginFinishReq**](ConnectLoginFinishReq.md)|  | 

### Return type

[**ConnectLoginFinishRsp**](ConnectLoginFinishRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **connectLoginInit**
> ConnectLoginInitRsp connectLoginInit(connectLoginInitReq)



Initializes a connect process for login.

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getCorbadoConnectApi();
final ConnectLoginInitReq connectLoginInitReq = ; // ConnectLoginInitReq | 

try {
    final response = api.connectLoginInit(connectLoginInitReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CorbadoConnectApi->connectLoginInit: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connectLoginInitReq** | [**ConnectLoginInitReq**](ConnectLoginInitReq.md)|  | 

### Return type

[**ConnectLoginInitRsp**](ConnectLoginInitRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **connectLoginStart**
> ConnectLoginStartRsp connectLoginStart(connectLoginStartReq)



Starts an initialized connect login process.

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getCorbadoConnectApi();
final ConnectLoginStartReq connectLoginStartReq = ; // ConnectLoginStartReq | 

try {
    final response = api.connectLoginStart(connectLoginStartReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CorbadoConnectApi->connectLoginStart: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connectLoginStartReq** | [**ConnectLoginStartReq**](ConnectLoginStartReq.md)|  | 

### Return type

[**ConnectLoginStartRsp**](ConnectLoginStartRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **connectManageDelete**
> ConnectManageDeleteRsp connectManageDelete(connectManageDeleteReq)



Deletes a passkey for a user identified by a connect token

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getCorbadoConnectApi();
final ConnectManageDeleteReq connectManageDeleteReq = ; // ConnectManageDeleteReq | 

try {
    final response = api.connectManageDelete(connectManageDeleteReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CorbadoConnectApi->connectManageDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connectManageDeleteReq** | [**ConnectManageDeleteReq**](ConnectManageDeleteReq.md)|  | 

### Return type

[**ConnectManageDeleteRsp**](ConnectManageDeleteRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **connectManageInit**
> ConnectManageInitRsp connectManageInit(connectManageInitReq)



Initializes a connect process for passkey management.

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getCorbadoConnectApi();
final ConnectManageInitReq connectManageInitReq = ; // ConnectManageInitReq | 

try {
    final response = api.connectManageInit(connectManageInitReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CorbadoConnectApi->connectManageInit: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connectManageInitReq** | [**ConnectManageInitReq**](ConnectManageInitReq.md)|  | 

### Return type

[**ConnectManageInitRsp**](ConnectManageInitRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **connectManageList**
> ConnectManageListRsp connectManageList(connectManageListReq)



Lists all passkeys for a user identifier by a connect token.

### Example
```dart
import 'package:corbado_frontend_api_client/api.dart';
// TODO Configure API key authorization: projectID
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('projectID').apiKeyPrefix = 'Bearer';

final api = CorbadoFrontendApiClient().getCorbadoConnectApi();
final ConnectManageListReq connectManageListReq = ; // ConnectManageListReq | 

try {
    final response = api.connectManageList(connectManageListReq);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CorbadoConnectApi->connectManageList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connectManageListReq** | [**ConnectManageListReq**](ConnectManageListReq.md)|  | 

### Return type

[**ConnectManageListRsp**](ConnectManageListRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

