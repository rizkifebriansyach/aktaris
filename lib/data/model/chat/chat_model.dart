import '../../../domain/entities/chat/list_message_entity.dart';

class ChatModel extends MessageListEntity {
  int? count;
  List<Message>? messages;
  int? offset;
  bool? success;
  int? total;

  ChatModel({
    this.count,
    this.messages,
    this.offset,
    this.success,
    this.total,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        count: json["count"],
        messages: List<Message>.from(
            json["messages"].map((x) => Message.fromJson(x))),
        offset: json["offset"],
        success: json["success"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "messages": List<dynamic>.from(messages!.map((x) => x.toJson())),
        "offset": offset,
        "success": success,
        "total": total,
      };
}

class Message {
  String? id;
  DateTime? updatedAt;
  List<Attachment>? attachments;
  List<dynamic>? channels;
  FileClass? file;
  List<FileClass>? files;
  bool? groupable;
  List<Md>? md;
  List<dynamic>? mentions;
  String? msg;
  String? rid;
  DateTime? ts;
  U? u;
  List<dynamic>? urls;

  Message({
    this.id,
    this.updatedAt,
    this.attachments,
    this.channels,
    this.file,
    this.files,
    this.groupable,
    this.md,
    this.mentions,
    this.msg,
    this.rid,
    this.ts,
    this.u,
    this.urls,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["_id"],
        updatedAt: DateTime.parse(json["_updatedAt"]),
        attachments: json["attachments"] != null
            ? List<Attachment>.from(
                json["attachments"].map((x) => Attachment.fromJson(x)))
            : null,
        channels: json["channels"] != null
            ? List<dynamic>.from(json["channels"].map((x) => x))
            : null,
        file:json["file"]!=null? FileClass.fromJson(json["file"]):null,
        files: json["files"] != null
            ? List<FileClass>.from(
                json["files"].map((x) => FileClass.fromJson(x)))
            : null,
        groupable: json["groupable"],
        md: json["md"] != null
            ? List<Md>.from(json["md"].map((x) => Md.fromJson(x)))
            : null,
        mentions: List<dynamic>.from(json["mentions"].map((x) => x)),
        msg: json["msg"],
        rid: json["rid"],
        ts: DateTime.parse(json["ts"]),
        u: U.fromJson(json["u"]),
        urls: json["urls"] != null
            ? List<dynamic>.from(json["urls"].map((x) => x))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "_updatedAt": updatedAt?.toIso8601String(),
        "attachments": List<dynamic>.from(attachments!.map((x) => x.toJson())),
        "channels": List<dynamic>.from(channels!.map((x) => x)),
        "file": file?.toJson(),
        "files": List<dynamic>.from(files!.map((x) => x.toJson())),
        "groupable": groupable,
        "md": List<dynamic>.from(md!.map((x) => x.toJson())),
        "mentions": List<dynamic>.from(mentions!.map((x) => x)),
        "msg": msg,
        "rid": rid,
        "ts": ts?.toIso8601String(),
        "u": u?.toJson(),
        "urls": List<dynamic>.from(urls!.map((x) => x)),
      };
}

class Attachment {
  String? format;
  int? size;
  String? title;
  String? titleLink;
  bool? titleLinkDownload;
  DateTime? ts;
  String? type;

  Attachment({
    this.format,
    this.size,
    this.title,
    this.titleLink,
    this.titleLinkDownload,
    this.ts,
    this.type,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        format: json["format"],
        size: json["size"],
        title: json["title"],
        titleLink: json["title_link"],
        titleLinkDownload: json["title_link_download"],
        ts: DateTime.parse(json["ts"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "format": format,
        "size": size,
        "title": title,
        "title_link": titleLink,
        "title_link_download": titleLinkDownload,
        "ts": ts?.toIso8601String(),
        "type": type,
      };
}

class FileClass {
  String? id;
  String? name;
  String? type;

  FileClass({
    this.id,
    this.name,
    this.type,
  });

  factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
        id: json["_id"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "type": type,
      };
}

class Md {
  String? type;
  List<Value>? value;

  Md({
    this.type,
    this.value,
  });

  factory Md.fromJson(Map<String, dynamic> json) => Md(
        type: json["type"],
        value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "value": List<dynamic>.from(value!.map((x) => x.toJson())),
      };
}

class Value {
  String? type;
  String? value;

  Value({
    this.type,
    this.value,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
      };
}

class U {
  String? id;
  String? name;
  String? username;

  U({
    this.id,
    this.name,
    this.username,
  });

  factory U.fromJson(Map<String, dynamic> json) => U(
        id: json["_id"],
        name: json["name"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "username": username,
      };
}
