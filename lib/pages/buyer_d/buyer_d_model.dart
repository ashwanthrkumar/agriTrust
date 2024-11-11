import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_nav_bar_b/custom_nav_bar_b_widget.dart';
import 'buyer_d_widget.dart' show BuyerDWidget;
import 'package:flutter/material.dart';

class BuyerDModel extends FlutterFlowModel<BuyerDWidget> {
  ///  Local state fields for this page.

  int? activeContract;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in buyerD widget.
  int? activeContracts;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<CropsRecord> simpleSearchResults = [];
  // Model for customNavBarB component.
  late CustomNavBarBModel customNavBarBModel;

  @override
  void initState(BuildContext context) {
    customNavBarBModel = createModel(context, () => CustomNavBarBModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();

    customNavBarBModel.dispose();
  }
}
