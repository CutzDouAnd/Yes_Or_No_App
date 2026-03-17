import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message
  message; // aca se declaro la variable message que se va a mostrar en el widget,

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Text(message.text, style: TextStyle(color: Colors.white)),
          ),
        ),

        const SizedBox(height: 5.0),

        _ImageBubble(message.imageUrl!),

        SizedBox(height: 10.0),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //print(size);

    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.network(
        imageUrl ?? 'https://i.pinimg.com/originals/1c/8b/0e/1c8b0e7a9d9f2a3cbbd9a1e5c6f4b4.jpg',
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            ),
            child: const Text('Robbin esta enviando una imagen...'),
          );
        },
      ),
    );
  }
}
