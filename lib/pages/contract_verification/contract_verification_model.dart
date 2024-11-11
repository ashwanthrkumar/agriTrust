import '/flutter_flow/flutter_flow_util.dart';
import 'contract_verification_widget.dart' show ContractVerificationWidget;
import 'package:flutter/material.dart';

class ContractVerificationModel
    extends FlutterFlowModel<ContractVerificationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}