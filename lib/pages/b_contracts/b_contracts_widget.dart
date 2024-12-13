import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_nav_bar_b/custom_nav_bar_b_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'b_contracts_model.dart';
export 'b_contracts_model.dart';

class BContractsWidget extends StatefulWidget {
  const BContractsWidget({super.key});

  @override
  State<BContractsWidget> createState() => _BContractsWidgetState();
}

class _BContractsWidgetState extends State<BContractsWidget> {
  late BContractsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BContractsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().page = 'bContract';
      safeSetState(() {});
      _model.isActionCompleted = false;
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
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'mfffqdvi' /* My Contracts */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Lexend',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      StreamBuilder<List<ContractsRecord>>(
                        stream: queryContractsRecord(
                          queryBuilder: (contractsRecord) => contractsRecord
                              .where(
                                'buyerId',
                                isEqualTo: currentUserUid,
                              )
                              .where(
                                'farmerSign',
                                isEqualTo: Sign.yes.serialize(),
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
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<ContractsRecord> listViewContractsRecordList =
                              snapshot.data!;

                          return ListView.separated(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              10.0,
                              0,
                              0,
                            ),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewContractsRecordList.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewContractsRecord =
                                  listViewContractsRecordList[listViewIndex];
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 369.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '13tx5ccm' /* Farmer Name:  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '7exl06zd' /* Crop Type:  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '1g16yq88' /* Quantity:  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '8my43mtn' /* Negotiated Price:  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                listViewContractsRecord
                                                    .farmerName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                listViewContractsRecord
                                                    .cropType,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                listViewContractsRecord.quantity
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                listViewContractsRecord
                                                    .totalPrice
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                icon: Icon(
                                                  Icons.download_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 20.0,
                                                ),
                                                onPressed: () async {
                                                  _model.isActionCompleted =
                                                      true;
                                                  safeSetState(() {});
                                                  _model.apiResulth95 =
                                                      await GenerateContractPDFCall
                                                          .call(
                                                    farmerName:
                                                        listViewContractsRecord
                                                            .farmerName,
                                                    buyerName:
                                                        listViewContractsRecord
                                                            .buyerName,
                                                    updatedAt:
                                                        listViewContractsRecord
                                                            .updatedAt
                                                            ?.toString(),
                                                    cropType:
                                                        listViewContractsRecord
                                                            .cropType,
                                                    quantity:
                                                        listViewContractsRecord
                                                            .quantity,
                                                    totalPrice:
                                                        listViewContractsRecord
                                                            .totalPrice,
                                                    createdAt:
                                                        listViewContractsRecord
                                                            .createdAt
                                                            ?.toString(),
                                                    pricePerUnit:
                                                        listViewContractsRecord
                                                            .pricePerUnit
                                                            .toDouble(),
                                                    paymentTerms:
                                                        listViewContractsRecord
                                                            .paymentTerms,
                                                    qualityStandards:
                                                        listViewContractsRecord
                                                            .qualityStandards,
                                                    deliveryDate:
                                                        listViewContractsRecord
                                                            .deliveryDate
                                                            ?.toString(),
                                                    notes:
                                                        listViewContractsRecord
                                                            .notes,
                                                  );

                                                  _model.downloadLink =
                                                      getJsonField(
                                                    (_model.apiResulth95
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.downloadUrl''',
                                                  ).toString();
                                                  _model.isActionCompleted =
                                                      false;
                                                  safeSetState(() {});
                                                  await launchURL(
                                                      _model.downloadLink!);

                                                  safeSetState(() {});
                                                },
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 5.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.customNavBarBModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const CustomNavBarBWidget(),
                ),
              ),
              if (_model.isActionCompleted == true)
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0x66000000),
                  ),
                  child: Visibility(
                    visible: _model.isActionCompleted == true,
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Lottie.asset(
                        'assets/jsons/agriTrustLoading.json',
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.contain,
                        frameRate: FrameRate(30.0),
                        animate: true,
                      ),
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
