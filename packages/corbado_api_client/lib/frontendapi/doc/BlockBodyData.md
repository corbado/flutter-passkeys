# corbado_frontend_api_client.model.BlockBodyData

## Load the model package
```dart
import 'package:corbado_frontend_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**blockType** | **String** |  | 
**challenge** | **String** |  | 
**identifierValue** | **String** |  | 
**identifierType** | [**LoginIdentifierType**](LoginIdentifierType.md) |  | 
**autoSubmit** | **bool** |  | 
**passkeyIconSet** | [**PasskeyIconSet**](PasskeyIconSet.md) |  | 
**variant** | **String** |  | 
**verificationMethod** | [**VerificationMethod**](VerificationMethod.md) |  | 
**identifier** | **String** |  | 
**alternativeVerificationMethods** | [**BuiltList&lt;GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner&gt;**](GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner.md) |  | 
**isPostLoginVerification** | **bool** |  | 
**shortSession** | **String** |  | 
**identifiers** | [**BuiltList&lt;LoginIdentifierWithError&gt;**](LoginIdentifierWithError.md) |  | 
**socialData** | [**SocialData**](SocialData.md) |  | 
**isPhone** | **bool** |  | 
**isPhoneAvailable** | **bool** |  | 
**isEmailAvailable** | **bool** |  | 
**isUsernameAvailable** | **bool** |  | 
**loginHint** | **String** |  | [optional] 
**retryNotBefore** | **int** |  | [optional] 
**error** | [**RequestError**](RequestError.md) |  | [optional] 
**longSession** | **String** | Only given when project environment is dev 1 | [optional] 
**passkeyOperation** | [**PasskeyOperation**](PasskeyOperation.md) |  | [optional] 
**fullName** | [**FullNameWithError**](FullNameWithError.md) |  | [optional] 
**conditionalUIChallenge** | **String** |  | [optional] 
**fieldError** | [**RequestError**](RequestError.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


