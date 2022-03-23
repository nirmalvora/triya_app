import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:triya_app/constants/api_constants.dart';
import 'package:triya_app/constants/string_res.dart';
import 'package:triya_app/preference/preference_keys.dart';
import 'package:triya_app/preference/prerences.dart';
import 'package:triya_app/services/error_handling.dart';
import 'package:triya_app/utils/internet_connectivity.dart';
import 'package:triya_app/utils/toast_utils.dart';

class BaseApiService {
  Dio _dio = Dio();
  String tag = 'Base Project API:';
  CancelToken? _cancelToken;
  static final Dio mDio = Dio();
  static final BaseApiService instance = BaseApiService._internal();

  factory BaseApiService({bool stripeAuth = false}) {
    return instance;
  }

  BaseApiService._internal() {
    _dio = initApiServiceDio();
  }

  Dio initApiServiceDio() {
    _cancelToken = CancelToken();
    final baseOption = BaseOptions(
      connectTimeout: 120 * 1000,
      receiveTimeout: 120 * 1000,
      baseUrl: AppConfig.baseUrl,
      contentType: 'application/json',
    );
    mDio.options = baseOption;
    final mInterceptorsWrapper = InterceptorsWrapper(
      onRequest: (options, handler) async {
        var accessToken =
            await Preferences.getString(PreferenceKeys.accessToken, "");
        options.headers = {
          'Authorization': 'Bearer $accessToken',
        };
        return handler.next(options);
      },
      onResponse: (e, handler) {
        return handler.next(e);
      },
      onError: (e, handler) async {
        return handler.next(e);
      },
    );
    mDio.interceptors.add(mInterceptorsWrapper);

    return mDio;
  }

  void cancelRequests({CancelToken? cancelToken}) {
    cancelToken == null
        ? _cancelToken!.cancel('Cancelled')
        : cancelToken.cancel();
  }

  Future<Response?> get(
    String endUrl, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    if (!await isInternet()) {
      ToastUtils.showFailed(message: StringRes.pleaseCheckInternet);
      return null;
    }
    return await (_dio.get(
      endUrl,
      queryParameters: params,
      cancelToken: cancelToken ?? _cancelToken,
      options: options,
    )).catchError((e) async {
      sentryError(error: e);
      errorHandling(
          error: e,
          callBack: () {
            initApiServiceDio();
            _dio.get(
              endUrl,
              queryParameters: params,
              cancelToken: cancelToken ?? _cancelToken,
              options: options,
            );
          });
      throw e;
    });
  }

  Future<Response?> getNormal(
    String endUrl, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    if (!await isInternet()) {
      ToastUtils.showFailed(message: StringRes.pleaseCheckInternet);
      return null;
    }
    return await (_dio.get(
      endUrl,
      queryParameters: params,
      cancelToken: cancelToken ?? _cancelToken,
      options: options,
    )).catchError((e) async {});
  }

