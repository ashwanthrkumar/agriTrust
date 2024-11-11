import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_nav_bar_b/custom_nav_bar_b_widget.dart';
import 'create_contract_widget.dart' show CreateContractWidget;
import 'package:flutter/material.dart';

class CreateContractModel extends FlutterFlowModel<CreateContractWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for negotiation widget.
  FocusNode? negotiationFocusNode;
  TextEditingController? negotiationTextController;
  String? Function(BuildContext, String?)? negotiationTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for paymentterms widget.
  FocusNode? paymenttermsFocusNode1;
  TextEditingController? paymenttermsTextController1;
  String? Function(BuildContext, String?)? paymenttermsTextController1Validator;
  // State field(s) for quality widget.
  FocusNode? qualityFocusNode;
  TextEditingController? qualityTextController;
  String? Function(BuildContext, String?)? qualityTextControllerValidator;
  // State field(s) for paymentterms widget.
  FocusNode? paymenttermsFocusNode2;
  TextEditingController? paymenttermsTextController2;
  String? Function(BuildContext, String?)? paymenttermsTextController2Validator;
  // Model for customNavBarB component.
  late CustomNavBarBModel customNavBarBModel;

  @override
  void initState(BuildContext context) {
    customNavBarBModel = createModel(context, () => CustomNavBarBModel());
  }

  @override
  void dispose() {
    negotiationFocusNode?.dispose();
    negotiationTextController?.dispose();

    paymenttermsFocusNode1?.dispose();
    paymenttermsTextController1?.dispose();

    qualityFocusNode?.dispose();
    qualityTextController?.dispose();

    paymenttermsFocusNode2?.dispose();
    paymenttermsTextController2?.dispose();

    customNavBarBModel.dispose();
  }
}
