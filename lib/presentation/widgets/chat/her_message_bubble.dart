import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    //* Obtener el theme
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        //Todo: Imagen
        _ImageBubble(
          image: message.imageUrl!,
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String image;

  const _ImageBubble({required this.image});
  @override
  Widget build(BuildContext context) {
    //* Obtener las dimenciones del dispositivo
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(loadingBuilder: (context, child, loadingProgress) {
        // loadingProgress indica si ya cargo la imagen y el child es la imagen
        if (loadingProgress == null) return child;
        return Container(
          width: size.width * 0.7,
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: const Text('Mi amor esta enviando un mensaje...'),
        );
      }, fit: BoxFit.cover, width: size.width * 0.7, height: 150, image),
    );
  }
}
