import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class Visual2Record extends FirestoreRecord {
  Visual2Record._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "pregunta_vis2" field.
  String? _preguntaVis2;
  String get preguntaVis2 => _preguntaVis2 ?? '';
  bool hasPreguntaVis2() => _preguntaVis2 != null;

  // "resp_corr_vis2" field.
  String? _respCorrVis2;
  String get respCorrVis2 => _respCorrVis2 ?? '';
  bool hasRespCorrVis2() => _respCorrVis2 != null;

  void _initializeFields() {
    _preguntaVis2 = snapshotData['pregunta_vis2'] as String?;
    _respCorrVis2 = snapshotData['resp_corr_vis2'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Visual_2');

  static Stream<Visual2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Visual2Record.fromSnapshot(s));

  static Future<Visual2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Visual2Record.fromSnapshot(s));

  static Visual2Record fromSnapshot(DocumentSnapshot snapshot) =>
      Visual2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Visual2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Visual2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Visual2Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Visual2Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVisual2RecordData({
  String? preguntaVis2,
  String? respCorrVis2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pregunta_vis2': preguntaVis2,
      'resp_corr_vis2': respCorrVis2,
    }.withoutNulls,
  );

  return firestoreData;
}

class Visual2RecordDocumentEquality implements Equality<Visual2Record> {
  const Visual2RecordDocumentEquality();

  @override
  bool equals(Visual2Record? e1, Visual2Record? e2) {
    return e1?.preguntaVis2 == e2?.preguntaVis2 &&
        e1?.respCorrVis2 == e2?.respCorrVis2;
  }

  @override
  int hash(Visual2Record? e) =>
      const ListEquality().hash([e?.preguntaVis2, e?.respCorrVis2]);

  @override
  bool isValidKey(Object? o) => o is Visual2Record;
}
