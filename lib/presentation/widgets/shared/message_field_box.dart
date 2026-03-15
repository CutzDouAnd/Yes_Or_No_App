import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final textContoller= TextEditingController();
    final focusNode= FocusNode();

    //final colors = Theme.of(context).colorScheme;

    final OutlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide: const BorderSide(color: Colors.transparent)
    );

    final InputDecorationD = InputDecoration(
     
        enabledBorder: OutlineInputBorder,
        focusedBorder: OutlineInputBorder,
         hintText: 'End your message with a "?"',
         contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textContoller.value.text;
            print('button: $textValue');
            textContoller.clear(); // Limpia el campo de texto después de presionar el botón
          }
        ),
       
      );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textContoller,
      decoration: InputDecorationD,
      onFieldSubmitted: (value) {
          print('Submitted value: $value');
          textContoller.clear();
          focusNode.requestFocus();
      },
    );
  }
}