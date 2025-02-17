import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/process_handler.dart';
import 'package:corbado_auth/src/types/process_handler.dart';
import 'package:flutter/material.dart';

class CorbadoScreens {
  CorbadoScreens(
      {this.loginInit,
      this.passkeyVerify,
      this.passkeyAppend,
      this.emailVerifyOtp,
      this.signupInit,
      this.emailEdit});

  final CorbadoScreen<SignupInitBlock> Function(SignupInitBlock)? signupInit;
  final CorbadoScreen<LoginInitBlock> Function(LoginInitBlock)? loginInit;
  final CorbadoScreen<PasskeyVerifyBlock> Function(PasskeyVerifyBlock)?
      passkeyVerify;
  final CorbadoScreen<PasskeyAppendBlock> Function(PasskeyAppendBlock)?
      passkeyAppend;
  final CorbadoScreen<EmailVerifyBlock> Function(EmailVerifyBlock)?
      emailVerifyOtp;
  final CorbadoScreen<EmailVerifyBlock> Function(EmailVerifyBlock)? emailEdit;
}

// CorbadoAuthComponent listens to a Stream<Widget> and rebuilds itself
// whenever a new widget is emitted.
class CorbadoAuthComponent extends StatefulWidget {
  final CorbadoAuth corbadoAuth;
  final CorbadoScreens components;
  final Widget? loading;

  CorbadoAuthComponent(
      {required this.corbadoAuth, required this.components, this.loading});

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

          switch (d.screenName) {
            case ScreenNames.SignupInit:
              return widget.components.signupInit!(d.block as SignupInitBlock);
            case ScreenNames.LoginInit:
              return widget.components.loginInit!(d.block as LoginInitBlock);
            case ScreenNames.EmailVerifyOTP:
              return widget
                  .components.emailVerifyOtp!(d.block as EmailVerifyBlock);
            case ScreenNames.PasskeyAppend:
              return widget
                  .components.passkeyAppend!(d.block as PasskeyAppendBlock);
            case ScreenNames.PasskeyVerify:
              return widget
                  .components.passkeyVerify!(d.block as PasskeyVerifyBlock);
            case ScreenNames.EmailEdit:
              return widget.components.emailEdit!(d.block as EmailVerifyBlock);
            case ScreenNames.EmailVerifyLink:
              throw UnimplementedError();
          }
        } else {
          if (widget.loading != null) return widget.loading!;
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
