import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class Vis2OpcRecord extends FirestoreRecord {
  Vis2OpcRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id_preg_vis2" field.
  String? _idPregVis2;
  String get idPregVis2 => _idPregVis2 ?? '';
  bool hasIdPregVis2() => _idPregVis2 != null;

  // "opciones_vis2" field.
  String? _opcionesVis2;
  String get opcionesVis2 => _opcionesVis2 ?? '';
  bool hasOpcionesVis2() => _opcionesVis2 != null;

  // "img_title" field.
  String? _imgTitle;
  String get imgTitle => _imgTitle ?? '';
  bool hasImgTitle() => _imgTitle != null;

  void _initializeFields() {
    _idPregVis2 = snapshotData['id_preg_vis2'] as String?;
    _opcionesVis2 = snapshotData['opciones_vis2'] as String?;
    _imgTitle = snapshotData['img_title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vis_2_opc');

  static Stream<Vis2OpcRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Vis2OpcRecord.fromSnapshot(s));

  static Future<Vis2OpcRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Vis2OpcRecord.fromSnapshot(s));

  static Vis2OpcRecord fromSnapshot(DocumentSnapshot snapshot) =>
      Vis2OpcRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Vis2OpcRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Vis2OpcRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Vis2OpcRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Vis2OpcRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVis2OpcRecordData({
  String? idPregVis2,
  String? opcionesVis2,
  String? imgTitle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_preg_vis2': idPregVis2,
      'opciones_vis2': opcionesVis2,
      'img_title': imgTitle,
    }.withoutNulls,
  );

  return firestoreData;
}

class Vis2OpcRecordDocumentEquality implements Equality<Vis2OpcRecord> {
  const Vis2OpcRecordDocumentEquality();

  @override
  bool equals(Vis2OpcRecord? e1, Vis2OpcRecord? e2) {
    return e1?.idPregVis2 == e2?.idPregVis2 &&
        e1?.opcionesVis2 == e2?.opcionesVis2 &&
        e1?.imgTitle == e2?.imgTitle;
  }

  @override
  int hash(Vis2OpcRecord? e) =>
      const ListEquality().hash([e?.idPregVis2, e?.opcionesVis2, e?.imgTitle]);

  @override
  bool isValidKey(Object? o) => o is Vis2OpcRecord;
}
