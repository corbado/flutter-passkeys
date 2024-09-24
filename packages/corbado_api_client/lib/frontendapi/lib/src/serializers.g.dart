// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(AuthType.serializer)
      ..add(BlockBody.serializer)
      ..add(BlockBodyData.serializer)
      ..add(BlockType.serializer)
      ..add(ClientCapabilities.serializer)
      ..add(ClientInformation.serializer)
      ..add(ConnectAppendFinishReq.serializer)
      ..add(ConnectAppendFinishRsp.serializer)
      ..add(ConnectAppendInitReq.serializer)
      ..add(ConnectAppendInitRsp.serializer)
      ..add(ConnectAppendStartReq.serializer)
      ..add(ConnectAppendStartRsp.serializer)
      ..add(ConnectAppendStartRspVariantEnum.serializer)
      ..add(ConnectEventCreateReq.serializer)
      ..add(ConnectLoginFinishReq.serializer)
      ..add(ConnectLoginFinishRsp.serializer)
      ..add(ConnectLoginInitReq.serializer)
      ..add(ConnectLoginInitRsp.serializer)
      ..add(ConnectLoginStartReq.serializer)
      ..add(ConnectLoginStartReqSource_Enum.serializer)
      ..add(ConnectLoginStartRsp.serializer)
      ..add(ConnectManageDeleteReq.serializer)
      ..add(ConnectManageDeleteRsp.serializer)
      ..add(ConnectManageInitReq.serializer)
      ..add(ConnectManageInitRsp.serializer)
      ..add(ConnectManageListReq.serializer)
      ..add(ConnectManageListRsp.serializer)
      ..add(ContinueOnOtherDevice.serializer)
      ..add(ContinueOnOtherDeviceReasonEnum.serializer)
      ..add(EventCreateReq.serializer)
      ..add(FullNameWithError.serializer)
      ..add(GeneralBlockCompleted.serializer)
      ..add(GeneralBlockLoginInit.serializer)
      ..add(GeneralBlockPasskeyAppend.serializer)
      ..add(GeneralBlockPasskeyAppendVariantEnum.serializer)
      ..add(GeneralBlockPasskeyAppended.serializer)
      ..add(GeneralBlockPasskeyVerify.serializer)
      ..add(GeneralBlockPasskeyVerifyLoginHintEnum.serializer)
      ..add(GeneralBlockPostSignupEmailVerify.serializer)
      ..add(GeneralBlockSignupInit.serializer)
      ..add(GeneralBlockVerifyIdentifier.serializer)
      ..add(GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner
          .serializer)
      ..add(GenericRsp.serializer)
      ..add(Identifier.serializer)
      ..add(IdentifierUpdateReq.serializer)
      ..add(IdentifierVerifyFinishReq.serializer)
      ..add(IdentifierVerifyStartReq.serializer)
      ..add(JavaScriptHighEntropy.serializer)
      ..add(LoginIdentifier.serializer)
      ..add(LoginIdentifierConfig.serializer)
      ..add(LoginIdentifierType.serializer)
      ..add(LoginIdentifierWithError.serializer)
      ..add(LoginInitReq.serializer)
      ..add(MeIdentifierCreateReq.serializer)
      ..add(MeIdentifierDeleteReq.serializer)
      ..add(MeIdentifierUpdateReq.serializer)
      ..add(MeIdentifierVerifyFinishReq.serializer)
      ..add(MeIdentifierVerifyStartReq.serializer)
      ..add(MePasskeyDeleteRsp.serializer)
      ..add(MePasskeyRsp.serializer)
      ..add(MePasskeysAppendFinishReq.serializer)
      ..add(MePasskeysAppendStartReq.serializer)
      ..add(MePasskeysAppendStartRsp.serializer)
      ..add(MePasskeysAppendStartRspAppendNotAllowedReasonEnum.serializer)
      ..add(MeRefreshRsp.serializer)
      ..add(MeRsp.serializer)
      ..add(MeUpdateReq.serializer)
      ..add(Paging.serializer)
      ..add(Passkey.serializer)
      ..add(PasskeyAppendFinishReq.serializer)
      ..add(PasskeyAppendStartReq.serializer)
      ..add(PasskeyEventType.serializer)
      ..add(PasskeyIconSet.serializer)
      ..add(PasskeyLoginFinishReq.serializer)
      ..add(PasskeyLoginStartReq.serializer)
      ..add(PasskeyMediationFinishReq.serializer)
      ..add(PasskeyOperation.serializer)
      ..add(PasskeyOperationCeremonyTypeEnum.serializer)
      ..add(PasskeyOperationOperationTypeEnum.serializer)
      ..add(PasskeyStatusEnum.serializer)
      ..add(PasskeyTransportEnum.serializer)
      ..add(ProcessCommon.serializer)
      ..add(ProcessInitReq.serializer)
      ..add(ProcessInitRsp.serializer)
      ..add(ProcessResponse.serializer)
      ..add(ProcessStaticInfo.serializer)
      ..add(RequestData.serializer)
      ..add(RequestError.serializer)
      ..add(SessionConfigRsp.serializer)
      ..add(ShortSessionCookieConfig.serializer)
      ..add(ShortSessionCookieConfigSameSiteEnum.serializer)
      ..add(SignupInitReq.serializer)
      ..add(SocialAccount.serializer)
      ..add(SocialData.serializer)
      ..add(SocialDataStatusEnum.serializer)
      ..add(SocialProviderType.serializer)
      ..add(SocialVerifyStartReq.serializer)
      ..add(UserDetailsConfigRsp.serializer)
      ..add(VerificationMethod.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(BlockBody)]),
          () => new ListBuilder<BlockBody>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(
                GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner)
          ]),
          () => new ListBuilder<
              GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Identifier)]),
          () => new ListBuilder<Identifier>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SocialAccount)]),
          () => new ListBuilder<SocialAccount>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(LoginIdentifier)]),
          () => new ListBuilder<LoginIdentifier>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(LoginIdentifierConfig)]),
          () => new ListBuilder<LoginIdentifierConfig>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(LoginIdentifierWithError)]),
          () => new ListBuilder<LoginIdentifierWithError>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Passkey)]),
          () => new ListBuilder<Passkey>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Passkey)]),
          () => new ListBuilder<Passkey>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(PasskeyTransportEnum)]),
          () => new ListBuilder<PasskeyTransportEnum>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SocialProviderType)]),
          () => new ListBuilder<SocialProviderType>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(String)]),
          () => new MapBuilder<String, String>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(String)]),
          () => new MapBuilder<String, String>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(String)]),
          () => new MapBuilder<String, String>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(String)]),
          () => new MapBuilder<String, String>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(String)]),
          () => new MapBuilder<String, String>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(String)]),
          () => new MapBuilder<String, String>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
