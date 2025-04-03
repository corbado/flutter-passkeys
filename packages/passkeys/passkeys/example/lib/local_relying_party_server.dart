import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:passkeys/types.dart';
import 'package:passkeys_example/auth_service.dart';

class LocalUser {
  LocalUser(
      {required this.name,
      required this.id,
      this.credentialID,
      required this.transports});

  final String name;
  final String id;
  String? credentialID;
  List<String> transports;
}

/// This is a local version of a relying party server.
///
/// Note:
/// The concept of a local relying party server works just in examples. It does not work in practice.
/// Usually a relying party server is party of your backend.
class LocalRelyingPartyServer {
  LocalRelyingPartyServer();

  final Map<String, LocalUser> _users = HashMap();
  final Map<String, LocalUser> _inFlightChallenges = HashMap();
  final Random _random = Random();

  RegisterRequestType startPasskeyRegister({
    required String name,
    required String rpID, Configuration? configuration,
  }) {
    if (_users.containsKey(name)) {
      throw Exception('User $name already exists. Please log in instead');
    }

    final userID = 'user-${_random.nextInt(100000000)}';
    final newUser = LocalUser(id: userID, name: name, transports: []);
    final challenge = generateChallenge();
    _inFlightChallenges[challenge] = newUser;

    final rp = RelyingPartyType(name: 'local-relying-party-server', id: rpID);
    final user = UserType(
      displayName: name,
      name: name,
      id: base64Url.encode(userID.codeUnits),
    );
    final authenticatorSelection = AuthenticatorSelectionType(
      requireResidentKey: false,
      residentKey: 'required',
      userVerification: 'preferred',
    );

    return RegisterRequestType(
      challenge: challenge,
      relyingParty: rp,
      user: user,
      authSelectionType: authenticatorSelection,
      pubKeyCredParams: [
        PubKeyCredParamType(type: 'public-key', alg: -7),
        PubKeyCredParamType(type: 'public-key', alg: -257),
      ],
      excludeCredentials: configuration?.excludeCredentials == true
          ? _users.values
              .map((e) => CredentialType(
                    type: 'public-key',
                    id: e.credentialID!,
                    transports: ['internal'],
                  ))
              .toList()
          : [],
      timeout: configuration?.timeout ?? 60000,
    );
  }

  /// Note: we don't implement a full relying party server here.
  /// To safe effort we don't verify the response from the authenticator.
  LocalUser finishPasskeyRegister({required RegisterResponseType response}) {
    final raw = addBase64Padding(response.clientDataJSON);
    final json = jsonDecode(String.fromCharCodes(base64.decode(raw)));

    final challenge = json['challenge'];
    final user = _inFlightChallenges[challenge];
    if (user == null) {
      throw Exception('invalid state: user does not exist');
    }

    user
      ..credentialID = response.id
      ..transports = response.transports.isEmpty
          // When using FaceID or TouchID, the transports are empty.
          ? ['internal', 'hybrid']
          : response.transports as List<String>;
    _users[user.name] = user;

    return user;
  }

  AuthenticateRequestType startPasskeyLogin(
      {required String name,required String rpID, Configuration? configuration}) {
    if (!_users.containsKey(name)) {
      throw Exception('User $name does not exist. Please register first');
    }

    final challenge = generateChallenge();
    _inFlightChallenges[challenge] = _users[name]!;

    return AuthenticateRequestType(
      relyingPartyId: rpID,
      challenge: challenge,
      mediation: MediationType.Optional,
      userVerification: 'preferred',
      preferImmediatelyAvailableCredentials:
          configuration?.preferImmediatelyAvailableCredentials == true
              ? true
              : false,
      allowCredentials: configuration?.allowCredentials == true
          ? [
              CredentialType(
                type: 'public-key',
                id: 'id',
                transports: ['internal'],
              )
            ]
          : _users[name]!.credentialID != null
              ? [
                  CredentialType(
                    type: 'public-key',
                    id: _users[name]!.credentialID!,
                    transports: _users[name]!.transports,
                  ),
                ]
              : null,
      timeout: configuration?.timeout ?? 60000,
    );
  }

  /// Note: we don't implement a full relying party server here.
  /// To safe effort we don't verify the response from the authenticator.
  LocalUser finishPasskeyLogin({required AuthenticateResponseType response}) {
    final raw = addBase64Padding(response.clientDataJSON);
    final json = jsonDecode(String.fromCharCodes(base64.decode(raw)));

    final challenge = json['challenge'];
    final user = _inFlightChallenges[challenge];
    if (user == null) {
      throw Exception('invalid state: user does not exist');
    }

    return user;
  }

  AuthenticateRequestType startPasskeyLoginConditionalU() {
    final challenge = generateChallenge();

    return AuthenticateRequestType(
      relyingPartyId: "flutter.corbado.io",
      challenge: challenge,
      mediation: MediationType.Conditional,
      preferImmediatelyAvailableCredentials: false,
    );
  }

  /// Note: we don't implement a full relying party server here.
  /// To safe effort we don't verify the response from the authenticator.
  LocalUser finishPasskeyLoginConditionalUI(
      {required AuthenticateResponseType response}) {
    LocalUser? existingUser;
    for (final user in _users.values) {
      if (user.credentialID != null && user.credentialID == response.id) {
        existingUser = user;
      }
    }

    if (existingUser == null) {
      throw Exception('User does not exist');
    }

    return existingUser;
  }

  String generateChallenge() {
    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var rawChallenge = '';
    for (var i = 0; i < 32; i++) {
      rawChallenge += chars[_random.nextInt(chars.length)];
    }

    final a = base64Url.encode(rawChallenge.codeUnits);

    return a.substring(0, a.length - 1);
  }

  String addBase64Padding(String base64String) {
    final missingPadding = (4 - (base64String.length % 4)) % 4;
    return base64String + ('=' * missingPadding);
  }
}
