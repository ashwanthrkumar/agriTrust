import 'dart:async';

import 'serialization_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitSquareCircle(
              color: FlutterFlowTheme.of(context).primary,
              size: 50.0,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'startPage': ParameterData.none(),
  'fORb': ParameterData.none(),
  'farmerD': ParameterData.none(),
  'buyerD': ParameterData.none(),
  'fContracts': ParameterData.none(),
  'addCrop': ParameterData.none(),
  'fPayment': ParameterData.none(),
  'fProfile': ParameterData.none(),
  'bContracts': ParameterData.none(),
  'createContract': (data) async => ParameterData(
        allParams: {
          'createContractCropRef':
              getParameter<DocumentReference>(data, 'createContractCropRef'),
        },
      ),
  'bPayment': ParameterData.none(),
  'cropDetails': (data) async => ParameterData(
        allParams: {
          'cropDetailRef':
              getParameter<DocumentReference>(data, 'cropDetailRef'),
        },
      ),
  'editCropDetails': (data) async => ParameterData(
        allParams: {
          'editCropDetailsRef':
              getParameter<DocumentReference>(data, 'editCropDetailsRef'),
        },
      ),
  'fContractRequest': ParameterData.none(),
  'contractVerification': (data) async => ParameterData(
        allParams: {
          'farmerId': getParameter<String>(data, 'farmerId'),
          'cropType': getParameter<String>(data, 'cropType'),
        },
      ),
  'updateInfo': ParameterData.none(),
  'bprofile': ParameterData.none(),
  'fchats': (data) async => ParameterData(
        allParams: {
          'buyerId': getParameter<String>(data, 'buyerId'),
        },
      ),
  'bNotifications': ParameterData.none(),
  'fpro': ParameterData.none(),
  'aadharPage': ParameterData.none(),
  'bpro': ParameterData.none(),
  'otpPage': ParameterData.none(),
  'bUpi': (data) async => ParameterData(
        allParams: {
          'upi': getParameter<DocumentReference>(data, 'upi'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
