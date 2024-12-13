import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_nav_bar_b/custom_nav_bar_b_widget.dart';
import 'bprofile_widget.dart' show BprofileWidget;
import 'package:flutter/material.dart';

class BprofileModel extends FlutterFlowModel<BprofileWidget> {
  ///  Local state fields for this page.

  bool? isActionStarted;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // Model for customNavBarB component.
  late CustomNavBarBModel customNavBarBModel;

  @override
  void initState(BuildContext context) {
    customNavBarBModel = createModel(context, () => CustomNavBarBModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    customNavBarBModel.dispose();
  }
}
