/*
* Developer: Abubakar Abdullahi
* Date: 25/09/2024
*/

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quran_player/src/cloud_api/model/resource_list_rm.dart';

class UrlBuilder {
   UrlBuilder({
    String? baseUrl,
  }) : _baseUrl = baseUrl ?? 'https://${dotenv.get('API_KEY')}:${dotenv.get('API_SECRET')}@api.cloudinary.com/v1_1/${dotenv.get('CLOUD_NAME')}';

  final String _baseUrl;

  String buildGetMediaResourcesUrl({String? resourceType}) {
    return '$_baseUrl/resources/$resourceType';
  }
}


class CloudRemoteApi {
  CloudRemoteApi({
    @visibleForTesting Dio? dio,
    @visibleForTesting UrlBuilder? urlBuilder,
  })  : _dio = dio ?? Dio(),
        _urlBuilder = urlBuilder ?? UrlBuilder() {
    //_dio.setUpBasicAuthHeader();
  }

  final Dio _dio;
  final UrlBuilder _urlBuilder;

  Future<ResourcesListRM> getResourceList() async {
    final url = _urlBuilder.buildGetMediaResourcesUrl(resourceType: 'video');
    try {
      final response = await _dio.get(url);
      final jsonObject = response.data;
      final resourceList = ResourcesListRM.fromJson(jsonObject);
      return resourceList;
    } on DioException catch (error){
      if(error.response!.statusCode == 401){
        print("Error Unauthorized");
        print("Error Unauthorized: ${error.response!.data}");
      }
      rethrow;
    }
  }
}
