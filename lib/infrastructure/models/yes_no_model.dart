// //esta clase funciona como un dto, el cual es quien recibe los datos y brinda la estructura de la respuesta
// // para que si llega a varias la respuesta el cambio solo se realiza en esta clase y no en toda la aplicacion,
// //ademas de que esta clase se encarga de transformar los datos que llegan de la API en objetos de nuestro dominio,
// //en este caso, objetos de tipo Message, que es el tipo de mensaje que usamos en nuestra aplicacion para mostrar los
// //mensajes en el chat.

// class YesNoModel {
//   final String answer;
//   final String image;
//   final String question;

//   YesNoModel({
//     required this.answer,
//     required this.image,
//     required this.question,
//   });

//   factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
//     answer: json['answer'],
//     image: json['image'],
//     question: json['question'] ?? '',
//   ); // se agrega un valor por defecto para la pregunta, ya que la API no siempre devuelve una pregunta, y esto evita que
//   // se lance un error de tipo Null cuando se intente acceder a la pregunta en el mensaje de respuesta.
// }


// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

import 'dart:convert';

import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };

    Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'Si' : 'No', // se transforma la respuesta de la API en un mensaje de texto mas amigable para el usuario, ya que la API devuelve 'yes' o 'no', y esto se transforma en 'Si' o 'No' para que sea mas facil de entender para el usuario.
      fromWho: FromWho.hers,
      imageUrl: image
    );
}