  Future<Response?> put(String endUrl,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? params,
      Options? options,
      CancelToken? cancelToken,
      void Function(void)? onSuccess,
      void Function(void)? onError}) async {
    if (!await isInternet()) {
      ToastUtils.showFailed(message: StringRes.pleaseCheckInternet);
      return null;
    }
    return await (_dio
        .put(
      endUrl,
      data: data,
      queryParameters: params,
      cancelToken: cancelToken ?? _cancelToken,
      options: options,
    )
        .then((value) {
      if (value.statusCode == HttpStatus.ok ||
          value.statusCode == HttpStatus.created) {
        if (onSuccess != null) {
          onSuccess(value.data);
        }
      } else {
        if (onError != null) {
          onError(value.data);
        }
      }
      return value;
    }).catchError((e) async {
      sentryError(error: e);
      await errorHandling(
          error: e,
          callBack: () {
            initApiServiceDio();
            _dio
                .put(
              endUrl,
              data: data,
              queryParameters: params,
              cancelToken: cancelToken ?? _cancelToken,
              options: options,
            )
                .then((value) {
              if (value.statusCode == HttpStatus.ok ||
                  value.statusCode == HttpStatus.created) {
                if (onSuccess != null) {
                  onSuccess(value.data);
                }
              } else {
                if (onError != null) {
                  onError(value.data);
                }
              }
            });
          });
      throw e;
    }));
  }

  Future<Response?> post(String endUrl,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? params,
      Options? options,
      CancelToken? cancelToken,
      void Function(void)? onSuccess,
      void Function(void)? onError}) async {
    if (!await isInternet()) {
      ToastUtils.showFailed(message: StringRes.pleaseCheckInternet);
      return null;
    }
    return await (_dio
        .post(endUrl,
            data: data,
            queryParameters: params,
            cancelToken: cancelToken ?? _cancelToken,
            options: options)
        .then((value) {
      if (value.statusCode == HttpStatus.ok ||
          value.statusCode == HttpStatus.created) {
        if (onSuccess != null) {
          onSuccess(value.statusMessage);
        }
      } else {
        if (onError != null) {
          onError(value.data);
        }
      }
      return value;
    })).catchError((e) async {
      sentryError(error: e);
      await errorHandling(
          error: e,
          callBack: () {
            initApiServiceDio();
            _dio
                .post(endUrl,
                    data: data,
                    queryParameters: params,
                    cancelToken: cancelToken ?? _cancelToken,
                    options: options)
                .then((value) {
              if (value.statusCode == HttpStatus.ok ||
                  value.statusCode == HttpStatus.created) {
                if (onSuccess != null) {
                  onSuccess(value.data);
                }
              } else {
                if (onError != null) {
                  onError(value.data);
                }
              }
            });
          });
      throw e;
    });
  }

  Future<Response?> postForm(String endUrl,
      {FormData? data,
      Map<String, dynamic>? params,
      Options? options,
      CancelToken? cancelToken,
      void Function(void)? onSuccess,
      void Function(void)? onError}) async {
    if (!await isInternet()) {
      ToastUtils.showFailed(message: StringRes.pleaseCheckInternet);
      return null;
    }
    return await (_dio
        .post(endUrl,
            data: data,
            queryParameters: params,
            cancelToken: cancelToken ?? _cancelToken,
            options: options)
        .then((value) {
      if (value.statusCode == HttpStatus.ok ||
          value.statusCode == HttpStatus.created) {
        if (onSuccess != null) {
          onSuccess(value.statusMessage);
        }
      } else {
        if (onError != null) {
          onError(value.data);
        }
      }
      return value;
    })).catchError((e) async {
      sentryError(error: e);
      await errorHandling(
          error: e,
          callBack: () {
            initApiServiceDio();
            _dio
                .post(endUrl,
                    data: data,
                    queryParameters: params,
                    cancelToken: cancelToken ?? _cancelToken,
                    options: options)
                .then((value) {
              if (value.statusCode == HttpStatus.ok ||
                  value.statusCode == HttpStatus.created) {
                if (onSuccess != null) {
                  onSuccess(value.data);
                }
              } else {
                if (onError != null) {
                  onError(value.data);
                }
              }
            });
          });
      throw e;
    });
  }

  Future<Response?> patch(
    String endUrl, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    if (!await isInternet()) {
      ToastUtils.showFailed(message: StringRes.pleaseCheckInternet);
      return null;
    }
    return await (_dio.patch(
      endUrl,
      data: data,
      queryParameters: params,
      cancelToken: cancelToken ?? _cancelToken,
      options: options,
    )).catchError((e) async {
      sentryError(error: e);
      await errorHandling(
          error: e,
          callBack: () {
            initApiServiceDio();
            _dio.patch(
              endUrl,
              data: data,
              queryParameters: params,
              cancelToken: cancelToken ?? _cancelToken,
              options: options,
            );
          });
      throw e;
    });
  }

  Future<Response?> delete(
    String endUrl, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    if (!await isInternet()) {
      ToastUtils.showFailed(message: StringRes.pleaseCheckInternet);
      return null;
    }
    return await (_dio.delete(
      endUrl,
      data: data,
      queryParameters: params,
      cancelToken: cancelToken,
      options: options,
    )).catchError((e) async {
      sentryError(error: e);
      await errorHandling(
          error: e,
          callBack: () {
            initApiServiceDio();
            _dio.delete(
              endUrl,
              data: data,
              queryParameters: params,
              cancelToken: cancelToken,
              options: options,
            );
          });
      throw e;
    });
  }

  Future<Response?> download(
      {required String documentLink, required String documentPath}) async {
    if (!await isInternet()) {
      ToastUtils.showFailed(message: StringRes.pleaseCheckInternet);
      return null;
    }
    return await (_dio.download(documentLink, documentPath))
        .catchError((e) async {
      sentryError(error: e);
      await errorHandling(
          error: e,
          callBack: () {
            initApiServiceDio();
            _dio.download(documentLink, documentPath);
          });
      throw e;
    });
  }

  Future<Response?> multipartPost(
    String endUrl, {
    FormData? data,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    if (!await isInternet()) {
      ToastUtils.showFailed(message: StringRes.pleaseCheckInternet);
      return null;
    }
    return await (_dio.post(
      endUrl,
      data: data,
      cancelToken: cancelToken,
      options: options,
    )).catchError((e) async {
      sentryError(error: e);
      await errorHandling(
          error: e,
          callBack: () {
            initApiServiceDio();
            _dio.post(
              endUrl,
              data: data,
              cancelToken: cancelToken,
              options: options,
            );
          });
      throw e;
    });
  }
}
