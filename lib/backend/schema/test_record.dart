import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class TestRecord extends FirestoreRecord {
  TestRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "preguntaTest" field.
  String? _preguntaTest;
  String get preguntaTest => _preguntaTest ?? '';
  bool hasPreguntaTest() => _preguntaTest != null;

  // "respuestaAudi" field.
  String? _respuestaAudi;
  String get respuestaAudi => _respuestaAudi ?? '';
  bool hasRespuestaAudi() => _respuestaAudi != null;

  // "respuestaVisu" field.
  String? _respuestaVisu;
  String get respuestaVisu => _respuestaVisu ?? '';
  bool hasRespuestaVisu() => _respuestaVisu != null;

  // "respuestaLecto" field.
  String? _respuestaLecto;
  String get respuestaLecto => _respuestaLecto ?? '';
  bool hasRespuestaLecto() => _respuestaLecto != null;

  // "respuestaKines" field.
  String? _respuestaKines;
  String get respuestaKines => _respuestaKines ?? '';
  bool hasRespuestaKines() => _respuestaKines != null;

  // "testRef" field.
  DocumentReference? _testRef;
  DocumentReference? get testRef => _testRef;
  bool hasTestRef() => _testRef != null;

  void _initializeFields() {
    _preguntaTest = snapshotData['preguntaTest'] as String?;
    _respuestaAudi = snapshotData['respuestaAudi'] as String?;
    _respuestaVisu = snapshotData['respuestaVisu'] as String?;
    _respuestaLecto = snapshotData['respuestaLecto'] as String?;
    _respuestaKines = snapshotData['respuestaKines'] as String?;
    _testRef = snapshotData['testRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Test');

  static Stream<TestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestRecord.fromSnapshot(s));

  static Future<TestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestRecord.fromSnapshot(s));

  static TestRecord fromSnapshot(DocumentSnapshot snapshot) => TestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestRecordData({
  String? preguntaTest,
  String? respuestaAudi,
  String? respuestaVisu,
  String? respuestaLecto,
  String? respuestaKines,
  DocumentReference? testRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'preguntaTest': preguntaTest,
      'respuestaAudi': respuestaAudi,
      'respuestaVisu': respuestaVisu,
      'respuestaLecto': respuestaLecto,
      'respuestaKines': respuestaKines,
      'testRef': testRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestRecordDocumentEquality implements Equality<TestRecord> {
  const TestRecordDocumentEquality();

  @override
  bool equals(TestRecord? e1, TestRecord? e2) {
    return e1?.preguntaTest == e2?.preguntaTest &&
        e1?.respuestaAudi == e2?.respuestaAudi &&
        e1?.respuestaVisu == e2?.respuestaVisu &&
        e1?.respuestaLecto == e2?.respuestaLecto &&
        e1?.respuestaKines == e2?.respuestaKines &&
        e1?.testRef == e2?.testRef;
  }

  @override
  int hash(TestRecord? e) => const ListEquality().hash([
        e?.preguntaTest,
        e?.respuestaAudi,
        e?.respuestaVisu,
        e?.respuestaLecto,
        e?.respuestaKines,
        e?.testRef
      ]);

  @override
  bool isValidKey(Object? o) => o is TestRecord;
}
