import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_nav_bar/custom_nav_bar_widget.dart';
import '/pages/logout/logout_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'farmer_d_model.dart';
export 'farmer_d_model.dart';

class FarmerDWidget extends StatefulWidget {
  const FarmerDWidget({super.key});

  @override
  State<FarmerDWidget> createState() => _FarmerDWidgetState();
}

class _FarmerDWidgetState extends State<FarmerDWidget> {
  late FarmerDModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FarmerDModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().userId = currentUserUid;
      FFAppState().page = 'Home';
      safeSetState(() {});
      // ongoingC
      _model.countContracts = await queryContractsRecordCount(
        queryBuilder: (contractsRecord) => contractsRecord
            .where(
              'farmerId',
              isEqualTo: FFAppState().userId,
            )
            .where(
              'contractStatus',
              isEqualTo: 'pending',
            ),
      );
      _model.ongoingContractsCount = _model.countContracts;
      safeSetState(() {});
      _model.completedCount = await queryContractsRecordCount(
        queryBuilder: (contractsRecord) => contractsRecord
            .where(
          'farmerId',
          isEqualTo: FFAppState().userId,
        )
            .whereIn('contractStatus', ['Completed', 'completed']),
      );
      _model.completedContractsCount = _model.completedCount;
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
        backgroundColor: const Color(0xFFFFE8BF),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Hi!! ',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Birthstone',
                                    color: Colors.black,
                                    fontSize: 40.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            currentUserDisplayName,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend',
                                  color: Colors.black,
                                  fontSize: 23.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 20.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () =>
                                        FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: const LogoutWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1A6C43),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'A',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 180.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A6C43),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ongoing Contracts',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                _model.ongoingContractsCount?.toString(),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: 180.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A6C43),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Completed Contracts',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  _model.completedContractsCount?.toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.customNavBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const CustomNavBarWidget(),
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
