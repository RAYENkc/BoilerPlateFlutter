

import 'dart:io';

import 'package:BolilerPlate/config/app_constant.dart';
import 'package:BolilerPlate/config/statics/statics.dart';
import 'package:BolilerPlate/config/urls/app_urls.dart';
import 'package:BolilerPlate/config/urls/global_configuration.dart';
import 'package:BolilerPlate/core/services/token_service.dart';
import 'package:BolilerPlate/core/widgets/custom_toast.dart';
import 'package:dio/dio.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

class DioRequestsInterceptor {
  static Dio? _dio;

  static ResponseType responseType = ResponseType.json;


    //! Interceptor Setup
  static Dio get dio {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: GlobalConfiguration.baseUrl,
          connectTimeout:  const Duration(seconds:10),
          sendTimeout:  const Duration(seconds:10),
          receiveTimeout:  const Duration(seconds:10),
        ),
      );
    /*  _dio!.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));*/
      _dio!.interceptors.add(
        InterceptorsWrapper(
          onRequest: (
            RequestOptions requestOptions,
            RequestInterceptorHandler baseHandler,
          ) {
            // ignore: avoid_print
            print(
              "token   " + (Statics.loggedUser?.token ?? 'Not connected yet'),
            );
            print(
              "refreshToken  " +
                  (Statics.loggedUser?.refreshToken ?? 'Not connected yet'),
            );

            showLoader();

            if (requestOptions.method == 'GET') {
              requestOptions.queryParameters.removeWhere(
                (key, value) => value == null,
              );
            }

            requestOptions.responseType = responseType;

            final String basicAuth = Statics.loggedUser?.token == null
                ? ''
                : 'Bearer ${Statics.loggedUser?.token}';

            requestOptions.headers.addAll({
              HttpHeaders.authorizationHeader: basicAuth,
              HttpHeaders.contentTypeHeader: 'application/json',
              'Platform': 'BolilerPlate'
            });

            baseHandler.next(requestOptions);
          },
          onResponse: (
            Response<dynamic> response,
            ResponseInterceptorHandler handler,
          ) {
            EasyLoading.dismiss();
            responseType = ResponseType.json;
            handler.next(response);
          },
          onError: (
            DioException e,
            ErrorInterceptorHandler handler,
          ) async {
            responseType = ResponseType.json;
            _handleError(e, handler);
          },
        ),
      );
    }

    return _dio!;
  }

 //! Loader Setup
  static bool loaderEnabled = true;

  static void showLoader() {
    if (loaderEnabled) EasyLoading.show();
  }

  static void hideLoader() {
    EasyLoading.dismiss();
  }

  static void enableLoader() {
    DioRequestsInterceptor.loaderEnabled = true;
  }

  static void disableLoader() {
    DioRequestsInterceptor.loaderEnabled = false;
  }

  //! Error Handling

  static Dio tokenRefreshDio = Dio(
    BaseOptions(
      baseUrl: GlobalConfiguration.baseUrl,
      connectTimeout:  Duration(seconds:10),
      sendTimeout:  Duration(seconds:10),
      receiveTimeout:  Duration(seconds:10),
    ),
  );

  static void _handleError(DioException e, ErrorInterceptorHandler handler) async {
    if (e.response?.requestOptions.path ==
        GlobalConfiguration.baseUrl + AppUrls.tokenRefresh) {
      Statics.clearAllDataUserAndLogin();
      hideLoader();
      // return e;
    } else if (e.response?.statusCode == 401) {
      try {
        final TokenService _tokenService = TokenService();
        await _tokenService.refreshTokens().then((bool refreshIsDone) async {
          if (refreshIsDone) {
            //get new tokens ...
            print("access token" + (Statics.loggedUser?.token ?? ""));
            print("refresh token" + (Statics.loggedUser?.refreshToken ?? ""));
            //set bearer
            e.requestOptions.headers["Authorization"] =
                "Bearer " + (Statics.loggedUser?.token ?? "");
            //create request with new access token
            final opts = Options(
                method: e.requestOptions.method,
                headers: e.requestOptions.headers);
            final cloneReq = await dio.request(e.requestOptions.path,
                options: opts,
                data: e.requestOptions.data,
                queryParameters: e.requestOptions.queryParameters);

            return handler.resolve(cloneReq);
          } else {
            Statics.clearAllDataUserAndLogin();
            // return e;
          }
        });
        //return _dio;
      } catch (e) {
        hideLoader();
      }
    } else {
      hideLoader();
      // ! Failure response toasting
      if (e.response != null) {
        if (e.response!.statusCode == 400 &&
            e.response!.data != null &&
            e.response!.data['message'] != null) {
          showCustomToast(
            duration: 6,
            toastType: ToastTypes.error,
            contentText: 'ungültige Anmeldedaten',
            onTheTop: false,
          );
        } else if (e.response!.data != null &&
            e.response!.data['message'] != null) {
          showCustomToast(
            duration: 6,
            toastType: ToastTypes.error,
            contentText: e.response!.data['message'] as String,
            onTheTop: false,
          );
        } else {
          showCustomToast(
            duration: 6,
            toastType: ToastTypes.error,
            contentText: AppConstants.ERROR_OCCURED,
            onTheTop: false,
          );
        }
      } else {
        showCustomToast(
          duration: 6,
          toastType: ToastTypes.error,
          contentText: AppConstants.ERROR_OCCURED,
          onTheTop: false,
        );
      }
      handler.next(e);
    }
  }

  static String getEquivalentErrorText({DioException? error}) {
    if (error != null &&
        error.response != null &&
        error.response!.data != null &&
        error.response!.data['message'] != null) {
      return error.response!.data['message'] as String;
    } else {
      return AppConstants.ERROR_OCCURED;
    }
  }
}
