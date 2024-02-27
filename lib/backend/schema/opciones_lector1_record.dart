import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class OpcionesLector1Record extends FirestoreRecord {
  OpcionesLector1Record._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "pregunta" field.
  String? _pregunta;
  String get pregunta => _pregunta ?? '';
  bool hasPregunta() => _pregunta != null;

  // "respuesta_lector1" field.
  String? _respuestaLector1;
  String get respuestaLector1 => _respuestaLector1 ?? '';
  bool hasRespuestaLector1() => _respuestaLector1 != null;

  void _initializeFields() {
    _pregunta = snapshotData['pregunta'] as String?;
    _respuestaLector1 = snapshotData['respuesta_lector1'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Opciones_Lector1');

  static Stream<OpcionesLector1Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OpcionesLector1Record.fromSnapshot(s));

  static Future<OpcionesLector1Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OpcionesLector1Record.fromSnapshot(s));

  static OpcionesLector1Record fromSnapshot(DocumentSnapshot snapshot) =>
      OpcionesLector1Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OpcionesLector1Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OpcionesLector1Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OpcionesLector1Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OpcionesLector1Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOpcionesLector1RecordData({
  String? pregunta,
  String? respuestaLector1,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pregunta': pregunta,
      'respuesta_lector1': respuestaLector1,
    }.withoutNulls,
  );

  return firestoreData;
}

class OpcionesLector1RecordDocumentEquality
    implements Equality<OpcionesLector1Record> {
  const OpcionesLector1RecordDocumentEquality();

  @override
  bool equals(OpcionesLector1Record? e1, OpcionesLector1Record? e2) {
    return e1?.pregunta == e2?.pregunta &&
        e1?.respuestaLector1 == e2?.respuestaLector1;
  }

  @override
  int hash(OpcionesLector1Record? e) =>
      const ListEquality().hash([e?.pregunta, e?.respuestaLector1]);

  @override
  bool isValidKey(Object? o) => o is OpcionesLector1Record;
}
