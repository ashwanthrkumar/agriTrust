import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CropsRecord extends FirestoreRecord {
  CropsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "farmerId" field.
  String? _farmerId;
  String get farmerId => _farmerId ?? '';
  bool hasFarmerId() => _farmerId != null;

  // "cropType" field.
  String? _cropType;
  String get cropType => _cropType ?? '';
  bool hasCropType() => _cropType != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "pricePerUnit" field.
  int? _pricePerUnit;
  int get pricePerUnit => _pricePerUnit ?? 0;
  bool hasPricePerUnit() => _pricePerUnit != null;

  // "availabilityDate" field.
  DateTime? _availabilityDate;
  DateTime? get availabilityDate => _availabilityDate;
  bool hasAvailabilityDate() => _availabilityDate != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "qualityGrade" field.
  String? _qualityGrade;
  String get qualityGrade => _qualityGrade ?? '';
  bool hasQualityGrade() => _qualityGrade != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "images" field.
  String? _images;
  String get images => _images ?? '';
  bool hasImages() => _images != null;

  // "farmerName" field.
  String? _farmerName;
  String get farmerName => _farmerName ?? '';
  bool hasFarmerName() => _farmerName != null;

  void _initializeFields() {
    _farmerId = snapshotData['farmerId'] as String?;
    _cropType = snapshotData['cropType'] as String?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _pricePerUnit = castToType<int>(snapshotData['pricePerUnit']);
    _availabilityDate = snapshotData['availabilityDate'] as DateTime?;
    _location = snapshotData['location'] as LatLng?;
    _status = snapshotData['status'] as String?;
    _qualityGrade = snapshotData['qualityGrade'] as String?;
    _description = snapshotData['description'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _images = snapshotData['images'] as String?;
    _farmerName = snapshotData['farmerName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('crops');

  static Stream<CropsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CropsRecord.fromSnapshot(s));

  static Future<CropsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CropsRecord.fromSnapshot(s));

  static CropsRecord fromSnapshot(DocumentSnapshot snapshot) => CropsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CropsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CropsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CropsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CropsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCropsRecordData({
  String? farmerId,
  String? cropType,
  int? quantity,
  int? pricePerUnit,
  DateTime? availabilityDate,
  LatLng? location,
  String? status,
  String? qualityGrade,
  String? description,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? images,
  String? farmerName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'farmerId': farmerId,
      'cropType': cropType,
      'quantity': quantity,
      'pricePerUnit': pricePerUnit,
      'availabilityDate': availabilityDate,
      'location': location,
      'status': status,
      'qualityGrade': qualityGrade,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'images': images,
      'farmerName': farmerName,
    }.withoutNulls,
  );

  return firestoreData;
}

class CropsRecordDocumentEquality implements Equality<CropsRecord> {
  const CropsRecordDocumentEquality();

  @override
  bool equals(CropsRecord? e1, CropsRecord? e2) {
    return e1?.farmerId == e2?.farmerId &&
        e1?.cropType == e2?.cropType &&
        e1?.quantity == e2?.quantity &&
        e1?.pricePerUnit == e2?.pricePerUnit &&
        e1?.availabilityDate == e2?.availabilityDate &&
        e1?.location == e2?.location &&
        e1?.status == e2?.status &&
        e1?.qualityGrade == e2?.qualityGrade &&
        e1?.description == e2?.description &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.images == e2?.images &&
        e1?.farmerName == e2?.farmerName;
  }

  @override
  int hash(CropsRecord? e) => const ListEquality().hash([
        e?.farmerId,
        e?.cropType,
        e?.quantity,
        e?.pricePerUnit,
        e?.availabilityDate,
        e?.location,
        e?.status,
        e?.qualityGrade,
        e?.description,
        e?.createdAt,
        e?.updatedAt,
        e?.images,
        e?.farmerName
      ]);

  @override
  bool isValidKey(Object? o) => o is CropsRecord;
}
