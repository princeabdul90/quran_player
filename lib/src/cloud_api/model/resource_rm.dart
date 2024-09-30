/*
* Developer: Abubakar Abdullahi
* Date: 25/09/2024
*/

class ResourceRM {
  final String? assetId;
  final String? publicId;
  final String? format;
  final int? version;
  final String? resourceType;
  final String? type;
  final DateTime? createdAt;
  final int? bytes;
  final int? width;
  final int? height;
  final String? folder;
  final String? url;
  final String? secureUrl;
  final bool? isAudio;

  ResourceRM({
    this.assetId,
    this.publicId,
    this.format,
    this.version,
    this.resourceType,
    this.type,
    this.createdAt,
    this.bytes,
    this.width,
    this.height,
    this.folder,
    this.url,
    this.secureUrl,
    this.isAudio,
  });

  factory ResourceRM.fromJson(Map<String, dynamic> json) => ResourceRM(
    assetId: json["asset_id"],
    publicId: json["public_id"],
    format: json["format"],
    version: json["version"],
    resourceType: json["resource_type"],
    type: json["type"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    bytes: json["bytes"],
    width: json["width"],
    height: json["height"],
    folder: json["folder"],
    url: json["url"],
    secureUrl: json["secure_url"],
    isAudio: json["is_audio"],
  );

  Map<String, dynamic> toJson() => {
    "asset_id": assetId,
    "public_id": publicId,
    "format": format,
    "version": version,
    "resource_type": resourceType,
    "type": type,
    "created_at": createdAt?.toIso8601String(),
    "bytes": bytes,
    "width": width,
    "height": height,
    "folder": folder,
    "url": url,
    "secure_url": secureUrl,
    "is_audio": isAudio,
  };
}
