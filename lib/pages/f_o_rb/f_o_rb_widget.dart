import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'f_o_rb_model.dart';
export 'f_o_rb_model.dart';

class FORbWidget extends StatefulWidget {
  const FORbWidget({super.key});

  @override
  State<FORbWidget> createState() => _FORbWidgetState();
}

class _FORbWidgetState extends State<FORbWidget> {
  late FORbModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FORbModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/agriTrustLogo.png',
                  width: 279.0,
                  height: 106.0,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: Text(
                  'Your reliable partner in achieving sustainable farming success. Let’s work together to build a stable, profitable future in agriculture!',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Comfortaa',
                        color: Colors.black,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(40.0, 20.0, 40.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (valueOrDefault(currentUserDocument?.userType, '') ==
                        'Farmer') {
                      context.pushNamed('farmerD');
                    } else {
                      if (valueOrDefault(currentUserDocument?.userType, '') ==
                          'Buyer') {
                        context.pushNamed('buyerD');
                      } else {
                        context.pushNamed('startPage');
                      }
                    }

                    FFAppState().userId = currentUserUid;
                    safeSetState(() {});
                  },
                  text: 'Let\'s go',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFF1A6C43),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Lexend',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
