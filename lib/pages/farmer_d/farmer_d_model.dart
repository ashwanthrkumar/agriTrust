import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_nav_bar/custom_nav_bar_widget.dart';
import 'farmer_d_widget.dart' show FarmerDWidget;
import 'package:flutter/material.dart';

class FarmerDModel extends FlutterFlowModel<FarmerDWidget> {
  ///  Local state fields for this page.

  int? ongoingContractsCount;

  int? completedContractsCount;

  String? page;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in farmerD widget.
  int? countContracts;
  // Stores action output result for [Firestore Query - Query a collection] action in farmerD widget.
  int? completedCount;
  // Model for customNavBar component.
  late CustomNavBarModel customNavBarModel;

  @override
  void initState(BuildContext context) {
    customNavBarModel = createModel(context, () => CustomNavBarModel());
  }

  @override
  void dispose() {
    customNavBarModel.dispose();
  }
}
