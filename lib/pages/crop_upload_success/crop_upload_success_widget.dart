import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'crop_upload_success_model.dart';
export 'crop_upload_success_model.dart';

class CropUploadSuccessWidget extends StatefulWidget {
  const CropUploadSuccessWidget({super.key});

  @override
  State<CropUploadSuccessWidget> createState() =>
      _CropUploadSuccessWidgetState();
}

class _CropUploadSuccessWidgetState extends State<CropUploadSuccessWidget> {
  late CropUploadSuccessModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CropUploadSuccessModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
            spreadRadius: 0.0,
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent2,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Icon(
                    Icons.check_circle,
                    color: FlutterFlowTheme.of(context).success,
                    size: 30.0,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Crop Uploaded',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Lexend',
                            color: FlutterFlowTheme.of(context).success,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      'Your crop data has been successfully uploaded',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ].divide(const SizedBox(width: 12.0)),
            ),
          ].divide(const SizedBox(width: 12.0)),
        ),
      ),
    );
  }
}
