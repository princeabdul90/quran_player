/*
* Developer: Abubakar Abdullahi
* Date: 26/09/2024
*/

import 'package:quran_player/src/cloud_api/cloud_remote_api.dart';
import 'package:quran_player/src/cloud_api/model/resource_list_rm.dart';

class PlaylistRepository {

  const PlaylistRepository({
    required CloudRemoteApi cloudApi,
  }) : _cloudApi = cloudApi;

  final CloudRemoteApi _cloudApi;

  Future<ResourcesListRM> getResources() async {
    try {
      final resource = await _cloudApi.getResourceList();
      return resource;
    }catch (error){
      rethrow;
    }
  }

}