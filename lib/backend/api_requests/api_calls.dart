import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start OpenAI ChatGPT Group Code

class OpenAIChatGPTGroup {
  static String baseUrl = 'https://api.openai.com/v1';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
    'OpenAI-Beta': 'assistants=v1',
  };
  static ThreadsCall threadsCall = ThreadsCall();
  static MessageCall messageCall = MessageCall();
  static RunCall runCall = RunCall();
  static RetrieverunCall retrieverunCall = RetrieverunCall();
  static MessagesCall messagesCall = MessagesCall();
}

class ThreadsCall {
  Future<ApiCallResponse> call({
    String? token = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'threads',
      apiUrl: '${OpenAIChatGPTGroup.baseUrl}/threads',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v1',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? threadId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class MessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? content = '',
    String? token = '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',
  }) async {
    final ffApiRequestBody = '''
{
  "role": "user",
  "content": "$content"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'message',
      apiUrl: '${OpenAIChatGPTGroup.baseUrl}/threads/$threadId/messages',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v1',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? assistantId = '',
    String? assistantId2 = '',
    String? token = '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',
  }) async {
    final ffApiRequestBody = '''
{
  "assistant_id": "$assistantId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'run',
      apiUrl: '${OpenAIChatGPTGroup.baseUrl}/threads/$threadId/runs',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v1',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? runId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class RetrieverunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? token = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'retrieverun',
      apiUrl: '${OpenAIChatGPTGroup.baseUrl}/threads/$threadId/runs/$runId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v1',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class MessagesCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? token = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'messages',
      apiUrl: '${OpenAIChatGPTGroup.baseUrl}/threads/$threadId/messages',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v1',
      },
      params: {
        'limit': 1,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data[0].content[0]''',
      );
}

/// End OpenAI ChatGPT Group Code

/// Start OpenAI Group Code

class OpenAIGroup {
  static String baseUrl = 'https://api.openai.com/v1';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
    'OpenAI-Beta': 'assistants=v1',
  };
  static ThreadsdosCall threadsdosCall = ThreadsdosCall();
}

class ThreadsdosCall {
  Future<ApiCallResponse> call({
    String? token = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'threadsdos',
      apiUrl: '${OpenAIGroup.baseUrl}/threadsdos',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
        'OpenAI-Beta': 'assistants=v1',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End OpenAI Group Code

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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
