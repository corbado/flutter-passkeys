//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/auth_api.dart';
part 'api/configs_api.dart';
part 'api/corbado_connect_api.dart';
part 'api/users_api.dart';

part 'model/auth_type.dart';
part 'model/authentication_response.dart';
part 'model/block_body.dart';
part 'model/block_body_data.dart';
part 'model/block_type.dart';
part 'model/client_capabilities.dart';
part 'model/client_information.dart';
part 'model/client_information_v2.dart';
part 'model/connect_append_finish_req.dart';
part 'model/connect_append_finish_rsp.dart';
part 'model/connect_append_init_req.dart';
part 'model/connect_append_init_rsp.dart';
part 'model/connect_append_start_req.dart';
part 'model/connect_append_start_rsp.dart';
part 'model/connect_event_create_req.dart';
part 'model/connect_login_finish_req.dart';
part 'model/connect_login_finish_rsp.dart';
part 'model/connect_login_init_req.dart';
part 'model/connect_login_init_rsp.dart';
part 'model/connect_login_start_req.dart';
part 'model/connect_login_start_rsp.dart';
part 'model/connect_manage_delete_req.dart';
part 'model/connect_manage_delete_rsp.dart';
part 'model/connect_manage_init_req.dart';
part 'model/connect_manage_init_rsp.dart';
part 'model/connect_manage_list_req.dart';
part 'model/connect_manage_list_rsp.dart';
part 'model/continue_on_other_device.dart';
part 'model/event_create_req.dart';
part 'model/full_name_with_error.dart';
part 'model/general_block_login_init.dart';
part 'model/general_block_passkey_append.dart';
part 'model/general_block_passkey_verify.dart';
part 'model/general_block_post_signup_email_verify.dart';
part 'model/general_block_signup_init.dart';
part 'model/general_block_verify_identifier.dart';
part 'model/generic_rsp.dart';
part 'model/identifier.dart';
part 'model/identifier_update_req.dart';
part 'model/identifier_verify_finish_req.dart';
part 'model/identifier_verify_start_req.dart';
part 'model/java_script_high_entropy.dart';
part 'model/login_identifier.dart';
part 'model/login_identifier_config.dart';
part 'model/login_identifier_type.dart';
part 'model/login_identifier_with_error.dart';
part 'model/login_init_req.dart';
part 'model/me_identifier_create_req.dart';
part 'model/me_identifier_delete_req.dart';
part 'model/me_identifier_update_req.dart';
part 'model/me_identifier_verify_finish_req.dart';
part 'model/me_identifier_verify_start_req.dart';
part 'model/me_passkey_delete_rsp.dart';
part 'model/me_passkey_rsp.dart';
part 'model/me_passkeys_append_finish_req.dart';
part 'model/me_passkeys_append_start_req.dart';
part 'model/me_passkeys_append_start_rsp.dart';
part 'model/me_refresh_rsp.dart';
part 'model/me_rsp.dart';
part 'model/me_update_req.dart';
part 'model/paging.dart';
part 'model/passkey.dart';
part 'model/passkey_append_finish_req.dart';
part 'model/passkey_event_type.dart';
part 'model/passkey_icon_set.dart';
part 'model/passkey_login_finish_req.dart';
part 'model/passkey_mediation_finish_req.dart';
part 'model/passkey_operation.dart';
part 'model/phone_collect_req.dart';
part 'model/process_common.dart';
part 'model/process_init_req.dart';
part 'model/process_init_rsp.dart';
part 'model/process_response.dart';
part 'model/process_static_info.dart';
part 'model/request_data.dart';
part 'model/request_error.dart';
part 'model/session_config_rsp.dart';
part 'model/short_session_cookie_config.dart';
part 'model/signup_init_req.dart';
part 'model/social_account.dart';
part 'model/social_data.dart';
part 'model/social_provider_type.dart';
part 'model/social_verify_start_req.dart';
part 'model/user_details_config_rsp.dart';
part 'model/username_collect_req.dart';
part 'model/verification_method.dart';

/// An [ApiClient] instance that uses the default values obtained from
/// the OpenAPI specification file.
var defaultApiClient = ApiClient();

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
const _deepEquality = DeepCollectionEquality();
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

bool _isEpochMarker(String? pattern) =>
    pattern == _dateEpochMarker || pattern == '/$_dateEpochMarker/';
