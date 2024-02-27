import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class VideoOpcRecord extends FirestoreRecord {
  VideoOpcRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id_pregunta" field.
  String? _idPregunta;
  String get idPregunta => _idPregunta ?? '';
  bool hasIdPregunta() => _idPregunta != null;

  // "opciones_video" field.
  String? _opcionesVideo;
  String get opcionesVideo => _opcionesVideo ?? '';
  bool hasOpcionesVideo() => _opcionesVideo != null;

  void _initializeFields() {
    _idPregunta = snapshotData['id_pregunta'] as String?;
    _opcionesVideo = snapshotData['opciones_video'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('video_opc');

  static Stream<VideoOpcRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideoOpcRecord.fromSnapshot(s));

  static Future<VideoOpcRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideoOpcRecord.fromSnapshot(s));

  static VideoOpcRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VideoOpcRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideoOpcRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideoOpcRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideoOpcRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideoOpcRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideoOpcRecordData({
  String? idPregunta,
  String? opcionesVideo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_pregunta': idPregunta,
      'opciones_video': opcionesVideo,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideoOpcRecordDocumentEquality implements Equality<VideoOpcRecord> {
  const VideoOpcRecordDocumentEquality();

  @override
  bool equals(VideoOpcRecord? e1, VideoOpcRecord? e2) {
    return e1?.idPregunta == e2?.idPregunta &&
        e1?.opcionesVideo == e2?.opcionesVideo;
  }

  @override
  int hash(VideoOpcRecord? e) =>
      const ListEquality().hash([e?.idPregunta, e?.opcionesVideo]);

  @override
  bool isValidKey(Object? o) => o is VideoOpcRecord;
}
