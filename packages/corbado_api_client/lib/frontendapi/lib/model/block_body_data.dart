//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BlockBodyData {
  /// Returns a new [BlockBodyData] instance.
  BlockBodyData({
    required this.challenge,
    required this.identifierValue,
    required this.identifierType,
    required this.autoSubmit,
    required this.passkeyIconSet,
    required this.variant,
    required this.verificationMethod,
    required this.identifier,
    this.alternativeVerificationMethods = const [],
    required this.isPostLoginVerification,
    required this.shortSession,
    this.identifiers = const [],
    required this.socialData,
    required this.type,
    required this.isPhone,
    required this.isPhoneAvailable,
    required this.isEmailAvailable,
    required this.isUsernameAvailable,
    this.loginHint,
    this.retryNotBefore,
    this.error,
    this.longSession,
    this.passkeyOperation,
    this.fullName,
    this.conditionalUIChallenge,
    this.fieldError,
  });

  String challenge;

  String identifierValue;

  LoginIdentifierType identifierType;

  bool autoSubmit;

  PasskeyIconSet passkeyIconSet;

  BlockBodyDataVariantEnum variant;

  VerificationMethod verificationMethod;

  String identifier;

  List<Object> alternativeVerificationMethods;

  bool isPostLoginVerification;

  String shortSession;

  List<LoginIdentifierWithError> identifiers;

  SocialData socialData;

  LoginIdentifierType type;

  bool isPhone;

  bool isPhoneAvailable;

  bool isEmailAvailable;

  bool isUsernameAvailable;

  BlockBodyDataLoginHintEnum? loginHint;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? retryNotBefore;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  RequestError? error;

  /// Only given when project environment is dev
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? longSession;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PasskeyOperation? passkeyOperation;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  FullNameWithError? fullName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? conditionalUIChallenge;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  RequestError? fieldError;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlockBodyData &&
          other.challenge == challenge &&
          other.identifierValue == identifierValue &&
          other.identifierType == identifierType &&
          other.autoSubmit == autoSubmit &&
          other.passkeyIconSet == passkeyIconSet &&
          other.variant == variant &&
          other.verificationMethod == verificationMethod &&
          other.identifier == identifier &&
          other.alternativeVerificationMethods ==
              alternativeVerificationMethods &&
          other.isPostLoginVerification == isPostLoginVerification &&
          other.shortSession == shortSession &&
          _deepEquality.equals(other.identifiers, identifiers) &&
          other.socialData == socialData &&
          other.type == type &&
          other.isPhone == isPhone &&
          other.isPhoneAvailable == isPhoneAvailable &&
          other.isEmailAvailable == isEmailAvailable &&
          other.isUsernameAvailable == isUsernameAvailable &&
          other.loginHint == loginHint &&
          other.retryNotBefore == retryNotBefore &&
          other.error == error &&
          other.longSession == longSession &&
          other.passkeyOperation == passkeyOperation &&
          other.fullName == fullName &&
          other.conditionalUIChallenge == conditionalUIChallenge &&
          other.fieldError == fieldError;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (challenge.hashCode) +
      (identifierValue.hashCode) +
      (identifierType.hashCode) +
      (autoSubmit.hashCode) +
      (passkeyIconSet.hashCode) +
      (variant.hashCode) +
      (verificationMethod.hashCode) +
      (identifier.hashCode) +
      (alternativeVerificationMethods.hashCode) +
      (isPostLoginVerification.hashCode) +
      (shortSession.hashCode) +
      (identifiers.hashCode) +
      (socialData.hashCode) +
      (type.hashCode) +
      (isPhone.hashCode) +
      (isPhoneAvailable.hashCode) +
      (isEmailAvailable.hashCode) +
      (isUsernameAvailable.hashCode) +
      (loginHint == null ? 0 : loginHint!.hashCode) +
      (retryNotBefore == null ? 0 : retryNotBefore!.hashCode) +
      (error == null ? 0 : error!.hashCode) +
      (longSession == null ? 0 : longSession!.hashCode) +
      (passkeyOperation == null ? 0 : passkeyOperation!.hashCode) +
      (fullName == null ? 0 : fullName!.hashCode) +
      (conditionalUIChallenge == null ? 0 : conditionalUIChallenge!.hashCode) +
      (fieldError == null ? 0 : fieldError!.hashCode);

  @override
  String toString() =>
      'BlockBodyData[challenge=$challenge, identifierValue=$identifierValue, identifierType=$identifierType, autoSubmit=$autoSubmit, passkeyIconSet=$passkeyIconSet, variant=$variant, verificationMethod=$verificationMethod, identifier=$identifier, alternativeVerificationMethods=$alternativeVerificationMethods, isPostLoginVerification=$isPostLoginVerification, shortSession=$shortSession, identifiers=$identifiers, socialData=$socialData, type=$type, isPhone=$isPhone, isPhoneAvailable=$isPhoneAvailable, isEmailAvailable=$isEmailAvailable, isUsernameAvailable=$isUsernameAvailable, loginHint=$loginHint, retryNotBefore=$retryNotBefore, error=$error, longSession=$longSession, passkeyOperation=$passkeyOperation, fullName=$fullName, conditionalUIChallenge=$conditionalUIChallenge, fieldError=$fieldError]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'challenge'] = this.challenge;
    json[r'identifierValue'] = this.identifierValue;
    json[r'identifierType'] = this.identifierType;
    json[r'autoSubmit'] = this.autoSubmit;
    json[r'passkeyIconSet'] = this.passkeyIconSet;
    json[r'variant'] = this.variant;
    json[r'verificationMethod'] = this.verificationMethod;
    json[r'identifier'] = this.identifier;
    json[r'alternativeVerificationMethods'] =
        this.alternativeVerificationMethods;
    json[r'isPostLoginVerification'] = this.isPostLoginVerification;
    json[r'shortSession'] = this.shortSession;
    json[r'identifiers'] = this.identifiers;
    json[r'socialData'] = this.socialData;
    json[r'type'] = this.type;
    json[r'isPhone'] = this.isPhone;
    json[r'isPhoneAvailable'] = this.isPhoneAvailable;
    json[r'isEmailAvailable'] = this.isEmailAvailable;
    json[r'isUsernameAvailable'] = this.isUsernameAvailable;
    if (this.loginHint != null) {
      json[r'loginHint'] = this.loginHint;
    } else {
      json[r'loginHint'] = null;
    }
    if (this.retryNotBefore != null) {
      json[r'retryNotBefore'] = this.retryNotBefore;
    } else {
      json[r'retryNotBefore'] = null;
    }
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
    if (this.longSession != null) {
      json[r'longSession'] = this.longSession;
    } else {
      json[r'longSession'] = null;
    }
    if (this.passkeyOperation != null) {
      json[r'passkeyOperation'] = this.passkeyOperation;
    } else {
      json[r'passkeyOperation'] = null;
    }
    if (this.fullName != null) {
      json[r'fullName'] = this.fullName;
    } else {
      json[r'fullName'] = null;
    }
    if (this.conditionalUIChallenge != null) {
      json[r'conditionalUIChallenge'] = this.conditionalUIChallenge;
    } else {
      json[r'conditionalUIChallenge'] = null;
    }
    if (this.fieldError != null) {
      json[r'fieldError'] = this.fieldError;
    } else {
      json[r'fieldError'] = null;
    }
    return json;
  }

  /// Returns a new [BlockBodyData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BlockBodyData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "BlockBodyData[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "BlockBodyData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return BlockBodyData(
        challenge: mapValueOfType<String>(json, r'challenge')!,
        identifierValue: mapValueOfType<String>(json, r'identifierValue')!,
        identifierType: LoginIdentifierType.fromJson(json[r'identifierType'])!,
        autoSubmit: mapValueOfType<bool>(json, r'autoSubmit')!,
        passkeyIconSet: PasskeyIconSet.fromJson(json[r'passkeyIconSet'])!,
        variant: BlockBodyDataVariantEnum.fromJson(json[r'variant'])!,
        verificationMethod:
            VerificationMethod.fromJson(json[r'verificationMethod'])!,
        identifier: mapValueOfType<String>(json, r'identifier')!,
        alternativeVerificationMethods:
            Object.fromJson(json[r'alternativeVerificationMethods'])!,
        isPostLoginVerification:
            mapValueOfType<bool>(json, r'isPostLoginVerification')!,
        shortSession: mapValueOfType<String>(json, r'shortSession')!,
        identifiers:
            LoginIdentifierWithError.listFromJson(json[r'identifiers']),
        socialData: SocialData.fromJson(json[r'socialData'])!,
        type: LoginIdentifierType.fromJson(json[r'type'])!,
        isPhone: mapValueOfType<bool>(json, r'isPhone')!,
        isPhoneAvailable: mapValueOfType<bool>(json, r'isPhoneAvailable')!,
        isEmailAvailable: mapValueOfType<bool>(json, r'isEmailAvailable')!,
        isUsernameAvailable:
            mapValueOfType<bool>(json, r'isUsernameAvailable')!,
        loginHint: BlockBodyDataLoginHintEnum.fromJson(json[r'loginHint']),
        retryNotBefore: mapValueOfType<int>(json, r'retryNotBefore'),
        error: RequestError.fromJson(json[r'error']),
        longSession: mapValueOfType<String>(json, r'longSession'),
        passkeyOperation: PasskeyOperation.fromJson(json[r'passkeyOperation']),
        fullName: FullNameWithError.fromJson(json[r'fullName']),
        conditionalUIChallenge:
            mapValueOfType<String>(json, r'conditionalUIChallenge'),
        fieldError: RequestError.fromJson(json[r'fieldError']),
      );
    }
    return null;
  }

  static List<BlockBodyData> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BlockBodyData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BlockBodyData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BlockBodyData> mapFromJson(dynamic json) {
    final map = <String, BlockBodyData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BlockBodyData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BlockBodyData-objects as value to a dart map
  static Map<String, List<BlockBodyData>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<BlockBodyData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BlockBodyData.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'challenge',
    'identifierValue',
    'identifierType',
    'autoSubmit',
    'passkeyIconSet',
    'variant',
    'verificationMethod',
    'identifier',
    'alternativeVerificationMethods',
    'isPostLoginVerification',
    'shortSession',
    'identifiers',
    'socialData',
    'type',
    'isPhone',
    'isPhoneAvailable',
    'isEmailAvailable',
    'isUsernameAvailable',
  };
}

