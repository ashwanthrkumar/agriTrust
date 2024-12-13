import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "messages" field.
  List<String>? _messages;
  List<String> get messages => _messages ?? const [];
  bool hasMessages() => _messages != null;

  // "timestamp" field.
  List<DateTime>? _timestamp;
  List<DateTime> get timestamp => _timestamp ?? const [];
  bool hasTimestamp() => _timestamp != null;

  // "buyerId" field.
  String? _buyerId;
  String get buyerId => _buyerId ?? '';
  bool hasBuyerId() => _buyerId != null;

  // "farmerId" field.
  String? _farmerId;
  String get farmerId => _farmerId ?? '';
  bool hasFarmerId() => _farmerId != null;

  void _initializeFields() {
    _messages = getDataList(snapshotData['messages']);
    _timestamp = getDataList(snapshotData['timestamp']);
    _buyerId = snapshotData['buyerId'] as String?;
    _farmerId = snapshotData['farmerId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? buyerId,
  String? farmerId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'buyerId': buyerId,
      'farmerId': farmerId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.messages, e2?.messages) &&
        listEquality.equals(e1?.timestamp, e2?.timestamp) &&
        e1?.buyerId == e2?.buyerId &&
        e1?.farmerId == e2?.farmerId;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality()
      .hash([e?.messages, e?.timestamp, e?.buyerId, e?.farmerId]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
