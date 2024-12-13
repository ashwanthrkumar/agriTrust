import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_nav_bar_b/custom_nav_bar_b_widget.dart';
import 'b_notifications_widget.dart' show BNotificationsWidget;
import 'package:flutter/material.dart';

class BNotificationsModel extends FlutterFlowModel<BNotificationsWidget> {
  ///  Local state fields for this page.

  String? page;

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
