import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class OpcionRespuestaTestRecord extends FirestoreRecord {
  OpcionRespuestaTestRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "preguntaTest" field.
  DocumentReference? _preguntaTest;
  DocumentReference? get preguntaTest => _preguntaTest;
  bool hasPreguntaTest() => _preguntaTest != null;

  // "valorRespuestaTest" field.
  String? _valorRespuestaTest;
  String get valorRespuestaTest => _valorRespuestaTest ?? '';
  bool hasValorRespuestaTest() => _valorRespuestaTest != null;

  void _initializeFields() {
    _preguntaTest = snapshotData['preguntaTest'] as DocumentReference?;
    _valorRespuestaTest = snapshotData['valorRespuestaTest'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('opcionRespuestaTest');

  static Stream<OpcionRespuestaTestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OpcionRespuestaTestRecord.fromSnapshot(s));

  static Future<OpcionRespuestaTestRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => OpcionRespuestaTestRecord.fromSnapshot(s));

  static OpcionRespuestaTestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OpcionRespuestaTestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OpcionRespuestaTestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OpcionRespuestaTestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OpcionRespuestaTestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OpcionRespuestaTestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOpcionRespuestaTestRecordData({
  DocumentReference? preguntaTest,
  String? valorRespuestaTest,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'preguntaTest': preguntaTest,
      'valorRespuestaTest': valorRespuestaTest,
    }.withoutNulls,
  );

  return firestoreData;
}

class OpcionRespuestaTestRecordDocumentEquality
    implements Equality<OpcionRespuestaTestRecord> {
  const OpcionRespuestaTestRecordDocumentEquality();

  @override
  bool equals(OpcionRespuestaTestRecord? e1, OpcionRespuestaTestRecord? e2) {
    return e1?.preguntaTest == e2?.preguntaTest &&
        e1?.valorRespuestaTest == e2?.valorRespuestaTest;
  }

  @override
  int hash(OpcionRespuestaTestRecord? e) =>
      const ListEquality().hash([e?.preguntaTest, e?.valorRespuestaTest]);

  @override
  bool isValidKey(Object? o) => o is OpcionRespuestaTestRecord;
}
