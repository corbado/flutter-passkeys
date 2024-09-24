import 'package:corbado_auth/src/blocks/types.dart';
import 'package:corbado_auth/src/process_handler.dart';
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
      required this.retryNotBefore,
      required this.isPostLoginVerification});

  final String email;
  final VerificationMethod verificationMethod;
  DateTime? retryNotBefore;
  final bool? isPostLoginVerification;
  bool primaryLoading = false;

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
      retryNotBefore: retryNotBefore,
      isPostLoginVerification: typed.isPostLoginVerification,
    );
  }
}

class EmailVerifyBlock extends Block<EmailVerifyBlockData> {
  EmailVerifyBlock({required ProcessHandler processHandler, required EmailVerifyBlockData data, required Api.AuthType authType})
      : super(
          processHandler: processHandler,
          type: Api.BlockType.emailVerify,
          alternatives: [],
          initialScreen: ScreenNames.EmailVerifyOTP,
          data: data,
          authProcessType: authType == Api.AuthType.login ? AuthProcessType.Login : AuthProcessType.Signup,
        );

  init() {
    // navigateToVerifyEmail();
  }

  navigateToEditEmail() {
    error = null;
    processHandler.updateCurrentScreen(ScreenNames.EmailEdit);
  }

  navigateToVerifyEmail() {
    error = null;

    if (data.verificationMethod == VerificationMethod.emailOTP) {
      processHandler.updateCurrentScreen(ScreenNames.EmailVerifyOTP);
    } else {
      processHandler.updateCurrentScreen(ScreenNames.EmailVerifyOTP);
    }
  }

  submitOtpCode(String otpCode) async {
    try {
      data.primaryLoading = true;
      processHandler.notifyCurrentScreen();

      final res = await corbadoService.verifyEmailOtpCode(otpCode);
      processHandler.updateBlockFromServer(res);
    } on CorbadoError catch (e) {
      data.primaryLoading = false;
      processHandler.updateBlockFromError(e);
    }
  }

  resendEmail() async {
    try {
      if (data.verificationMethod == VerificationMethod.emailOTP) {
        final res = await corbadoService.sendEmailOtpCode();
        processHandler.updateBlockFromServer(res);

        return;
      } else {
        final res = await corbadoService.sendEmailLink();
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
