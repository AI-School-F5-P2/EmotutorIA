import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class OpcionesVis1Record extends FirestoreRecord {
  OpcionesVis1Record._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "preg_vis1" field.
  String? _pregVis1;
  String get pregVis1 => _pregVis1 ?? '';
  bool hasPregVis1() => _pregVis1 != null;

  // "opc_resp_vis1" field.
  String? _opcRespVis1;
  String get opcRespVis1 => _opcRespVis1 ?? '';
  bool hasOpcRespVis1() => _opcRespVis1 != null;

  void _initializeFields() {
    _pregVis1 = snapshotData['preg_vis1'] as String?;
    _opcRespVis1 = snapshotData['opc_resp_vis1'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('opciones_vis1');

  static Stream<OpcionesVis1Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OpcionesVis1Record.fromSnapshot(s));

  static Future<OpcionesVis1Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OpcionesVis1Record.fromSnapshot(s));

  static OpcionesVis1Record fromSnapshot(DocumentSnapshot snapshot) =>
      OpcionesVis1Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OpcionesVis1Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OpcionesVis1Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OpcionesVis1Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OpcionesVis1Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOpcionesVis1RecordData({
  String? pregVis1,
  String? opcRespVis1,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'preg_vis1': pregVis1,
      'opc_resp_vis1': opcRespVis1,
    }.withoutNulls,
  );

  return firestoreData;
}

class OpcionesVis1RecordDocumentEquality
    implements Equality<OpcionesVis1Record> {
  const OpcionesVis1RecordDocumentEquality();

  @override
  bool equals(OpcionesVis1Record? e1, OpcionesVis1Record? e2) {
    return e1?.pregVis1 == e2?.pregVis1 && e1?.opcRespVis1 == e2?.opcRespVis1;
  }

  @override
  int hash(OpcionesVis1Record? e) =>
      const ListEquality().hash([e?.pregVis1, e?.opcRespVis1]);

  @override
  bool isValidKey(Object? o) => o is OpcionesVis1Record;
}
