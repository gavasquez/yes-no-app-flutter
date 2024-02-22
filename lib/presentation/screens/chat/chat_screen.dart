import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Amor ♥'),
        //* Centrar titulo en el appBar
        centerTitle: false,
        //* Un espacio antes del titulo
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'data:image/jpeg;base64,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'),
          ),
        ),
      ),
      body: const ChatView(),
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              //* Enlazamos el controller con el provider
              controller: chatProvider.chatScrollController,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];
                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(
                        message: message,
                      )
                    : MyMessageBubble(
                        message: message,
                      );
                /* return (index % 2 == 0) */
                /*     ? const HerMessageBubble() */
                /*     : const MyMessageBubble(); */
              },
              itemCount: chatProvider.messageList.length,
            )),
            //* Caja de texto de mensajes
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}
