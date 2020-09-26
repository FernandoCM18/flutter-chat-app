// To parse this JSON data, do
//
//     final mensajesRespose = mensajesResposeFromJson(jsonString);

import 'dart:convert';

MensajesRespose mensajesResposeFromJson(String str) => MensajesRespose.fromJson(json.decode(str));

String mensajesResposeToJson(MensajesRespose data) => json.encode(data.toJson());

class MensajesRespose {
    MensajesRespose({
        this.ok,
        this.mensajes,
    });

    bool ok;
    List<Mensaje> mensajes;

    factory MensajesRespose.fromJson(Map<String, dynamic> json) => MensajesRespose(
        ok: json["ok"],
        mensajes: List<Mensaje>.from(json["mensajes"].map((x) => Mensaje.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "mensajes": List<dynamic>.from(mensajes.map((x) => x.toJson())),
    };
}

class Mensaje {
    Mensaje({
        this.de,
        this.para,
        this.mensaje,
        this.createdAt,
        this.updatedAt,
    });

    String de;
    String para;
    String mensaje;
    DateTime createdAt;
    DateTime updatedAt;

    factory Mensaje.fromJson(Map<String, dynamic> json) => Mensaje(
        de: json["de"],
        para: json["para"],
        mensaje: json["mensaje"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "de": de,
        "para": para,
        "mensaje": mensaje,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
