/*
* Developer: Abubakar Abdullahi
* Date: 25/09/2024
*/

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:quran_player/src/cloud_api/cloud_remote_api.dart';
import 'package:quran_player/src/cloud_api/model/resource_list_rm.dart';

void main() async{

  await dotenv.load(fileName: ".env");

  group('Get Cloudinary Media Resource', () {
    final dio = Dio(BaseOptions());
    final dioAdapter = DioAdapter(dio: dio);

    final cloudApi = CloudRemoteApi(dio: dio);

    const resourceType = 'video';

    final url =  UrlBuilder(baseUrl: 'https://${dotenv.maybeGet('API_KEY', fallback: 'API_KEY')}:${dotenv.maybeGet('API_SECRET', fallback: 'API_SECRET')}@api.cloudinary.com/v1_1/${dotenv.maybeGet('CLOUD_NAME', fallback: 'CLOUD_NAME')}').buildGetMediaResourcesUrl(resourceType: resourceType);

    test('When user sent request to get the list of video resource type, return an instance of ResourcesListRM', () async {
      dioAdapter.onGet(
        url,
            (server) => server.reply(
          200,
          {'message': 'Success!'},
          delay: const Duration(seconds: 1),
        ),
      );

      expect(await cloudApi.getResourceList(), isA<ResourcesListRM>());
    });

  },);
}