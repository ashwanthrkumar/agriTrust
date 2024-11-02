import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_nav_bar/custom_nav_bar_widget.dart';
import 'add_crop_widget.dart' show AddCropWidget;
import 'package:flutter/material.dart';

class AddCropModel extends FlutterFlowModel<AddCropWidget> {
  ///  Local state fields for this page.

  String? page;

  ///  State fields for stateful widgets in this page.

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
