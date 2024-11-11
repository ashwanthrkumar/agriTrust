import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_nav_bar_b/custom_nav_bar_b_widget.dart';
import 'b_profile_widget.dart' show BProfileWidget;
import 'package:flutter/material.dart';

class BProfileModel extends FlutterFlowModel<BProfileWidget> {
  ///  State fields for stateful widgets in this page.

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
