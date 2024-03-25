import 'dart:io';

import 'package:linjiashop_admin_web/exports.dart';
import 'package:retrofit/retrofit.dart';

import 'app_dio.dart';

part 'app_data_source.g.dart';

final appDataSourceProvider = Provider((ref) => AppDataSource(ref));

///http://106.38.204.135/ef-api/api/news?limit=1&page=1&type=0
@RestApi()
abstract class AppDataSource {
  factory AppDataSource(Ref ref) => _AppDataSource(ref.read(dioProvider));

  ///多文件上传
  @POST('common/uploadFiles')
  @MultiPart()
  Future<ResponseBodyMt> postFormData3(
      @Part() List<File> file, @CancelRequest() cancelRequest);

  @POST('account/login')
  Future<ResponseBodyMt> login(
      @Body() Map<String,dynamic> loginInfo, @CancelRequest() cancelRequest);

  @GET('account/info')
  Future<ResponseBodyMt> info(@CancelRequest() cancelRequest);

  @GET('loginLog/list')
  Future<ResponseBodyMt> loginLogList(@Queries() Map<String,dynamic> params,  @CancelRequest() cancelRequest);

}
