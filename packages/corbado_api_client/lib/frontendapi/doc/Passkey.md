# corbado_api.model.Passkey

## Load the model package
```dart
import 'package:corbado_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**credentialID** | **String** |  | 
**attestationType** | **String** |  | 
**transport** | **List<String>** |  | [default to const []]
**backupEligible** | **bool** |  | 
**backupState** | **bool** |  | 
**authenticatorAAGUID** | **String** |  | 
**sourceOS** | **String** |  | 
**sourceBrowser** | **String** |  | 
**lastUsed** | **String** | Timestamp of when the passkey was last used in yyyy-MM-dd'T'HH:mm:ss format | 
**created** | **String** | Timestamp of when the entity was created in yyyy-MM-dd'T'HH:mm:ss format | 
**status** | **String** | Status | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

