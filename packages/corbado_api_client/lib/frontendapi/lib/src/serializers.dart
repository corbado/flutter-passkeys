//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:corbado_frontend_api_client/src/date_serializer.dart';
import 'package:corbado_frontend_api_client/src/model/date.dart';

import 'package:corbado_frontend_api_client/src/model/auth_type.dart';
import 'package:corbado_frontend_api_client/src/model/block_body.dart';
import 'package:corbado_frontend_api_client/src/model/block_body_data.dart';
import 'package:corbado_frontend_api_client/src/model/block_type.dart';
import 'package:corbado_frontend_api_client/src/model/client_capabilities.dart';
import 'package:corbado_frontend_api_client/src/model/client_information.dart';
import 'package:corbado_frontend_api_client/src/model/client_information_v2.dart';
import 'package:corbado_frontend_api_client/src/model/connect_append_finish_req.dart';
import 'package:corbado_frontend_api_client/src/model/connect_append_finish_rsp.dart';
import 'package:corbado_frontend_api_client/src/model/connect_append_init_req.dart';
import 'package:corbado_frontend_api_client/src/model/connect_append_init_rsp.dart';
import 'package:corbado_frontend_api_client/src/model/connect_append_start_req.dart';
import 'package:corbado_frontend_api_client/src/model/connect_append_start_rsp.dart';
import 'package:corbado_frontend_api_client/src/model/connect_event_create_req.dart';
import 'package:corbado_frontend_api_client/src/model/connect_login_finish_req.dart';
import 'package:corbado_frontend_api_client/src/model/connect_login_finish_rsp.dart';
import 'package:corbado_frontend_api_client/src/model/connect_login_init_req.dart';
import 'package:corbado_frontend_api_client/src/model/connect_login_init_rsp.dart';
import 'package:corbado_frontend_api_client/src/model/connect_login_start_req.dart';
import 'package:corbado_frontend_api_client/src/model/connect_login_start_rsp.dart';
import 'package:corbado_frontend_api_client/src/model/connect_manage_delete_req.dart';
import 'package:corbado_frontend_api_client/src/model/connect_manage_delete_rsp.dart';
import 'package:corbado_frontend_api_client/src/model/connect_manage_init_req.dart';
import 'package:corbado_frontend_api_client/src/model/connect_manage_init_rsp.dart';
import 'package:corbado_frontend_api_client/src/model/connect_manage_list_req.dart';
import 'package:corbado_frontend_api_client/src/model/connect_manage_list_rsp.dart';
import 'package:corbado_frontend_api_client/src/model/continue_on_other_device.dart';
import 'package:corbado_frontend_api_client/src/model/event_create_req.dart';
import 'package:corbado_frontend_api_client/src/model/full_name_with_error.dart';
import 'package:corbado_frontend_api_client/src/model/general_block_completed.dart';
import 'package:corbado_frontend_api_client/src/model/general_block_login_init.dart';
import 'package:corbado_frontend_api_client/src/model/general_block_passkey_append.dart';
import 'package:corbado_frontend_api_client/src/model/general_block_passkey_appended.dart';
import 'package:corbado_frontend_api_client/src/model/general_block_passkey_verify.dart';
import 'package:corbado_frontend_api_client/src/model/general_block_post_signup_email_verify.dart';
import 'package:corbado_frontend_api_client/src/model/general_block_signup_init.dart';
import 'package:corbado_frontend_api_client/src/model/general_block_verify_identifier.dart';
import 'package:corbado_frontend_api_client/src/model/general_block_verify_identifier_alternative_verification_methods_inner.dart';
import 'package:corbado_frontend_api_client/src/model/generic_rsp.dart';
import 'package:corbado_frontend_api_client/src/model/identifier.dart';
import 'package:corbado_frontend_api_client/src/model/identifier_update_req.dart';
import 'package:corbado_frontend_api_client/src/model/identifier_verify_finish_req.dart';
import 'package:corbado_frontend_api_client/src/model/identifier_verify_start_req.dart';
import 'package:corbado_frontend_api_client/src/model/java_script_high_entropy.dart';
import 'package:corbado_frontend_api_client/src/model/login_identifier.dart';
import 'package:corbado_frontend_api_client/src/model/login_identifier_config.dart';
import 'package:corbado_frontend_api_client/src/model/login_identifier_type.dart';
import 'package:corbado_frontend_api_client/src/model/login_identifier_with_error.dart';
import 'package:corbado_frontend_api_client/src/model/login_init_req.dart';
import 'package:corbado_frontend_api_client/src/model/me_identifier_create_req.dart';
import 'package:corbado_frontend_api_client/src/model/me_identifier_delete_req.dart';
import 'package:corbado_frontend_api_client/src/model/me_identifier_update_req.dart';
import 'package:corbado_frontend_api_client/src/model/me_identifier_verify_finish_req.dart';
import 'package:corbado_frontend_api_client/src/model/me_identifier_verify_start_req.dart';
import 'package:corbado_frontend_api_client/src/model/me_passkey_delete_rsp.dart';
import 'package:corbado_frontend_api_client/src/model/me_passkey_rsp.dart';
import 'package:corbado_frontend_api_client/src/model/me_passkeys_append_finish_req.dart';
import 'package:corbado_frontend_api_client/src/model/me_passkeys_append_start_req.dart';
import 'package:corbado_frontend_api_client/src/model/me_passkeys_append_start_rsp.dart';
import 'package:corbado_frontend_api_client/src/model/me_refresh_rsp.dart';
import 'package:corbado_frontend_api_client/src/model/me_rsp.dart';
import 'package:corbado_frontend_api_client/src/model/me_update_req.dart';
import 'package:corbado_frontend_api_client/src/model/paging.dart';
import 'package:corbado_frontend_api_client/src/model/passkey.dart';
import 'package:corbado_frontend_api_client/src/model/passkey_append_finish_req.dart';
import 'package:corbado_frontend_api_client/src/model/passkey_append_start_req.dart';
import 'package:corbado_frontend_api_client/src/model/passkey_event_type.dart';
import 'package:corbado_frontend_api_client/src/model/passkey_icon_set.dart';
import 'package:corbado_frontend_api_client/src/model/passkey_login_finish_req.dart';
import 'package:corbado_frontend_api_client/src/model/passkey_login_start_req.dart';
import 'package:corbado_frontend_api_client/src/model/passkey_mediation_finish_req.dart';
import 'package:corbado_frontend_api_client/src/model/passkey_operation.dart';
import 'package:corbado_frontend_api_client/src/model/process_common.dart';
import 'package:corbado_frontend_api_client/src/model/process_init_req.dart';
import 'package:corbado_frontend_api_client/src/model/process_init_rsp.dart';
import 'package:corbado_frontend_api_client/src/model/process_response.dart';
import 'package:corbado_frontend_api_client/src/model/process_static_info.dart';
import 'package:corbado_frontend_api_client/src/model/request_data.dart';
import 'package:corbado_frontend_api_client/src/model/request_error.dart';
import 'package:corbado_frontend_api_client/src/model/session_config_rsp.dart';
import 'package:corbado_frontend_api_client/src/model/short_session_cookie_config.dart';
import 'package:corbado_frontend_api_client/src/model/signup_init_req.dart';
import 'package:corbado_frontend_api_client/src/model/social_account.dart';
import 'package:corbado_frontend_api_client/src/model/social_data.dart';
import 'package:corbado_frontend_api_client/src/model/social_provider_type.dart';
import 'package:corbado_frontend_api_client/src/model/social_verify_start_req.dart';
import 'package:corbado_frontend_api_client/src/model/user_details_config_rsp.dart';
import 'package:corbado_frontend_api_client/src/model/verification_method.dart';

