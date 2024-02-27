import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class TestRefRecord extends FirestoreRecord {
  TestRefRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  void _initializeFields() {
    _nombre = snapshotData['Nombre'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('testRef');

  static Stream<TestRefRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestRefRecord.fromSnapshot(s));

  static Future<TestRefRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestRefRecord.fromSnapshot(s));

  static TestRefRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TestRefRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestRefRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestRefRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestRefRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestRefRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestRefRecordData({
  String? nombre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nombre': nombre,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestRefRecordDocumentEquality implements Equality<TestRefRecord> {
  const TestRefRecordDocumentEquality();

  @override
  bool equals(TestRefRecord? e1, TestRefRecord? e2) {
    return e1?.nombre == e2?.nombre;
  }

  @override
  int hash(TestRefRecord? e) => const ListEquality().hash([e?.nombre]);

  @override
  bool isValidKey(Object? o) => o is TestRefRecord;
}
