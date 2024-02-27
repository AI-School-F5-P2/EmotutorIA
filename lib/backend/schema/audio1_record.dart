import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class Audio1Record extends FirestoreRecord {
  Audio1Record._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "preg_au1" field.
  String? _pregAu1;
  String get pregAu1 => _pregAu1 ?? '';
  bool hasPregAu1() => _pregAu1 != null;

  // "resp_corr_au1" field.
  String? _respCorrAu1;
  String get respCorrAu1 => _respCorrAu1 ?? '';
  bool hasRespCorrAu1() => _respCorrAu1 != null;

  void _initializeFields() {
    _pregAu1 = snapshotData['preg_au1'] as String?;
    _respCorrAu1 = snapshotData['resp_corr_au1'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Audio1');

  static Stream<Audio1Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Audio1Record.fromSnapshot(s));

  static Future<Audio1Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Audio1Record.fromSnapshot(s));

  static Audio1Record fromSnapshot(DocumentSnapshot snapshot) => Audio1Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Audio1Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Audio1Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Audio1Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Audio1Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAudio1RecordData({
  String? pregAu1,
  String? respCorrAu1,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'preg_au1': pregAu1,
      'resp_corr_au1': respCorrAu1,
    }.withoutNulls,
  );

  return firestoreData;
}

class Audio1RecordDocumentEquality implements Equality<Audio1Record> {
  const Audio1RecordDocumentEquality();

  @override
  bool equals(Audio1Record? e1, Audio1Record? e2) {
    return e1?.pregAu1 == e2?.pregAu1 && e1?.respCorrAu1 == e2?.respCorrAu1;
  }

  @override
  int hash(Audio1Record? e) =>
      const ListEquality().hash([e?.pregAu1, e?.respCorrAu1]);

  @override
  bool isValidKey(Object? o) => o is Audio1Record;
}
