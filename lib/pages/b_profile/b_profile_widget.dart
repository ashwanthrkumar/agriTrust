import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_nav_bar_b/custom_nav_bar_b_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'b_profile_model.dart';
export 'b_profile_model.dart';

class BProfileWidget extends StatefulWidget {
  const BProfileWidget({super.key});

  @override
  State<BProfileWidget> createState() => _BProfileWidgetState();
}

class _BProfileWidgetState extends State<BProfileWidget> {
  late BProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().page = 'bProfile';
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
