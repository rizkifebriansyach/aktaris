import 'package:aktaris_app/config/network/api_message.dart';
import 'package:aktaris_app/config/network/api_response.dart';
import 'package:dio/dio.dart';

sealed class NetworkExceptionData with ApiMessage {
  final String? prefix;
  final String? message;
  final Response? response;

  NetworkExceptionData({
    this.prefix,
    this.message,
    this.response,
  });

  @override
  String toString() {
    String result = '';
    if (response?.statusCode == 400 || response?.statusCode == 401) {
      ApiResponse res = ApiResponse.fromJson(response?.data);
      result = convertMessage(res.error ?? res.message!);
    } else {
      result += (prefix != null) ? '$prefix, $message' : '$message';
    }
    return result;
  }
}

mixin NetworkException implements Exception {
  NetworkExceptionData handleResponse(Response response) {
    int statusCode = response.statusCode!;
    switch (statusCode) {
      case 400:
        final errorMessage = ApiResponse.fromJson(response.data).error;
        return BadRequestException(response: response, message: errorMessage);
      case 403:
      case 422:
        return BadRequestException(response: response);
      case 401:
        return UnauthorisedException(response: response);
      case 404:
        // final errorMessage = ApiResponse.fromJson(response.data).message;
        return NotFoundException(response: response);
      case 409:
        return FetchDataException(response: response);
      case 408:
        return SendTimeOutException();
      case 413:
        return RequestEntityTooLargeException(response: response);
      case 500:
        return InternalServerErrorException(response: response);
      case 503:
        return InternalServerErrorException();
      default:
        return FetchDataException(
          message: 'Received invalid status code: $statusCode',
          response: response,
        );
    }
  }

  NetworkExceptionData getErrorException(error) {
    if (error is Exception) {
      try {
        NetworkExceptionData networkExceptions;
        if (error is DioException) {
          networkExceptions = switch (error.type) {
            DioExceptionType.cancel => RequestCancelled(),
            DioExceptionType.connectionTimeout => ConnectionTimeOutException(),
            DioExceptionType.receiveTimeout => ReceiveTimeOutException(),
            DioExceptionType.sendTimeout => SendTimeOutException(),
            DioExceptionType.unknown => error.error is SocketException
                ? SocketException()
                : FetchDataException(),
            DioExceptionType.badResponse => handleResponse(error.response!),
            DioExceptionType.badCertificate => BadCertificateException(),
            DioExceptionType.connectionError => ConnectionTimeOutException(),
          };
        } else if (error is SocketException) {
          networkExceptions = SocketException();
        } else {
          networkExceptions = UnexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return FetchDataException();
      } catch (_) {
        return UnexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return UnableToProcess();
      } else {
        return UnexpectedError();
      }
    }
  }
}

final class ConnectionTimeOutException extends NetworkExceptionData {
  ConnectionTimeOutException() : super(message: 'connection timeout');
}

final class ReceiveTimeOutException extends NetworkExceptionData {
  ReceiveTimeOutException() : super(message: 'txt_connection_timeout');
}

final class SendTimeOutException extends NetworkExceptionData {
  SendTimeOutException() : super(message: 'txt_connection_timeout');
}

final class InternalServerErrorException extends NetworkExceptionData {
  InternalServerErrorException({Response? response}) : super(message: 'txt_internal_server_error', response: response);
}

final class RequestEntityTooLargeException extends NetworkExceptionData {
  RequestEntityTooLargeException({Response? response})
      : super(message: 'txt_request_entity_to_large', response: response);
}

final class FetchDataException extends NetworkExceptionData {
  FetchDataException({String? message, Response? response})
      : super(
            message: message ?? 'txt_error_during_communication',
            response: response);
}

final class NotFoundException extends NetworkExceptionData {
  NotFoundException({String? message, Response? response})
      : super(message: message ?? 'not found', response: response);
}

final class BadRequestException extends NetworkExceptionData {
  BadRequestException({Response? response, String? message})
      : super(prefix: 'Bad request', message: message, response: response);
}

final class BadCertificateException extends NetworkExceptionData {
  BadCertificateException({Response? response})
      : super(message: 'txt_bad_certificate', response: response);
}

final class UnauthorisedException extends NetworkExceptionData {
  UnauthorisedException({Response? response})
      : super(message: 'txt_unauthorized', response: response);
}

final class InvalidInputException extends NetworkExceptionData {
  InvalidInputException({Response? response})
      : super(message: 'txt_invalid_input', response: response);
}

final class RequestCancelled extends NetworkExceptionData {
  RequestCancelled({Response? response})
      : super(message: 'txt_request_cancel', response: response);
}

final class SocketException extends NetworkExceptionData {
  SocketException({Response? response})
      : super(
            prefix: 'Masalah Konektivitas',
            message: 'Tidak terhubung dengan internet');
}

final class UnexpectedError extends NetworkExceptionData {
  UnexpectedError({Response? response})
      : super(
          prefix: 'Terjadi Masalah',
          message: 'Terjadi Masalah',
        );
}

final class UnableToProcess extends NetworkExceptionData {
  UnableToProcess({Response? response})
      : super(message: 'txt_unable_to_process', response: response);
}
