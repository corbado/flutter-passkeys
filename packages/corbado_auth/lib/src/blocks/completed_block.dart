import 'package:corbado_auth/src/blocks/types.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';

/// Data backing a completed authentication process, holding the session tokens.
class CompletedBlockData {
  /// Creates the data with the resulting [shortSession] and [longSession].
  CompletedBlockData(this.shortSession, this.longSession);

  /// Builds the data from a server [GeneralBlockCompleted] response.
  factory CompletedBlockData.fromProcessResponse(GeneralBlockCompleted typed) {
    return CompletedBlockData(typed.shortSession, typed.longSession);
  }

  /// The short-lived session token.
  final String shortSession;

  /// The optional long-lived session token.
  final String? longSession;
}

/// Block representing a successfully completed authentication process.
class CompletedBlock extends Block<CompletedBlockData> {
  /// Creates the block with the given process handler and data.
  CompletedBlock({
    required super.processHandler,
    required super.data,
  }) : super(
         type: BlockType.completed,
         alternatives: [],
         authProcessType: AuthProcessType.Login,
       );
}
