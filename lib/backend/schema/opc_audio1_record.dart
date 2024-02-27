import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class OpcAudio1Record extends FirestoreRecord {
  OpcAudio1Record._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "preg_aud1" field.
  String? _pregAud1;
  String get pregAud1 => _pregAud1 ?? '';
  bool hasPregAud1() => _pregAud1 != null;

  // "opc_audi1" field.
  String? _opcAudi1;
  String get opcAudi1 => _opcAudi1 ?? '';
  bool hasOpcAudi1() => _opcAudi1 != null;

  // "audio_title" field.
  String? _audioTitle;
  String get audioTitle => _audioTitle ?? '';
  bool hasAudioTitle() => _audioTitle != null;

  void _initializeFields() {
    _pregAud1 = snapshotData['preg_aud1'] as String?;
    _opcAudi1 = snapshotData['opc_audi1'] as String?;
    _audioTitle = snapshotData['audio_title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('opc_audio1');

  static Stream<OpcAudio1Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OpcAudio1Record.fromSnapshot(s));

  static Future<OpcAudio1Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OpcAudio1Record.fromSnapshot(s));

  static OpcAudio1Record fromSnapshot(DocumentSnapshot snapshot) =>
      OpcAudio1Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OpcAudio1Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OpcAudio1Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OpcAudio1Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OpcAudio1Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOpcAudio1RecordData({
  String? pregAud1,
  String? opcAudi1,
  String? audioTitle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'preg_aud1': pregAud1,
      'opc_audi1': opcAudi1,
      'audio_title': audioTitle,
    }.withoutNulls,
  );

  return firestoreData;
}

class OpcAudio1RecordDocumentEquality implements Equality<OpcAudio1Record> {
  const OpcAudio1RecordDocumentEquality();

  @override
  bool equals(OpcAudio1Record? e1, OpcAudio1Record? e2) {
    return e1?.pregAud1 == e2?.pregAud1 &&
        e1?.opcAudi1 == e2?.opcAudi1 &&
        e1?.audioTitle == e2?.audioTitle;
  }

  @override
  int hash(OpcAudio1Record? e) =>
      const ListEquality().hash([e?.pregAud1, e?.opcAudi1, e?.audioTitle]);

  @override
  bool isValidKey(Object? o) => o is OpcAudio1Record;
}
