import 'package:dio/dio.dart';
import 'package:get/get.dart';

abstract class UiState<T> {
  final T? data;
  final Rx<DioException>? error;

  UiState({this.data, this.error});
}

class UiData<T> extends UiState<T> {
  UiData({required T data}) : super(data: data);
}

class UiLoading<T> extends UiState<T> {
  UiLoading() : super();
}

class UiError<T> extends UiState<T> {
  UiError({required DioException error}) : super(error: error.obs);
}
