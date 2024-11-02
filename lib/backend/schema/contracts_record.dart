import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContractsRecord extends FirestoreRecord {
  ContractsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "farmerId" field.
  String? _farmerId;
  String get farmerId => _farmerId ?? '';
  bool hasFarmerId() => _farmerId != null;

  // "buyerId" field.
  String? _buyerId;
  String get buyerId => _buyerId ?? '';
  bool hasBuyerId() => _buyerId != null;

  // "cropType" field.
  String? _cropType;
  String get cropType => _cropType ?? '';
  bool hasCropType() => _cropType != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "pricePerUnit" field.
  double? _pricePerUnit;
  double get pricePerUnit => _pricePerUnit ?? 0.0;
  bool hasPricePerUnit() => _pricePerUnit != null;

  // "totalPrice" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  bool hasTotalPrice() => _totalPrice != null;

  // "deliveryDate" field.
  DateTime? _deliveryDate;
  DateTime? get deliveryDate => _deliveryDate;
  bool hasDeliveryDate() => _deliveryDate != null;

  // "paymentTerms" field.
  String? _paymentTerms;
  String get paymentTerms => _paymentTerms ?? '';
  bool hasPaymentTerms() => _paymentTerms != null;

  // "qualityStandards" field.
  String? _qualityStandards;
  String get qualityStandards => _qualityStandards ?? '';
  bool hasQualityStandards() => _qualityStandards != null;

  // "contractStatus" field.
  String? _contractStatus;
  String get contractStatus => _contractStatus ?? '';
  bool hasContractStatus() => _contractStatus != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "disputeResolution" field.
  String? _disputeResolution;
  String get disputeResolution => _disputeResolution ?? '';
  bool hasDisputeResolution() => _disputeResolution != null;

  // "forceMajeureClause" field.
  String? _forceMajeureClause;
  String get forceMajeureClause => _forceMajeureClause ?? '';
  bool hasForceMajeureClause() => _forceMajeureClause != null;

  // "confidentialityClause" field.
  String? _confidentialityClause;
  String get confidentialityClause => _confidentialityClause ?? '';
  bool hasConfidentialityClause() => _confidentialityClause != null;

  // "signedByFarmer" field.
  bool? _signedByFarmer;
  bool get signedByFarmer => _signedByFarmer ?? false;
  bool hasSignedByFarmer() => _signedByFarmer != null;

  // "signedByBuyer" field.
  bool? _signedByBuyer;
  bool get signedByBuyer => _signedByBuyer ?? false;
  bool hasSignedByBuyer() => _signedByBuyer != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  void _initializeFields() {
    _farmerId = snapshotData['farmerId'] as String?;
    _buyerId = snapshotData['buyerId'] as String?;
    _cropType = snapshotData['cropType'] as String?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _pricePerUnit = castToType<double>(snapshotData['pricePerUnit']);
    _totalPrice = castToType<double>(snapshotData['totalPrice']);
    _deliveryDate = snapshotData['deliveryDate'] as DateTime?;
    _paymentTerms = snapshotData['paymentTerms'] as String?;
    _qualityStandards = snapshotData['qualityStandards'] as String?;
    _contractStatus = snapshotData['contractStatus'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _disputeResolution = snapshotData['disputeResolution'] as String?;
    _forceMajeureClause = snapshotData['forceMajeureClause'] as String?;
    _confidentialityClause = snapshotData['confidentialityClause'] as String?;
    _signedByFarmer = snapshotData['signedByFarmer'] as bool?;
    _signedByBuyer = snapshotData['signedByBuyer'] as bool?;
    _notes = snapshotData['notes'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contracts');

  static Stream<ContractsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContractsRecord.fromSnapshot(s));

  static Future<ContractsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContractsRecord.fromSnapshot(s));

  static ContractsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContractsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContractsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContractsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContractsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContractsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContractsRecordData({
  String? farmerId,
  String? buyerId,
  String? cropType,
  int? quantity,
  double? pricePerUnit,
  double? totalPrice,
  DateTime? deliveryDate,
  String? paymentTerms,
  String? qualityStandards,
  String? contractStatus,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? disputeResolution,
  String? forceMajeureClause,
  String? confidentialityClause,
  bool? signedByFarmer,
  bool? signedByBuyer,
  String? notes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'farmerId': farmerId,
      'buyerId': buyerId,
      'cropType': cropType,
      'quantity': quantity,
      'pricePerUnit': pricePerUnit,
      'totalPrice': totalPrice,
      'deliveryDate': deliveryDate,
      'paymentTerms': paymentTerms,
      'qualityStandards': qualityStandards,
      'contractStatus': contractStatus,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'disputeResolution': disputeResolution,
      'forceMajeureClause': forceMajeureClause,
      'confidentialityClause': confidentialityClause,
      'signedByFarmer': signedByFarmer,
      'signedByBuyer': signedByBuyer,
      'notes': notes,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContractsRecordDocumentEquality implements Equality<ContractsRecord> {
  const ContractsRecordDocumentEquality();

  @override
  bool equals(ContractsRecord? e1, ContractsRecord? e2) {
    return e1?.farmerId == e2?.farmerId &&
        e1?.buyerId == e2?.buyerId &&
        e1?.cropType == e2?.cropType &&
        e1?.quantity == e2?.quantity &&
        e1?.pricePerUnit == e2?.pricePerUnit &&
        e1?.totalPrice == e2?.totalPrice &&
        e1?.deliveryDate == e2?.deliveryDate &&
        e1?.paymentTerms == e2?.paymentTerms &&
        e1?.qualityStandards == e2?.qualityStandards &&
        e1?.contractStatus == e2?.contractStatus &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.disputeResolution == e2?.disputeResolution &&
        e1?.forceMajeureClause == e2?.forceMajeureClause &&
        e1?.confidentialityClause == e2?.confidentialityClause &&
        e1?.signedByFarmer == e2?.signedByFarmer &&
        e1?.signedByBuyer == e2?.signedByBuyer &&
        e1?.notes == e2?.notes;
  }

  @override
  int hash(ContractsRecord? e) => const ListEquality().hash([
        e?.farmerId,
        e?.buyerId,
        e?.cropType,
        e?.quantity,
        e?.pricePerUnit,
        e?.totalPrice,
        e?.deliveryDate,
        e?.paymentTerms,
        e?.qualityStandards,
        e?.contractStatus,
        e?.createdAt,
        e?.updatedAt,
        e?.disputeResolution,
        e?.forceMajeureClause,
        e?.confidentialityClause,
        e?.signedByFarmer,
        e?.signedByBuyer,
        e?.notes
      ]);

  @override
  bool isValidKey(Object? o) => o is ContractsRecord;
}
