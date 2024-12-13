import '/flutter_flow/flutter_flow_util.dart';
import 'otp_page_widget.dart' show OtpPageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class OtpPageModel extends FlutterFlowModel<OtpPageWidget> {
  ///  Local state fields for this page.

  int? otp;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  final textFieldMask = MaskTextInputFormatter(mask: '# # # # # #');
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
