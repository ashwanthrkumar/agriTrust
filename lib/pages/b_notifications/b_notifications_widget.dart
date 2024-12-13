import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_nav_bar_b/custom_nav_bar_b_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'b_notifications_model.dart';
export 'b_notifications_model.dart';

class BNotificationsWidget extends StatefulWidget {
  const BNotificationsWidget({super.key});

  @override
  State<BNotificationsWidget> createState() => _BNotificationsWidgetState();
}

class _BNotificationsWidgetState extends State<BNotificationsWidget> {
  late BNotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BNotificationsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.page = 'bNotifications';
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              const Column(
                mainAxisSize: MainAxisSize.max,
                children: [],
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.customNavBarBModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const CustomNavBarBWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
