import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'no_contract_found_model.dart';
export 'no_contract_found_model.dart';

class NoContractFoundWidget extends StatefulWidget {
  const NoContractFoundWidget({super.key});

  @override
  State<NoContractFoundWidget> createState() => _NoContractFoundWidgetState();
}

class _NoContractFoundWidgetState extends State<NoContractFoundWidget> {
  late NoContractFoundModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoContractFoundModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.error_outline,
                color: FlutterFlowTheme.of(context).error,
                size: 48.0,
              ),
              Text(
                'No Contract Found',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Lexend',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                'We couldn\'t find any pending contracts associated with your account. Please check back later or contact support if you believe this is an error.',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
              ),
            ].divide(const SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
