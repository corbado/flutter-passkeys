// ignore_for_file: library_private_types_in_public_api

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/process_handler.dart';
import 'package:flutter/material.dart';

/// Holds the screen builders used to render each step of the auth flow.
class CorbadoScreens {
  /// Creates a [CorbadoScreens] with optional builders for each screen.
  CorbadoScreens({
    this.loginInit,
    this.passkeyVerify,
    this.passkeyAppend,
    this.emailVerifyOtp,
    this.signupInit,
    this.emailEdit,
  });

  /// Builder for the signup init screen.
  final CorbadoScreen<SignupInitBlock> Function(SignupInitBlock)? signupInit;

  /// Builder for the login init screen.
  final CorbadoScreen<LoginInitBlock> Function(LoginInitBlock)? loginInit;

  /// Builder for the passkey verify screen.
  final CorbadoScreen<PasskeyVerifyBlock> Function(PasskeyVerifyBlock)?
  passkeyVerify;

  /// Builder for the passkey append screen.
  final CorbadoScreen<PasskeyAppendBlock> Function(PasskeyAppendBlock)?
  passkeyAppend;

  /// Builder for the email verification (OTP) screen.
  final CorbadoScreen<EmailVerifyBlock> Function(EmailVerifyBlock)?
  emailVerifyOtp;

  /// Builder for the email edit screen.
  final CorbadoScreen<EmailVerifyBlock> Function(EmailVerifyBlock)? emailEdit;
}

/// Listens to the auth process stream and rebuilds itself to render the
/// screen for whichever block is currently active.
class CorbadoAuthComponent extends StatefulWidget {
  /// Creates a [CorbadoAuthComponent].
  const CorbadoAuthComponent({
    required this.corbadoAuth,
    required this.components,
    super.key,
    this.loading,
  });

  /// The auth instance whose process stream drives this component.
  final CorbadoAuth corbadoAuth;

  /// The screen builders used to render each step of the flow.
  final CorbadoScreens components;

  /// Widget shown while waiting for the first block to be emitted.
  final Widget? loading;

  @override
  _CorbadoAuthComponentState createState() => _CorbadoAuthComponentState();
}

class _CorbadoAuthComponentState extends State<CorbadoAuthComponent> {
  late Stream<ComponentWithData> _componentStream;

  @override
  void initState() {
    super.initState();
    _componentStream = widget.corbadoAuth.componentWithDataStream;

    widget.corbadoAuth.initProcessHandler();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ComponentWithData>(
      stream: _componentStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final d = snapshot.data!;

          return switch (d.screenName) {
            ScreenNames.SignupInit => widget.components.signupInit!(
              d.block as SignupInitBlock,
            ),
            ScreenNames.LoginInit => widget.components.loginInit!(
              d.block as LoginInitBlock,
            ),
            ScreenNames.EmailVerifyOTP => widget.components.emailVerifyOtp!(
              d.block as EmailVerifyBlock,
            ),
            ScreenNames.PasskeyAppend => widget.components.passkeyAppend!(
              d.block as PasskeyAppendBlock,
            ),
            ScreenNames.PasskeyVerify => widget.components.passkeyVerify!(
              d.block as PasskeyVerifyBlock,
            ),
            ScreenNames.EmailEdit => widget.components.emailEdit!(
              d.block as EmailVerifyBlock,
            ),
            ScreenNames.EmailVerifyLink => throw UnimplementedError(),
          };
        } else {
          if (widget.loading != null) return widget.loading!;
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
