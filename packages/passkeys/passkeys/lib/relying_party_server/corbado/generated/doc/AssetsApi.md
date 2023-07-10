# corbado_api.api.AssetsApi

## Load the API package
```dart
import 'package:corbado_api/api.dart';
```

All URIs are relative to *https://<project ID>.frontendapi.corbado.io*

Method | HTTP request | Description
------------- | ------------- | -------------
[**appleAppSiteAssociation**](AssetsApi.md#appleappsiteassociation) | **GET** /.well-known/apple-app-site-association | 
[**assetLinks**](AssetsApi.md#assetlinks) | **GET** /.well-known/assetlinks.json | 


# **appleAppSiteAssociation**
> AppleAppSiteAssociationRsp appleAppSiteAssociation()



Provides apple app site association

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

final api_instance = AssetsApi();

try {
    final result = api_instance.appleAppSiteAssociation();
    print(result);
} catch (e) {
    print('Exception when calling AssetsApi->appleAppSiteAssociation: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AppleAppSiteAssociationRsp**](AppleAppSiteAssociationRsp.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **assetLinks**
> List<AssetLink> assetLinks()



Provides asset links for android devices

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

final api_instance = AssetsApi();

try {
    final result = api_instance.assetLinks();
    print(result);
} catch (e) {
    print('Exception when calling AssetsApi->assetLinks: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<AssetLink>**](AssetLink.md)

### Authorization

[bearerAuth](../README.md#bearerAuth), [projectID](../README.md#projectID)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

