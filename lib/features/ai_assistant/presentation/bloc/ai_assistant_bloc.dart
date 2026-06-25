import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/assistant_message.dart';
import '../../domain/repositories/ai_assistant_repository.dart';

part 'ai_assistant_bloc.freezed.dart';

@freezed
abstract class AiAssistantEvent with _$AiAssistantEvent {
  const factory AiAssistantEvent.sendMessage({required String prompt}) =
      SendMessage;
}

@freezed
abstract class AiAssistantState with _$AiAssistantState {
  const factory AiAssistantState.initial({
    @Default([]) List<AssistantMessage> messages,
  }) = AiAssistantInitial;

  const factory AiAssistantState.loading({
    required List<AssistantMessage> messages,
  }) = AiAssistantLoading;

  const factory AiAssistantState.success({
    required List<AssistantMessage> messages,
  }) = AiAssistantSuccess;

  const factory AiAssistantState.error({
    required List<AssistantMessage> messages,
    required String message,
  }) = AiAssistantError;
}

@injectable
class AiAssistantBloc extends Bloc<AiAssistantEvent, AiAssistantState> {
  final AiAssistantRepository _aiAssistantRepository;

  AiAssistantBloc(this._aiAssistantRepository)
    : super(const AiAssistantState.initial()) {
    on<SendMessage>(_onSendMessage);
  }

  Future<void> _onSendMessage(
    SendMessage event,
    Emitter<AiAssistantState> emit,
  ) async {
    final currentMessages = state.maybeMap(
      initial: (s) => s.messages,
      loading: (s) => s.messages,
      success: (s) => s.messages,
      error: (s) => s.messages,
      orElse: () => <AssistantMessage>[],
    );

    final userMessage = AssistantMessage(
      role: 'user',
      content: event.prompt,
      timestamp: DateTime.now(),
    );

    final updatedMessagesWithUser = [...currentMessages, userMessage];
    emit(AiAssistantState.loading(messages: updatedMessagesWithUser));

    print('📨 Bloc: Sending message: "${event.prompt}"');
    final result = await _aiAssistantRepository.sendMessage(
      prompt: event.prompt,
      history: currentMessages,
    );

    result.fold(
      (failure) {
        print('❌ Bloc: Received failure: ${failure.message}');
        emit(
          AiAssistantState.error(
            messages: updatedMessagesWithUser,
            message: failure.message,
          ),
        );
      },
      (assistantMessage) {
        print('✅ Bloc: Received response: "${assistantMessage.content}"');
        emit(
          AiAssistantState.success(
            messages: [...updatedMessagesWithUser, assistantMessage],
          ),
        );
      },
    );
  }
}
