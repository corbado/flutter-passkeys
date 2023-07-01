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

part 'api/assets_api.dart';
part 'api/projects_api.dart';
part 'api/sessions_api.dart';
part 'api/users_api.dart';

part 'model/apple_app_site_association_rsp.dart';
part 'model/apple_app_site_association_rsp_applinks.dart';
part 'model/apple_app_site_association_rsp_applinks_details_inner.dart';
part 'model/apple_app_site_association_rsp_webcredentials.dart';
part 'model/asset_link.dart';
part 'model/asset_link_target.dart';
part 'model/auth_method.dart';
part 'model/auth_methods_list_req.dart';
part 'model/auth_methods_list_rsp.dart';
part 'model/auth_methods_list_rsp_all_of.dart';
part 'model/auth_methods_list_rsp_all_of_data.dart';
part 'model/authentication_rsp.dart';
part 'model/email_link_confirm_req.dart';
part 'model/email_link_confirm_rsp.dart';
part 'model/email_link_confirm_rsp_all_of.dart';
part 'model/email_link_login_start_req.dart';
part 'model/email_link_login_start_rsp.dart';
part 'model/email_link_register_start_req.dart';
part 'model/email_link_register_start_rsp.dart';
part 'model/email_link_register_start_rsp_all_of.dart';
part 'model/email_link_register_start_rsp_all_of_data.dart';
part 'model/email_link_status_req.dart';
part 'model/email_link_status_rsp.dart';
part 'model/empty_req.dart';
part 'model/error_rsp.dart';
part 'model/error_rsp_all_of.dart';
part 'model/error_rsp_all_of_error.dart';
part 'model/error_rsp_all_of_error_validation.dart';
part 'model/full_user.dart';
part 'model/generic_rsp.dart';
part 'model/jwk.dart';
part 'model/login_token_req.dart';
part 'model/login_token_rsp.dart';
part 'model/logout_rsp.dart';
part 'model/logout_rsp_all_of.dart';
part 'model/me_rsp.dart';
part 'model/me_rsp_all_of.dart';
part 'model/pass_key_append_finish_rsp.dart';
part 'model/pass_key_append_finish_rsp_all_of.dart';
part 'model/pass_key_append_finish_rsp_all_of_data.dart';
part 'model/pass_key_finish_req.dart';
part 'model/pass_key_login_finish_rsp.dart';
part 'model/pass_key_login_finish_rsp_all_of.dart';
part 'model/pass_key_login_start_req.dart';
part 'model/pass_key_mediation_start_req.dart';
part 'model/pass_key_mediation_start_rsp.dart';
part 'model/pass_key_mediation_start_rsp_all_of.dart';
part 'model/pass_key_mediation_start_rsp_all_of_data.dart';
part 'model/pass_key_register_finish_rsp.dart';
part 'model/pass_key_register_finish_rsp_all_of.dart';
part 'model/pass_key_register_start_req.dart';
part 'model/pass_key_start_rsp.dart';
part 'model/pass_key_start_rsp_all_of.dart';
part 'model/pass_key_start_rsp_all_of_data.dart';
part 'model/password_verify_req.dart';
part 'model/password_verify_rsp.dart';
part 'model/project_config_rsp.dart';
part 'model/project_config_rsp_all_of.dart';
part 'model/project_config_rsp_all_of_data.dart';
part 'model/request_data.dart';
part 'model/session_refresh_rsp.dart';
part 'model/short_session.dart';
part 'model/status.dart';
part 'model/user_email.dart';
part 'model/user_phone_number.dart';
part 'model/well_known_jwks_list_rsp.dart';


const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ApiClient defaultApiClient = ApiClient();