class BlockBodyDataVariantEnum {
  /// Instantiate a new enum with the provided [value].
  const BlockBodyDataVariantEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const default_ = BlockBodyDataVariantEnum._(r'default');
  static const afterHybrid = BlockBodyDataVariantEnum._(r'after-hybrid');
  static const afterError = BlockBodyDataVariantEnum._(r'after-error');

  /// List of all possible values in this [enum][BlockBodyDataVariantEnum].
  static const values = <BlockBodyDataVariantEnum>[
    default_,
    afterHybrid,
    afterError,
  ];

  static BlockBodyDataVariantEnum? fromJson(dynamic value) =>
      BlockBodyDataVariantEnumTypeTransformer().decode(value);

  static List<BlockBodyDataVariantEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BlockBodyDataVariantEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BlockBodyDataVariantEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BlockBodyDataVariantEnum] to String,
/// and [decode] dynamic data back to [BlockBodyDataVariantEnum].
class BlockBodyDataVariantEnumTypeTransformer {
  factory BlockBodyDataVariantEnumTypeTransformer() =>
      _instance ??= const BlockBodyDataVariantEnumTypeTransformer._();

  const BlockBodyDataVariantEnumTypeTransformer._();

  String encode(BlockBodyDataVariantEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a BlockBodyDataVariantEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BlockBodyDataVariantEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'default':
          return BlockBodyDataVariantEnum.default_;
        case r'after-hybrid':
          return BlockBodyDataVariantEnum.afterHybrid;
        case r'after-error':
          return BlockBodyDataVariantEnum.afterError;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [BlockBodyDataVariantEnumTypeTransformer] instance.
  static BlockBodyDataVariantEnumTypeTransformer? _instance;
}

class BlockBodyDataLoginHintEnum {
  /// Instantiate a new enum with the provided [value].
  const BlockBodyDataLoginHintEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const cda = BlockBodyDataLoginHintEnum._(r'cda');

  /// List of all possible values in this [enum][BlockBodyDataLoginHintEnum].
  static const values = <BlockBodyDataLoginHintEnum>[
    cda,
  ];

  static BlockBodyDataLoginHintEnum? fromJson(dynamic value) =>
      BlockBodyDataLoginHintEnumTypeTransformer().decode(value);

  static List<BlockBodyDataLoginHintEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BlockBodyDataLoginHintEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BlockBodyDataLoginHintEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BlockBodyDataLoginHintEnum] to String,
/// and [decode] dynamic data back to [BlockBodyDataLoginHintEnum].
class BlockBodyDataLoginHintEnumTypeTransformer {
  factory BlockBodyDataLoginHintEnumTypeTransformer() =>
      _instance ??= const BlockBodyDataLoginHintEnumTypeTransformer._();

  const BlockBodyDataLoginHintEnumTypeTransformer._();

  String encode(BlockBodyDataLoginHintEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a BlockBodyDataLoginHintEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BlockBodyDataLoginHintEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'cda':
          return BlockBodyDataLoginHintEnum.cda;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [BlockBodyDataLoginHintEnumTypeTransformer] instance.
  static BlockBodyDataLoginHintEnumTypeTransformer? _instance;
}
