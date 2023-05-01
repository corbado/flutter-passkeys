# corbado_api.model.FullUser

## Load the model package
```dart
import 'package:corbado_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**ID** | **String** | ID of the user | 
**name** | **String** |  | 
**fullName** | **String** |  | 
**created** | **String** | Timestamp of when the entity was created in yyyy-MM-dd'T'HH:mm:ss format | 
**updated** | **String** | Timestamp of when the entity was last updated in yyyy-MM-dd'T'HH:mm:ss format | 
**status** | [**Status**](Status.md) |  | 
**emails** | [**List<UserEmail>**](UserEmail.md) |  | [default to const []]
**phoneNumbers** | [**List<UserPhoneNumber>**](UserPhoneNumber.md) |  | [default to const []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


