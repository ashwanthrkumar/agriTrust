import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_nav_bar/custom_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'f_payment_model.dart';
export 'f_payment_model.dart';

class FPaymentWidget extends StatefulWidget {
  const FPaymentWidget({super.key});

  @override
  State<FPaymentWidget> createState() => _FPaymentWidgetState();
}

class _FPaymentWidgetState extends State<FPaymentWidget> {
  late FPaymentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FPaymentModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().page = 'Payment';
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

    return StreamBuilder<List<CropsRecord>>(
      stream: queryCropsRecord(
        queryBuilder: (cropsRecord) => cropsRecord.where(
          'farmerId',
          isEqualTo: currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).tertiary,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitSquareCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<CropsRecord> fPaymentCropsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).tertiary,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'wmdwb4cw' /* Payments */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: StreamBuilder<List<ContractsRecord>>(
                            stream: queryContractsRecord(
                              queryBuilder: (contractsRecord) => contractsRecord
                                  .where(
                                    'farmerId',
                                    isEqualTo: currentUserUid,
                                  )
                                  .where(
                                    'contractStatus',
                                    isEqualTo: 'Active',
                                  ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitSquareCircle(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<ContractsRecord>
                                  listViewContractsRecordList = snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewContractsRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewContractsRecord =
                                      listViewContractsRecordList[
                                          listViewIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                listViewContractsRecord
                                                    .cropImage,
                                                width: 70.0,
                                                height: 70.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'q1uxrxeq' /* Contract with: */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    listViewContractsRecord
                                                        .buyerName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'b5r0dhf4' /* Crop Type: */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    listViewContractsRecord
                                                        .cropType,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    if (!listViewContractsRecord
                                                        .paymentDone)
                                                      Container(
                                                        width: 90.0,
                                                        height: 20.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const Icon(
                                                              Icons.thumb_down,
                                                              color: Color(
                                                                  0xFFFD2936),
                                                              size: 20.0,
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'erkd9rda' /* Not done */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend',
                                                                    color: const Color(
                                                                        0xFFFD2936),
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 5.0)),
                                                        ),
                                                      ),
                                                    if (listViewContractsRecord
                                                        .paymentDone)
                                                      Container(
                                                        width: 90.0,
                                                        height: 20.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.thumb_up,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 20.0,
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'sglaaeeu' /* Done */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 5.0)),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                icon: Icon(
                                                  Icons.call,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 18.0,
                                                ),
                                                onPressed: () async {
                                                  await launchUrl(Uri(
                                                    scheme: 'tel',
                                                    path:
                                                        listViewContractsRecord
                                                            .buyerNumber,
                                                  ));
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.customNavBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const CustomNavBarWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
