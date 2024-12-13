import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AadharDataRecord extends FirestoreRecord {
  AadharDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "aadharNo" field.
  int? _aadharNo;
  int get aadharNo => _aadharNo ?? 0;
  bool hasAadharNo() => _aadharNo != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "phno" field.
  String? _phno;
  String get phno => _phno ?? '';
  bool hasPhno() => _phno != null;

  void _initializeFields() {
    _aadharNo = castToType<int>(snapshotData['aadharNo']);
    _name = snapshotData['name'] as String?;
    _address = snapshotData['address'] as String?;
    _phno = snapshotData['phno'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('aadharData');

  static Stream<AadharDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AadharDataRecord.fromSnapshot(s));

  static Future<AadharDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AadharDataRecord.fromSnapshot(s));

  static AadharDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AadharDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AadharDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AadharDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AadharDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AadharDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAadharDataRecordData({
  int? aadharNo,
  String? name,
  String? address,
  String? phno,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'aadharNo': aadharNo,
      'name': name,
      'address': address,
      'phno': phno,
    }.withoutNulls,
  );

  return firestoreData;
}

class AadharDataRecordDocumentEquality implements Equality<AadharDataRecord> {
  const AadharDataRecordDocumentEquality();

  @override
  bool equals(AadharDataRecord? e1, AadharDataRecord? e2) {
    return e1?.aadharNo == e2?.aadharNo &&
        e1?.name == e2?.name &&
        e1?.address == e2?.address &&
        e1?.phno == e2?.phno;
  }

  @override
  int hash(AadharDataRecord? e) =>
      const ListEquality().hash([e?.aadharNo, e?.name, e?.address, e?.phno]);

  @override
  bool isValidKey(Object? o) => o is AadharDataRecord;
}
