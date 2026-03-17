import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message; // aca se declaro la variable message que se va a mostrar en el widget, 
                        //esta variable es de tipo String y es requerida para crear una instancia de MyMessageBubble.

  const MyMessageBubble({
    super.key, 
    required this.message // se agrego akl cosntructor y se marca como requerido
    });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration:BoxDecoration(
            color: colors.primary,
            borderRadius:BorderRadius.circular(20.0)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(message.text, style: const TextStyle(color: Colors.white)), // Mostrar el mensaje
          ),
        ),
        
        const SizedBox(height: 5.0,),
      ],
    );
  }
}