import 'package:corbado_auth/src/blocks/types.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';

class CompletedBlockData {
  CompletedBlockData(this.shortSession, this.longSession);

  factory CompletedBlockData.fromProcessResponse(GeneralBlockCompleted typed) {
    return CompletedBlockData(typed.shortSession, typed.longSession);
  }
  final String shortSession;
  final String? longSession;
}

class CompletedBlock extends Block<CompletedBlockData> {
  CompletedBlock({
    required super.processHandler,
    required super.data,
  }) : super(
         type: BlockType.completed,
         alternatives: [],
         authProcessType: AuthProcessType.Login,
       );
}
