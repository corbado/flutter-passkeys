import 'package:corbado_auth/src/blocks/types.dart';
import 'package:corbado_auth/src/process_handler.dart';
import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_auth/src/types/screen_names.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart' as Api;

enum VerificationMethod {
  emailOTP,
  emailLink,
}

class EmailVerifyBlockData {
  EmailVerifyBlockData(
      {required this.email,
      required this.verificationMethod,
      required this.error,
      required this.retryNotBefore,
      required this.isPostLoginVerification});

  final String email;
  final VerificationMethod verificationMethod;
  CorbadoError? error;
  DateTime? retryNotBefore;
  final bool? isPostLoginVerification;

  factory EmailVerifyBlockData.fromProcessResponse(Api.GeneralBlockVerifyIdentifier typed) {
    final verificationMethod = typed.verificationMethod == Api.VerificationMethod.emailOtp
        ? VerificationMethod.emailOTP
        : VerificationMethod.emailLink;

    DateTime? retryNotBefore;
    if (typed.retryNotBefore != null) {
      retryNotBefore = DateTime.fromMillisecondsSinceEpoch(typed.retryNotBefore! * 1000);
    }

    return EmailVerifyBlockData(
      email: typed.identifier,
      verificationMethod: verificationMethod,
      error: CorbadoError.fromRequestError(typed.error),
      retryNotBefore: retryNotBefore,
      isPostLoginVerification: typed.isPostLoginVerification,
    );
  }
}

class EmailVerifyBlock extends Block {
  final EmailVerifyBlockData data;

  EmailVerifyBlock({required ProcessHandler processHandler, required this.data})
      : super(
          processHandler: processHandler,
          type: Api.BlockType.emailVerify,
          alternatives: [],
          initialScreen: ScreenNames.EmailVerifyOTP,
        );

  init() {
    navigateToVerifyEmail();
  }

  navigateToEditEmail() {
    data.error = null;
    processHandler.updateCurrentScreen(ScreenNames.EmailEdit);
  }

  navigateToVerifyEmail() {
    data.error = null;

    if (data.verificationMethod == VerificationMethod.emailOTP) {
      processHandler.updateCurrentScreen(ScreenNames.EmailVerifyOTP);
    } else {
      processHandler.updateCurrentScreen(ScreenNames.EmailVerifyOTP);
    }
  }

  submitOtpCode(String otpCode) async {
    try {
      final res = await corbadoService.verifyEmailOtpCode(otpCode);
      processHandler.updateBlockFromServer(res);
    } on CorbadoError catch (e) {
      processHandler.updateBlockFromError(e);
    }
  }

  resendEmail() async {
    try {
      if (data.verificationMethod == VerificationMethod.emailOTP) {
        final res = await corbadoService.sendEmailOtpCode(data.email);
        processHandler.updateBlockFromServer(res);

        return;
      } else {
        final res = await corbadoService.sendEmailLink(data.email);
        processHandler.updateBlockFromServer(res);

        return;
      }
    } on CorbadoError catch (e) {
      processHandler.updateBlockFromError(e);
    }
  }

  updateEmail(String newValue) async {
    try {
      final res = await corbadoService.updateEmail(newValue);
      processHandler.updateBlockFromServer(res);
    } on CorbadoError catch (e) {
      processHandler.updateBlockFromError(e);
    }
  }
}
