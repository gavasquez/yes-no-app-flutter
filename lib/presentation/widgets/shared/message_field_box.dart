import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  //* Emitimos el valor al padre
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    /* final colors = Theme.of(context).colorScheme; */

    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
        hintText: 'End your message wiath a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
            onPressed: () {
              final textValue = textController.value.text;
              onValue(textValue);
              textController.clear();
            },
            icon: const Icon(Icons.send_outlined)));

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        // Siempre mantener el foco activo
        focusNode.requestFocus();
      },
      /* onChanged: (value) {
        print('Changed $value');
      }, */
    );
  }
}
