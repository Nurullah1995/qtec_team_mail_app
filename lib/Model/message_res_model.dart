

import 'dart:convert';

List<MessageResponse> messageResponseFromJson(String str) => List<MessageResponse>.from(json.decode(str).map((x) => MessageResponse.fromJson(x)));

String messageResponseToJson(List<MessageResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageResponse {
  String? id;
  String? type;
  String? msgid;
  From? from;
  List<From>? to;
  String? subject;
  String? intro;
  bool? seen;
  bool? isDeleted;
  bool? hasAttachments;
  int? size;
  String? downloadUrl;
  String? sourceUrl;
  String? createdAt;
  String? updatedAt;
  String? accountId;

  MessageResponse(
      {this.id,
        this.type,
        this.msgid,
        this.from,
        this.to,
        this.subject,
        this.intro,
        this.seen,
        this.isDeleted,
        this.hasAttachments,
        this.size,
        this.downloadUrl,
        this.sourceUrl,
        this.createdAt,
        this.updatedAt,
        this.accountId});

  MessageResponse.fromJson(Map<String, dynamic> json) {

    type = json['@type'];
    id = json['id'];
    msgid = json['msgid'];
    from = json['from'] != null ? new From.fromJson(json['from']) : null;
    if (json['to'] != null) {
      to = <From>[];
      json['to'].forEach((v) {
        to!.add(new From.fromJson(v));
      });
    }
    subject = json['subject'];
    intro = json['intro'];
    seen = json['seen'];
    isDeleted = json['isDeleted'];
    hasAttachments = json['hasAttachments'];
    size = json['size'];
    downloadUrl = json['downloadUrl'];
    sourceUrl = json['sourceUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    accountId = json['accountId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['id'] = this.id;
    data['msgid'] = this.msgid;
    if (this.from != null) {
      data['from'] = this.from!.toJson();
    }
    if (this.to != null) {
      data['to'] = this.to!.map((v) => v.toJson()).toList();
    }
    data['subject'] = this.subject;
    data['intro'] = this.intro;
    data['seen'] = this.seen;
    data['isDeleted'] = this.isDeleted;
    data['hasAttachments'] = this.hasAttachments;
    data['size'] = this.size;
    data['downloadUrl'] = this.downloadUrl;
    data['sourceUrl'] = this.sourceUrl;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['accountId'] = this.accountId;
    return data;
  }
}

class From {
  String? address;
  String? name;

  From({this.address, this.name});

  From.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['name'] = this.name;
    return data;
  }
}