import 'package:dio/dio.dart';
import 'package:flutter_training/data/dio/dio_provider.dart';

abstract class ProjectBaseRemoteResource {
  Dio get dio => DioProvider.dioWithHeaderToken;

  final String url="https://63bf738ce262345656e97157.mockapi.io";
}
