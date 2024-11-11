import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_nav_bar/custom_nav_bar_widget.dart';
import 'f_profile_widget.dart' show FProfileWidget;
import 'package:flutter/material.dart';

class FProfileModel extends FlutterFlowModel<FProfileWidget> {
  ///  Local state fields for this page.

  String? page;

  int? phno;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for phno widget.
  FocusNode? phnoFocusNode1;
  TextEditingController? phnoTextController1;
  String? Function(BuildContext, String?)? phnoTextController1Validator;
  // State field(s) for phno widget.
  FocusNode? phnoFocusNode2;
  TextEditingController? phnoTextController2;
  String? Function(BuildContext, String?)? phnoTextController2Validator;
  // Model for customNavBar component.
  late CustomNavBarModel customNavBarModel;

  @override
  void initState(BuildContext context) {
    customNavBarModel = createModel(context, () => CustomNavBarModel());
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phnoFocusNode1?.dispose();
    phnoTextController1?.dispose();

    phnoFocusNode2?.dispose();
    phnoTextController2?.dispose();

    customNavBarModel.dispose();
  }
}
