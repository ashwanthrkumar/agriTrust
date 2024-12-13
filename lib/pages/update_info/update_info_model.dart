import '/flutter_flow/flutter_flow_util.dart';
import 'update_info_widget.dart' show UpdateInfoWidget;
import 'package:flutter/material.dart';

class UpdateInfoModel extends FlutterFlowModel<UpdateInfoWidget> {
  ///  Local state fields for this page.

  bool? isActionStarted;

  bool? phnoAdded;

  bool? addressAdded;

  bool? imgAdded;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for phno widget.
  FocusNode? phnoFocusNode;
  TextEditingController? phnoTextController;
  String? Function(BuildContext, String?)? phnoTextControllerValidator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    phnoFocusNode?.dispose();
    phnoTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();
  }
}