part 'serializers.g.dart';

@SerializersFor([
  AuthType,
  BlockBody,
  BlockBodyData,
  BlockType,
  ClientCapabilities,
  ClientInformation,
  ClientInformationV2,
  ConnectAppendFinishReq,
  ConnectAppendFinishRsp,
  ConnectAppendInitReq,
  ConnectAppendInitRsp,
  ConnectAppendStartReq,
  ConnectAppendStartRsp,
  ConnectEventCreateReq,
  ConnectLoginFinishReq,
  ConnectLoginFinishRsp,
  ConnectLoginInitReq,
  ConnectLoginInitRsp,
  ConnectLoginStartReq,
  ConnectLoginStartRsp,
  ConnectManageDeleteReq,
  ConnectManageDeleteRsp,
  ConnectManageInitReq,
  ConnectManageInitRsp,
  ConnectManageListReq,
  ConnectManageListRsp,
  ContinueOnOtherDevice,
  EventCreateReq,
  FullNameWithError,
  GeneralBlockCompleted,
  GeneralBlockLoginInit,
  GeneralBlockPasskeyAppend,
  GeneralBlockPasskeyAppended,
  GeneralBlockPasskeyVerify,
  GeneralBlockPostSignupEmailVerify,
  GeneralBlockSignupInit,
  GeneralBlockVerifyIdentifier,
  GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner,
  GenericRsp,
  Identifier,
  IdentifierUpdateReq,
  IdentifierVerifyFinishReq,
  IdentifierVerifyStartReq,
  JavaScriptHighEntropy,
  LoginIdentifier,
  LoginIdentifierConfig,
  LoginIdentifierType,
  LoginIdentifierWithError,
  LoginInitReq,
  MeIdentifierCreateReq,
  MeIdentifierDeleteReq,
  MeIdentifierUpdateReq,
  MeIdentifierVerifyFinishReq,
  MeIdentifierVerifyStartReq,
  MePasskeyDeleteRsp,
  MePasskeyRsp,
  MePasskeysAppendFinishReq,
  MePasskeysAppendStartReq,
  MePasskeysAppendStartRsp,
  MeRefreshRsp,
  MeRsp,
  MeUpdateReq,
  Paging,
  Passkey,
  PasskeyAppendFinishReq,
  PasskeyAppendStartReq,
  PasskeyEventType,
  PasskeyIconSet,
  PasskeyLoginFinishReq,
  PasskeyLoginStartReq,
  PasskeyMediationFinishReq,
  PasskeyOperation,
  ProcessCommon,
  ProcessInitReq,
  ProcessInitRsp,
  ProcessResponse,
  ProcessStaticInfo,
  RequestData,
  RequestError,
  SessionConfigRsp,
  ShortSessionCookieConfig,
  SignupInitReq,
  SocialAccount,
  SocialData,
  SocialProviderType,
  SocialVerifyStartReq,
  UserDetailsConfigRsp,
  VerificationMethod,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
