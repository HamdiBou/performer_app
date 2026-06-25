import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/ai_assistant_bloc.dart';
import '../../domain/entities/assistant_message.dart';

class AiAssistantScreen extends StatefulWidget {
  const AiAssistantScreen({Key? key}) : super(key: key);

  @override
  State<AiAssistantScreen> createState() => _AiAssistantScreenState();
}

class _AiAssistantScreenState extends State<AiAssistantScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Conference Guide'),
        centerTitle: true,
      ),
      body: BlocListener<AiAssistantBloc, AiAssistantState>(
        listener: (context, state) {
          state.maybeMap(
            error: (errorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(errorState.message),
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 4),
                ),
              );
            },
            orElse: () {},
          );
        },
        child: BlocBuilder<AiAssistantBloc, AiAssistantState>(
          builder: (context, state) {
            final messages = state.maybeMap(
              initial: (s) => s.messages,
              loading: (s) => s.messages,
              success: (s) => s.messages,
              error: (s) => s.messages,
              orElse: () => <AssistantMessage>[],
            );

            return Column(
              children: [
                Expanded(
                  child: messages.isEmpty
                      ? Center(
                          child: Text(
                            'Hello! How can I help you navigate the conference today?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.all(16.h),
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final message = messages[index];
                            final isUser = message.role == 'user';
                            return ChatBubble(message: message, isUser: isUser);
                          },
                        ),
                ),
                if (state is AiAssistantLoading)
                  Padding(
                    padding: EdgeInsets.all(8.h),
                    child: const LinearProgressIndicator(),
                  ),
                _buildInputArea(context),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildInputArea(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Ask me anything...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () {
                if (_controller.text.trim().isNotEmpty) {
                  context.read<AiAssistantBloc>().add(
                    AiAssistantEvent.sendMessage(
                      prompt: _controller.text.trim(),
                    ),
                  );
                  _controller.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final AssistantMessage message;
  final bool isUser;

  const ChatBubble({Key? key, required this.message, required this.isUser})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        constraints: BoxConstraints(maxWidth: 0.75.sw),
        decoration: BoxDecoration(
          color: isUser ? Theme.of(context).primaryColor : Colors.grey[300],
          borderRadius: BorderRadius.circular(15.r).copyWith(
            bottomRight: isUser ? Radius.zero : Radius.circular(15.r),
            bottomLeft: isUser ? Radius.circular(15.r) : Radius.zero,
          ),
        ),
        child: Text(
          message.content,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
