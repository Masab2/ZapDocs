import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:zapdocs/data/Error/app_exception.dart';
import 'package:zapdocs/data/Network/base_api_service.dart';

class NetworkApiService implements BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    if (kDebugMode) {
      print('GET Request: $url');
    }
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request timed out');
    }

    if (kDebugMode) {
      print('Response: $responseJson');
    }
    return responseJson;
  }

  @override
Future getPostApiResponse(String url, dynamic data, bool hasFile) async {
  if (kDebugMode) {
    print('POST Request: $url');
    print('Payload Type: ${data.runtimeType}');
  }

  dynamic responseJson;
  try {
    if (hasFile) {
      var request = http.MultipartRequest('POST', Uri.parse(url))
        ..headers.addAll({
          "Accept": "application/json",
        });

      String? fileKey;
      Uint8List? fileBytes;
      String? fileName;

      data.forEach((key, value) {
        if (value is String && value.contains('base64,')) {
          fileKey = key;
          final parts = value.split(',');
          fileBytes = base64Decode(parts.last);
          fileName = data['filename'] ?? 'uploaded_file';
        } else {
          request.fields[key] = value.toString();
        }
      });

      if (fileKey != null && fileBytes != null) {
        final mimeType = lookupMimeType(fileName ?? '', headerBytes: fileBytes) ?? 'application/octet-stream';
        request.files.add(http.MultipartFile.fromBytes(
          fileKey!,
          fileBytes!,
          filename: fileName ?? '$fileKey.file',
          contentType: MediaType.parse(mimeType),
        ));
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      responseJson = returnResponse(response);
    } else {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      );
      responseJson = returnResponse(response);
    }
  } on SocketException {
    throw NoInternetException('No Internet Connection');
  } on TimeoutException {
    throw FetchDataException('Network Request timed out');
  }

  return responseJson;
}

@override
Future getPutApiResponse(String url, dynamic data, bool hasFile) async {
  if (kDebugMode) {
    print('PUT Request: $url');
    print('Payload Type: ${data.runtimeType}');
  }

  dynamic responseJson;
  try {
    if (hasFile) {
      var request = http.MultipartRequest('PUT', Uri.parse(url))
        ..headers.addAll({
          "Accept": "application/json",
        });

      data.forEach((key, value) {
        if (key != 'file') {
          request.fields[key] = value.toString();
        }
      });

      if (data['file'] != null && data['file'].contains('base64,')) {
        final parts = data['file'].split(',');
        Uint8List fileBytes = base64Decode(parts.last);
        final fileName = data['filename'] ?? 'updated_file';
        final mimeType = lookupMimeType(fileName, headerBytes: fileBytes) ?? 'application/octet-stream';

        request.files.add(http.MultipartFile.fromBytes(
          'file',
          fileBytes,
          filename: fileName,
          contentType: MediaType.parse(mimeType),
        ));
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      responseJson = returnResponse(response);
    } else {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      );
      responseJson = returnResponse(response);
    }
  } on SocketException {
    throw NoInternetException('No Internet Connection');
  } on TimeoutException {
    throw FetchDataException('Network Request timed out');
  }

  return responseJson;
}


  @override
  Future getdeleteApiResponse(String url) async {
    if (kDebugMode) {
      print('DELETE Request: $url');
    }

    dynamic responseJson;
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
        },
      ).timeout(const Duration(seconds: 20));

      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request timed out');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print('Status Code: ${response.statusCode}');
    }

    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
        throw ServerErrorException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occurred while communicating with the server');
    }
  }
}
