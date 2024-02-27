import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class EjerciciosSeleccionRecord extends FirestoreRecord {
  EjerciciosSeleccionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "texto_pregunta" field.
  String? _textoPregunta;
  String get textoPregunta => _textoPregunta ?? '';
  bool hasTextoPregunta() => _textoPregunta != null;

  // "respuesta_correcta" field.
  String? _respuestaCorrecta;
  String get respuestaCorrecta => _respuestaCorrecta ?? '';
  bool hasRespuestaCorrecta() => _respuestaCorrecta != null;

  void _initializeFields() {
    _textoPregunta = snapshotData['texto_pregunta'] as String?;
    _respuestaCorrecta = snapshotData['respuesta_correcta'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Ejercicios_seleccion');

  static Stream<EjerciciosSeleccionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EjerciciosSeleccionRecord.fromSnapshot(s));

  static Future<EjerciciosSeleccionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EjerciciosSeleccionRecord.fromSnapshot(s));

  static EjerciciosSeleccionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EjerciciosSeleccionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EjerciciosSeleccionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EjerciciosSeleccionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EjerciciosSeleccionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EjerciciosSeleccionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEjerciciosSeleccionRecordData({
  String? textoPregunta,
  String? respuestaCorrecta,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'texto_pregunta': textoPregunta,
      'respuesta_correcta': respuestaCorrecta,
    }.withoutNulls,
  );

  return firestoreData;
}

class EjerciciosSeleccionRecordDocumentEquality
    implements Equality<EjerciciosSeleccionRecord> {
  const EjerciciosSeleccionRecordDocumentEquality();

  @override
  bool equals(EjerciciosSeleccionRecord? e1, EjerciciosSeleccionRecord? e2) {
    return e1?.textoPregunta == e2?.textoPregunta &&
        e1?.respuestaCorrecta == e2?.respuestaCorrecta;
  }

  @override
  int hash(EjerciciosSeleccionRecord? e) =>
      const ListEquality().hash([e?.textoPregunta, e?.respuestaCorrecta]);

  @override
  bool isValidKey(Object? o) => o is EjerciciosSeleccionRecord;
}
