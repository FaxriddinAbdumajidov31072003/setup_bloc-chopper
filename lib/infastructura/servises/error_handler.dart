import 'dart:io';

import 'package:dio/dio.dart';

abstract class ErrorHandler {
  ErrorHandler._();

  static String getDioStatusMessage(error) {
    if (error is Exception) {
      try {
        String? status;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              status = "cancel";
              break;
            case DioErrorType.connectionTimeout:
              status = "connectionTimeout";
              break;
            case DioErrorType.unknown:
              status = "unknown";
              break;
            case DioErrorType.receiveTimeout:
              status = "500";
              break;
            case DioErrorType.badResponse:
              switch (error.response!.statusCode) {
                case 400:
                  status = "400";
                  break;
                case 401:
                  status = "401";
                  break;
                case 403:
                  status = "403";
                  break;
                case 404:
                  status = "404";
                  break;
                case 409:
                  status = "409";
                  break;
                case 422:
                  status = "422";
                  break;
                case 408:
                  status = "408";
                  break;
                case 500:
                  status = "500";
                  break;
                case 503:
                  status = "503";
                  break;
                default:
                  status = "500";
              }
              break;
            case DioErrorType.sendTimeout:
              status = "500";
              break;
            case DioErrorType.badCertificate:
            // TODO: Handle this case.
              break;
            case DioErrorType.connectionError:
            // TODO: Handle this case.
              break;
          }
        } else if (error is SocketException) {
          status = "500";
        } else {
          status = "500";
        }
        return status ?? "";
      } on FormatException catch (e) {
        return e.message;
      } catch (e) {
        return e.toString();
      }
    } else {
      return "Error";
    }
  }

}