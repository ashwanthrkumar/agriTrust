import '/flutter_flow/flutter_flow_util.dart';
import 'aadhar_page_widget.dart' show AadharPageWidget;
import 'package:flutter/material.dart';

class AadharPageModel extends FlutterFlowModel<AadharPageWidget> {
  ///  Local state fields for this page.

  bool? verified;

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
