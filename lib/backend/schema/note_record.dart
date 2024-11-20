import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NoteRecord extends FirestoreRecord {
  NoteRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "titolo" field.
  String? _titolo;
  String get titolo => _titolo ?? '';
  bool hasTitolo() => _titolo != null;

  // "descrizione" field.
  String? _descrizione;
  String get descrizione => _descrizione ?? '';
  bool hasDescrizione() => _descrizione != null;

  // "completata" field.
  bool? _completata;
  bool get completata => _completata ?? false;
  bool hasCompletata() => _completata != null;

  // "dataCreazione" field.
  DateTime? _dataCreazione;
  DateTime? get dataCreazione => _dataCreazione;
  bool hasDataCreazione() => _dataCreazione != null;

  void _initializeFields() {
    _titolo = snapshotData['titolo'] as String?;
    _descrizione = snapshotData['descrizione'] as String?;
    _completata = snapshotData['completata'] as bool?;
    _dataCreazione = snapshotData['dataCreazione'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('note');

  static Stream<NoteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NoteRecord.fromSnapshot(s));

  static Future<NoteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NoteRecord.fromSnapshot(s));

  static NoteRecord fromSnapshot(DocumentSnapshot snapshot) => NoteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NoteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NoteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NoteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NoteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNoteRecordData({
  String? titolo,
  String? descrizione,
  bool? completata,
  DateTime? dataCreazione,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titolo': titolo,
      'descrizione': descrizione,
      'completata': completata,
      'dataCreazione': dataCreazione,
    }.withoutNulls,
  );

  return firestoreData;
}

class NoteRecordDocumentEquality implements Equality<NoteRecord> {
  const NoteRecordDocumentEquality();

  @override
  bool equals(NoteRecord? e1, NoteRecord? e2) {
    return e1?.titolo == e2?.titolo &&
        e1?.descrizione == e2?.descrizione &&
        e1?.completata == e2?.completata &&
        e1?.dataCreazione == e2?.dataCreazione;
  }

  @override
  int hash(NoteRecord? e) => const ListEquality()
      .hash([e?.titolo, e?.descrizione, e?.completata, e?.dataCreazione]);

  @override
  bool isValidKey(Object? o) => o is NoteRecord;
}
