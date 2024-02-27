import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class VideoPregRecord extends FirestoreRecord {
  VideoPregRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "text_pregunta" field.
  String? _textPregunta;
  String get textPregunta => _textPregunta ?? '';
  bool hasTextPregunta() => _textPregunta != null;

  // "respuesta_correcta_vide" field.
  String? _respuestaCorrectaVide;
  String get respuestaCorrectaVide => _respuestaCorrectaVide ?? '';
  bool hasRespuestaCorrectaVide() => _respuestaCorrectaVide != null;

  void _initializeFields() {
    _textPregunta = snapshotData['text_pregunta'] as String?;
    _respuestaCorrectaVide = snapshotData['respuesta_correcta_vide'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Video_preg');

  static Stream<VideoPregRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideoPregRecord.fromSnapshot(s));

  static Future<VideoPregRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideoPregRecord.fromSnapshot(s));

  static VideoPregRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VideoPregRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideoPregRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideoPregRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideoPregRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideoPregRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideoPregRecordData({
  String? textPregunta,
  String? respuestaCorrectaVide,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text_pregunta': textPregunta,
      'respuesta_correcta_vide': respuestaCorrectaVide,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideoPregRecordDocumentEquality implements Equality<VideoPregRecord> {
  const VideoPregRecordDocumentEquality();

  @override
  bool equals(VideoPregRecord? e1, VideoPregRecord? e2) {
    return e1?.textPregunta == e2?.textPregunta &&
        e1?.respuestaCorrectaVide == e2?.respuestaCorrectaVide;
  }

  @override
  int hash(VideoPregRecord? e) =>
      const ListEquality().hash([e?.textPregunta, e?.respuestaCorrectaVide]);

  @override
  bool isValidKey(Object? o) => o is VideoPregRecord;
}
