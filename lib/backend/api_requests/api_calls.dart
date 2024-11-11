import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginAPICall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'loginAPI',
      apiUrl: 'https://52f3-203-192-253-200.ngrok-free.app/api/users/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? loginStatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.loginStatus''',
      ));
}

class ProtectedRouteCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'protectedRoute',
      apiUrl: 'https://52f3-203-192-253-200.ngrok-free.app/api/protected',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'Authorization': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GenerateContractPDFCall {
  static Future<ApiCallResponse> call({
    String? farmerName = '',
    String? buyerName = '',
    String? updatedAt = '',
    String? cropType = '',
    int? quantity,
    double? totalPrice,
    String? createdAt = '',
    double? pricePerUnit,
    String? paymentTerms = '',
    String? qualityStandards = '',
    String? deliveryDate = '',
    String? notes = '',
  }) async {
    final ffApiRequestBody = '''
{
  "farmerName": "$farmerName",
  "buyerName": "$buyerName",
  "updatedAt": "$updatedAt",
  "cropType": "$cropType",
  "quantity": "$quantity",
  "totalPrice": "$totalPrice",
  "createdAt": "$createdAt",
  "pricePerUnit": "$pricePerUnit",
  "paymentTerms": "$paymentTerms",
  "qualityStandards": "$qualityStandards",
  "deliveryDate": "$deliveryDate",
  "notes": "$notes"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'generateContractPDF',
      apiUrl:
          'https://us-central1-agritrust-c88c4.cloudfunctions.net/generateContractPDF',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
