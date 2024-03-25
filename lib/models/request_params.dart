import 'package:linjiashop_admin_web/local/constants.dart';

class LoginLogParams extends PageParams{
  String? beginTime, endTime, logName;

  LoginLogParams(
      {this.beginTime,
      this.endTime,
      this.logName});

  Map<String, dynamic> toPageDataMap() {
    return {
      if (beginTime != null) 'beginTime': beginTime,
      if (endTime != null) 'endTime': endTime,
      'page': page,
      'limit': limit,
    };
  }
}


class PageParams{
  int page;
  int limit;
  PageParams(
      {this.page = Constants.startPage,
        this.limit = Constants.rowsPerPage});

}
