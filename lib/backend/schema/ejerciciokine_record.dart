import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class EjerciciokineRecord extends FirestoreRecord {
  EjerciciokineRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Pregunta" field.
  String? _pregunta;
  String get pregunta => _pregunta ?? '';
  bool hasPregunta() => _pregunta != null;

  // "respuesta" field.
  String? _respuesta;
  String get respuesta => _respuesta ?? '';
  bool hasRespuesta() => _respuesta != null;

  void _initializeFields() {
    _pregunta = snapshotData['Pregunta'] as String?;
    _respuesta = snapshotData['respuesta'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ejerciciokine');

  static Stream<EjerciciokineRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EjerciciokineRecord.fromSnapshot(s));

  static Future<EjerciciokineRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EjerciciokineRecord.fromSnapshot(s));

  static EjerciciokineRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EjerciciokineRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EjerciciokineRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EjerciciokineRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EjerciciokineRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EjerciciokineRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEjerciciokineRecordData({
  String? pregunta,
  String? respuesta,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Pregunta': pregunta,
      'respuesta': respuesta,
    }.withoutNulls,
  );

  return firestoreData;
}

class EjerciciokineRecordDocumentEquality
    implements Equality<EjerciciokineRecord> {
  const EjerciciokineRecordDocumentEquality();

  @override
  bool equals(EjerciciokineRecord? e1, EjerciciokineRecord? e2) {
    return e1?.pregunta == e2?.pregunta && e1?.respuesta == e2?.respuesta;
  }

  @override
  int hash(EjerciciokineRecord? e) =>
      const ListEquality().hash([e?.pregunta, e?.respuesta]);

  @override
  bool isValidKey(Object? o) => o is EjerciciokineRecord;
}
