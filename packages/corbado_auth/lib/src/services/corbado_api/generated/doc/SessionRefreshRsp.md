# corbado_api.model.SessionRefreshRsp

## Load the model package
```dart
import 'package:corbado_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**httpStatusCode** | **int** | HTTP status code of operation | 
**message** | **String** |  | 
**requestData** | [**RequestData**](RequestData.md) |  | 
**runtime** | **double** | Runtime in seconds for this request | 
**redirectURL** | **String** |  | 
**sessionToken** | **String** | Only given when using session v1 | [optional] 
**longSession** | **String** | Only given when project environment is dev | [optional] 
**shortSession** | [**ShortSession**](ShortSession.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


