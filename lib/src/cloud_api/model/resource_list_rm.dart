/*
* Developer: Abubakar Abdullahi
* Date: 25/09/2024
*/

import 'package:quran_player/src/cloud_api/model/resource_rm.dart';

class ResourcesListRM {
  final List<ResourceRM>? resources;

  ResourcesListRM({
    this.resources,
  });

  factory ResourcesListRM.fromJson(Map<String, dynamic> json) => ResourcesListRM(
    resources: json["resources"] == null ? [] : List<ResourceRM>.from(json["resources"]!.map((x) => ResourceRM.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "resources": resources == null ? [] : List<dynamic>.from(resources!.map((x) => x.toJson())),
  };
}