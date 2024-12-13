import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/custom_nav_bar/custom_nav_bar_widget.dart';
import '/pages/logout/logout_widget.dart';
import '/pages/no_crop_found/no_crop_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
              isEqualTo: 'Active',
            ),
      );
      _model.ongoingContractsCount = _model.countContracts;
      _model.isCropListed = false;
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
      if (valueOrDefault<bool>(currentUserDocument?.verified, false) == false) {
        context.pushNamed('aadharPage');
      }
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

    return FutureBuilder<int>(
      future: queryContractsRecordCount(
        queryBuilder: (contractsRecord) => contractsRecord
            .where(
              'farmerId',
              isEqualTo: currentUserUid,
            )
            .where(
              'contractStatus',
              isEqualTo: 'pending',
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: const Color(0xFFFFE8BF),
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
        int farmerDCount = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFFFFE8BF),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'co3c7jpe' /* Hi!!  */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
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
                                    child: AuthUserStreamWidget(
                                      builder: (context) => InkWell(
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
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: const LogoutWidget(),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF1A6C43),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                currentUserPhoto == ''
                                                    ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtlMpIjR8W1bturIJnGWtLRayT4CfJPG34cw&s'
                                                    : currentUserPhoto,
                                              ).image,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                          child: Visibility(
                                            visible: currentUserPhoto == '',
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'iikynvbi' /* A */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 5.0, 0.0),
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
                                      FFLocalizations.of(context).getText(
                                        'fvoo0ls7' /* Ongoing Contracts */,
                                      ),
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
                                          _model.ongoingContractsCount
                                              ?.toString(),
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
                                        FFLocalizations.of(context).getText(
                                          'sw9r6mky' /* Completed Contracts */,
                                        ),
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
                                            _model.completedContractsCount
                                                ?.toString(),
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
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '2hbxdut8' /* CROP LISTING */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: StreamBuilder<List<CropsRecord>>(
                              stream: queryCropsRecord(
                                queryBuilder: (cropsRecord) =>
                                    cropsRecord.where(
                                  'farmerId',
                                  isEqualTo: FFAppState().userId,
                                ),
                              )..listen((snapshot) {
                                  List<CropsRecord> listViewCropsRecordList =
                                      snapshot;
                                  if (_model.listViewPreviousSnapshot != null &&
                                      !const ListEquality(
                                              CropsRecordDocumentEquality())
                                          .equals(
                                              listViewCropsRecordList,
                                              _model
                                                  .listViewPreviousSnapshot)) {
                                    () async {
                                      _model.isCropListed = true;
                                      safeSetState(() {});

                                      safeSetState(() {});
                                    }();
                                  }
                                  _model.listViewPreviousSnapshot = snapshot;
                                }),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitSquareCircle(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<CropsRecord> listViewCropsRecordList =
                                    snapshot.data!;
                                if (listViewCropsRecordList.isEmpty) {
                                  return const NoCropFoundWidget();
                                }

                                return ListView.builder(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    90.0,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewCropsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewCropsRecord =
                                        listViewCropsRecordList[listViewIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 10.0, 20.0, 0.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF9FFFE),
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  listViewCropsRecord.images,
                                                  width: 80.0,
                                                  height: 80.0,
                                                  fit: BoxFit.cover,
                                                ),
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
                                                    listViewCropsRecord
                                                        .cropType,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    listViewCropsRecord.quantity
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    listViewCropsRecord
                                                        .pricePerUnit
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    listViewCropsRecord.status,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                context.pushNamed(
                                                  'editCropDetails',
                                                  queryParameters: {
                                                    'editCropDetailsRef':
                                                        serializeParam(
                                                      listViewCropsRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'wachdqxj' /* edit */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: const Color(0x621A6C43),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
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
                  if (farmerDCount > 0)
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.78),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed('fContractRequest');
                        },
                        text: FFLocalizations.of(context).getText(
                          'pi49skwz' /* Contract Requests */,
                        ),
                        options: FFButtonOptions(
                          height: 30.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Lexend',
                                    color: Colors.white,
                                    fontSize: 8.0,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                  if (farmerDCount > 0)
                    Align(
                      alignment: const AlignmentDirectional(0.34, 0.74),
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          shape: BoxShape.circle,
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Visibility(
                          visible: farmerDCount > 0,
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              farmerDCount.toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
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
