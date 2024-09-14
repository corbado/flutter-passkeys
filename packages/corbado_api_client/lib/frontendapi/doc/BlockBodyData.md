# corbado_api.model.BlockBodyData

## Load the model package
```dart
import 'package:corbado_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**challenge** | **String** |  | 
**identifierValue** | **String** |  | 
**identifierType** | [**LoginIdentifierType**](LoginIdentifierType.md) |  | 
**autoSubmit** | **bool** |  | 
**passkeyIconSet** | [**PasskeyIconSet**](PasskeyIconSet.md) |  | 
**variant** | **String** |  | 
**verificationMethod** | [**VerificationMethod**](VerificationMethod.md) |  | 
**identifier** | **String** |  | 
**alternativeVerificationMethods** | [**List<Object>**](Object.md) |  | [default to const []]
**isPostLoginVerification** | **bool** |  | 
**shortSession** | **String** |  | 
**identifiers** | [**List<LoginIdentifierWithError>**](LoginIdentifierWithError.md) |  | [default to const []]
**socialData** | [**SocialData**](SocialData.md) |  | 
**type** | [**LoginIdentifierType**](LoginIdentifierType.md) |  | 
**isPhone** | **bool** |  | 
**isPhoneAvailable** | **bool** |  | 
**isEmailAvailable** | **bool** |  | 
**isUsernameAvailable** | **bool** |  | 
**loginHint** | **String** |  | [optional] 
**retryNotBefore** | **int** |  | [optional] 
**error** | [**RequestError**](RequestError.md) |  | [optional] 
**longSession** | **String** | Only given when project environment is dev | [optional] 
**passkeyOperation** | [**PasskeyOperation**](PasskeyOperation.md) |  | [optional] 
**fullName** | [**FullNameWithError**](FullNameWithError.md) |  | [optional] 
**conditionalUIChallenge** | **String** |  | [optional] 
**fieldError** | [**RequestError**](RequestError.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


