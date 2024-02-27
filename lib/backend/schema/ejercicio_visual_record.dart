import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class EjercicioVisualRecord extends FirestoreRecord {
  EjercicioVisualRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Preg_vis1" field.
  String? _pregVis1;
  String get pregVis1 => _pregVis1 ?? '';
  bool hasPregVis1() => _pregVis1 != null;

  // "Resp_corr_vis1" field.
  String? _respCorrVis1;
  String get respCorrVis1 => _respCorrVis1 ?? '';
  bool hasRespCorrVis1() => _respCorrVis1 != null;

  void _initializeFields() {
    _pregVis1 = snapshotData['Preg_vis1'] as String?;
    _respCorrVis1 = snapshotData['Resp_corr_vis1'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Ejercicio_visual');

  static Stream<EjercicioVisualRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EjercicioVisualRecord.fromSnapshot(s));

  static Future<EjercicioVisualRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EjercicioVisualRecord.fromSnapshot(s));

  static EjercicioVisualRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EjercicioVisualRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EjercicioVisualRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EjercicioVisualRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EjercicioVisualRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EjercicioVisualRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEjercicioVisualRecordData({
  String? pregVis1,
  String? respCorrVis1,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Preg_vis1': pregVis1,
      'Resp_corr_vis1': respCorrVis1,
    }.withoutNulls,
  );

  return firestoreData;
}

class EjercicioVisualRecordDocumentEquality
    implements Equality<EjercicioVisualRecord> {
  const EjercicioVisualRecordDocumentEquality();

  @override
  bool equals(EjercicioVisualRecord? e1, EjercicioVisualRecord? e2) {
    return e1?.pregVis1 == e2?.pregVis1 && e1?.respCorrVis1 == e2?.respCorrVis1;
  }

  @override
  int hash(EjercicioVisualRecord? e) =>
      const ListEquality().hash([e?.pregVis1, e?.respCorrVis1]);

  @override
  bool isValidKey(Object? o) => o is EjercicioVisualRecord;
}
