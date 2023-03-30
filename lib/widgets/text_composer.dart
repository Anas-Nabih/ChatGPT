import 'package:chatgpt/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TextComposer extends StatefulWidget {
  final ChatProvider chatProvider;

  const TextComposer({
    required this.chatProvider,
    super.key,
  });

  @override
  State<TextComposer> createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.cardColor),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: widget.chatProvider.composerController,
            decoration:
                const InputDecoration.collapsed(hintText: "Send Message"),
          )),
          IconButton(
              onPressed: () => widget.chatProvider.sendMessage(
                  msgText: widget.chatProvider.composerController.text,
                  msgSender: "anas"),
              icon: const Icon(Icons.send))
        ],
      ).px12(),
    );
  }
}
