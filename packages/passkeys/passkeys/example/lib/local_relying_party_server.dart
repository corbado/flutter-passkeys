import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
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

const rpID = kIsWeb &&
        String.fromEnvironment('IS_VERCEL', defaultValue: 'false') != 'true'
    ? 'localhost'
    : 'flutter.corbado.io';

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

  /// Starts a passkey registration and returns a standard WebAuthn JSON request as a string.
  ///
  /// This simulates backend server logic that returns standard WebAuthn JSON
  /// format compatible with `PublicKeyCredential.parseCreationOptionsFromJSON()`.
  String startPasskeyRegister(
      {required String name, Configuration? configuration}) {
    if (_users.containsKey(name)) {
      throw Exception('User $name already exists. Please log in instead');
    }

    final userID = 'user-${_random.nextInt(100000000)}';
    final newUser = LocalUser(id: userID, name: name, transports: []);
    final challenge = generateChallenge();
    _inFlightChallenges[challenge] = newUser;

    // Build standard WebAuthn JSON format (as a backend server would)
    final request = <String, dynamic>{
      'challenge': challenge,
      'rp': {
        'name': 'local-relying-party-server',
        'id': rpID,
      },
      'user': {
        'id': base64Url.encode(userID.codeUnits),
        'name': name,
        'displayName': name,
      },
      'pubKeyCredParams': [
        {'type': 'public-key', 'alg': -7},
        {'type': 'public-key', 'alg': -257},
      ],
      'authenticatorSelection': {
        'requireResidentKey': false,
        'residentKey': 'required',
        'userVerification': 'preferred',
      },
      'timeout': configuration?.timeout ?? 60000,
    };

    // Add excludeCredentials if configured
    if (configuration?.excludeCredentials == true && _users.values.isNotEmpty) {
      request['excludeCredentials'] = _users.values
          .where((e) => e.credentialID != null)
          .map((e) => {
                'type': 'public-key',
                'id': e.credentialID!,
                'transports': ['internal'],
              })
          .toList();
    }

    // Return as JSON string (simulating backend API response)
    return jsonEncode(request);
  }

  /// Finishes passkey registration by processing a standard WebAuthn JSON response string.
  ///
  /// This simulates backend server logic that receives standard WebAuthn JSON
  /// format from the authenticator.
  ///
  /// Expected JSON structure:
  /// ```json
  /// {
  ///   "id": "base64url...",
  ///   "rawId": "base64url...",
  ///   "type": "public-key",
  ///   "response": {
  ///     "clientDataJSON": "base64url...",
  ///     "attestationObject": "base64url...",
  ///     "transports": ["internal"]
  ///   }
  /// }
  /// ```
  ///
  /// Note: we don't implement a full relying party server here.
  /// To save effort we don't verify the response from the authenticator.
  LocalUser finishPasskeyRegister({required String response}) {
    // Parse JSON string (simulating backend receiving JSON from client)
    final responseMap = jsonDecode(response) as Map<String, dynamic>;
    final responseData = responseMap['response'] as Map<String, dynamic>;
    final clientDataJSON = responseData['clientDataJSON'] as String;
    final id = responseMap['id'] as String;
    final transports = responseData['transports'] as List<dynamic>?;

    // Decode and parse clientDataJSON to extract challenge
    final raw = addBase64Padding(clientDataJSON);
    final clientData = jsonDecode(String.fromCharCodes(base64.decode(raw)));

    final challenge = clientData['challenge'] as String;
    final user = _inFlightChallenges[challenge];
    if (user == null) {
      throw Exception('invalid state: user does not exist');
    }

    user
      ..credentialID = id
      ..transports = (transports?.isEmpty ?? true)
          // When using FaceID or TouchID, the transports are empty.
          ? ['internal', 'hybrid']
          : transports!.map((e) => e as String).toList();
    _users[user.name] = user;

    return user;
  }

  /// Starts a passkey login and returns a standard WebAuthn JSON request as a string.
  ///
  /// This simulates backend server logic that returns standard WebAuthn JSON
  /// format compatible with `PublicKeyCredential.parseRequestOptionsFromJSON()`.
  String startPasskeyLogin(
      {required String name, Configuration? configuration}) {
    if (!_users.containsKey(name)) {
      throw Exception('User $name does not exist. Please register first');
    }

    final challenge = generateChallenge();
    _inFlightChallenges[challenge] = _users[name]!;

    // Build standard WebAuthn JSON format (as a backend server would)
    final request = <String, dynamic>{
      'challenge': challenge,
      'rpId': rpID,
      'userVerification': 'preferred',
      'timeout': configuration?.timeout ?? 60000,
    };

    // Add allowCredentials if configured or if user has a credential
    if (configuration?.allowCredentials == true) {
      request['allowCredentials'] = [
        {
          'type': 'public-key',
          'id': 'id',
          'transports': ['internal'],
        }
      ];
    } else if (_users[name]!.credentialID != null) {
      request['allowCredentials'] = [
        {
          'type': 'public-key',
          'id': _users[name]!.credentialID!,
          'transports': _users[name]!.transports,
        },
      ];
    }

    // Return as JSON string (simulating backend API response)
    return jsonEncode(request);
  }

  /// Finishes passkey login by processing a standard WebAuthn JSON response string.
  ///
  /// This simulates backend server logic that receives standard WebAuthn JSON
  /// format from the authenticator.
  ///
  /// Expected JSON structure:
  /// ```json
  /// {
  ///   "id": "base64url...",
  ///   "rawId": "base64url...",
  ///   "type": "public-key",
  ///   "response": {
  ///     "clientDataJSON": "base64url...",
  ///     "authenticatorData": "base64url...",
  ///     "signature": "base64url...",
  ///     "userHandle": "base64url..."
  ///   }
  /// }
  /// ```
  ///
  /// Note: we don't implement a full relying party server here.
  /// To save effort we don't verify the response from the authenticator.
  LocalUser finishPasskeyLogin({required String response}) {
    final responseMap = jsonDecode(response) as Map<String, dynamic>;
    final responseData = responseMap['response'] as Map<String, dynamic>;
    final clientDataJSON = responseData['clientDataJSON'] as String;

    // Decode and parse clientDataJSON to extract challenge
    final raw = addBase64Padding(clientDataJSON);
    final clientData = jsonDecode(String.fromCharCodes(base64.decode(raw)));

    final challenge = clientData['challenge'] as String;
    final user = _inFlightChallenges[challenge];
    if (user == null) {
      throw Exception('invalid state: user does not exist');
    }

    return user;
  }

  /// Starts a conditional UI passkey login and returns a standard WebAuthn JSON request as a string.
  ///
  /// This simulates backend server logic that returns standard WebAuthn JSON
  /// format compatible with `PublicKeyCredential.parseRequestOptionsFromJSON()`.
  String startPasskeyLoginConditionalU() {
    final challenge = generateChallenge();

    // Build standard WebAuthn JSON format (as a backend server would)
    final request = {
      'challenge': challenge,
      'rpId': rpID,
    };

    return jsonEncode(request);
  }

  /// Finishes conditional UI passkey login by processing a standard WebAuthn JSON response string.
  ///
  /// This simulates backend server logic that receives standard WebAuthn JSON
  /// format from the authenticator.
  ///
  /// Expected JSON structure:
  /// ```json
  /// {
  ///   "id": "base64url...",
  ///   "rawId": "base64url...",
  ///   "type": "public-key",
  ///   "response": {
  ///     "clientDataJSON": "base64url...",
  ///     "authenticatorData": "base64url...",
  ///     "signature": "base64url...",
  ///     "userHandle": "base64url..."
  ///   }
  /// }
  /// ```
  ///
  /// Note: we don't implement a full relying party server here.
  /// To save effort we don't verify the response from the authenticator.
  LocalUser finishPasskeyLoginConditionalUI({required String response}) {
    final responseMap = jsonDecode(response) as Map<String, dynamic>;
    final id = responseMap['id'] as String;

    LocalUser? existingUser;
    for (final user in _users.values) {
      if (user.credentialID != null && user.credentialID == id) {
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
