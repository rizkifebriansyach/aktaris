import 'package:aktaris_app/config/network/api_request.dart';
import 'package:aktaris_app/config/network/api_response.dart';
import 'package:aktaris_app/core/database/shared_prefs.dart';
import 'package:aktaris_app/data/model/chat/chat_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

abstract class ChatRemoteDatasource {
  Future<Map<String, dynamic>> createRoomChat({
    required userId,
  });

  Future<Map<String, dynamic>> sendMessage({
    required String roomId,
    required String message,
  });

  Future<ChatModel> getMessageList({
    required String roomId,
  });

  Future<Map<String, dynamic>> sendFile({
    required String docFile,
    String? message,
  });
}

class ChatRemoteDatasourceImpl implements ChatRemoteDatasource {
  @override
  Future<Map<String, dynamic>> createRoomChat({required userId}) async {
    try {
      final response = await ApiRequest.post(
        url: 'users/create-room',
        useToken: true,
        body: {
          "user_id": userId,
        },
      );
      return ApiResponse.fromJson(response.data).data;
    } catch (e) {
      debugPrint('Error = $e');
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> sendMessage(
      {required String roomId, required String message}) async {
    try {
      final response = await ApiRequest.post(
        url: 'users/send-message',
        useToken: true,
        body: {"rid": roomId, "msg": message},
      );
      return ApiResponse.fromJson(response.data).data;
    } catch (e) {
      debugPrint('Error Send Message = $e');
      rethrow;
    }
  }

  @override
  Future<ChatModel> getMessageList({required String roomId}) async {
    try {
      final response = await ApiRequest.get(
        url: "users/get-message",
        body: {
          "rid": roomId,
        },
      );
      return ChatModel.fromJson(ApiResponse.fromJson(response.data).data);
      // return (response.data["data"] as List)
      //     .map((data) => ChatModel.fromJson(data))
      //     .toList()
      //     .cast<ChatModel>();
    } catch (e) {
      debugPrint('Error get Message = $e');
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> sendFile(
      {required String docFile, String? message}) async {
    try {
      final response = await ApiRequest.post(
          url: prefs.getString(KeyPrefs.roomId)!,
          useToken: true,
          rocketChatRequest: true,
          contentType: "multipart/form-data",
          // headers: {
            
          //   "X-Auth-Token": prefs.getString(KeyPrefs.xAuthToken),
          //   "X-User-Id": prefs.getString(KeyPrefs.xUserId),
          // },
          body: {
            "file": await dio.MultipartFile.fromFile(
              docFile,
              filename: basename(docFile),
            ),
            "msg": message,
          });
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
