import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_nav_bar_b/custom_nav_bar_b_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'b_payment_model.dart';
export 'b_payment_model.dart';

class BPaymentWidget extends StatefulWidget {
  const BPaymentWidget({super.key});

  @override
  State<BPaymentWidget> createState() => _BPaymentWidgetState();
}

class _BPaymentWidgetState extends State<BPaymentWidget> {
  late BPaymentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BPaymentModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().page = 'bPayment';
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
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
