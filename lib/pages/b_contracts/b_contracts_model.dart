import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_nav_bar_b/custom_nav_bar_b_widget.dart';
import 'b_contracts_widget.dart' show BContractsWidget;
import 'package:flutter/material.dart';

class BContractsModel extends FlutterFlowModel<BContractsWidget> {
  ///  Local state fields for this page.

  int? activeContracts;

  String? downloadLink;

  bool? isActionCompleted;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (generateContractPDF)] action in IconButton widget.
  ApiCallResponse? apiResulth95;
  // Model for customNavBarB component.
  late CustomNavBarBModel customNavBarBModel;

  @override
  void initState(BuildContext context) {
    customNavBarBModel = createModel(context, () => CustomNavBarBModel());
  }

  @override
  void dispose() {
    customNavBarBModel.dispose();
  }
}
