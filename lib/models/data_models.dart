


import 'package:linjiashop_admin_web/exports.dart';

enum AccountType { phone, email }

enum CodeType { register, update, forget,book,updateContact }

class PriceModel {
  String? open;
  String? high;
  String? low;
  String? close;
  String? usdRate;
  String? cnyRate;
  String? jpyRate;

  PriceModel(
      {this.open,
      this.high,
      this.low,
      this.close,
      this.usdRate,
      this.cnyRate,
      this.jpyRate});

  PriceModel.fromJson(Map<String, dynamic> json) {
    open = json['open'];
    high = json['high'];
    low = json['low'];
    close = json['close'];
    usdRate = json['usdRate'];
    cnyRate = json['cnyRate'];
    jpyRate = json['jpyRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['open'] = open;
    data['high'] = high;
    data['low'] = low;
    data['close'] = close;
    data['usdRate'] = usdRate;
    data['cnyRate'] = cnyRate;
    data['jpyRate'] = jpyRate;
    return data;
  }
}

class OptionItem extends Equatable {
  final String id;
  final String title;
  final bool isChecked;
  final List<OptionItem> items;

  OptionItem(this.id, this.title,
      {this.isChecked = false, List<OptionItem>? items})
      : items = items ?? [];

  @override
  List<Object?> get props => [id];
}

class EvaluateModel {
  String? createTime;
  String? id;
  String? image;
  String? keeperDesc;
  String? keeperId;
  String? keeperStarts;
  String? process;
  String? serviceDesc;
  String? serviceId;
  String? serviceStarts;
  String? userId;
  String? userName;
  String? keeperName;
  String? keeperAvatar;
  String? headImg;
  String? whole;

  EvaluateModel(
      {this.createTime,
      this.id,
      this.image,
      this.keeperDesc,
      this.keeperId,
      this.userName,
      this.keeperName,
      this.keeperAvatar,
      this.headImg,
      this.keeperStarts,
      this.process,
      this.serviceDesc,
      this.serviceId,
      this.serviceStarts,
      this.userId,
      this.whole});

  EvaluateModel.fromJson(Map<String, dynamic> json) {
    createTime = json['createTime'];
    id = json['id'];
    image = json['image'];
    keeperDesc = json['keeperDesc'];
    keeperId = json['keeperId'];
    userName = json['userName'];
    keeperName = json['keeperName'];
    keeperAvatar = json['keeperAvatar'];
    headImg = json['headImg'];
    keeperStarts = json['keeperStarts'];
    process = json['process'];
    serviceDesc = json['serviceDesc'];
    serviceId = json['serviceId'];
    serviceStarts = json['serviceStarts'];
    userId = json['userId'];
    whole = json['whole'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createTime'] = createTime;
    data['id'] = id;
    data['image'] = image;
    data['keeperDesc'] = keeperDesc;
    data['keeperId'] = keeperId;
    data['userName'] = userName;
    data['headImg'] = headImg;
    data['keeperName'] = keeperName;
    data['keeperAvatar'] = keeperAvatar;
    data['keeperStarts'] = keeperStarts;
    data['process'] = process;
    data['serviceDesc'] = serviceDesc;
    data['serviceId'] = serviceId;
    data['serviceStarts'] = serviceStarts;
    data['userId'] = userId;
    data['whole'] = whole;
    return data;
  }
}

class ChartDataModel{
  DateTime dateTime;
  double value;
  int index;

  ChartDataModel(this.dateTime, this.value,this.index);
}


class PageDataListModel {
  PageDataListModel({
    this.sort,
    required this.total,
    required this.size,
    required this.pages,
    required this.current,
    required this.records,
    required this.limit,
    required this.offset,
    required this.searchCount,
    this.filters,
  });


  List<T> converterT<T>(List<T> Function(List<dynamic> list) mapT){
      return mapT(records);
  }

  factory PageDataListModel.fromJson(Map json) {
    final records = json['records'];
    return PageDataListModel(
      sort: json['sort'],
      total: json['total'],
      size: json['size'],
      pages: json['pages'],
      current: json['current'],
      records: records,
      limit: json['limit'],
      offset: json['offset'],
      searchCount: json['searchCount'],
      filters: json['filters'],
    );
  }

  final dynamic sort;
  final int total;
  final int size;
  final int pages;
  final int current;
  final List<dynamic> records;
  final int limit;
  final int offset;
  final bool searchCount;
  final dynamic filters;

  Map<String, dynamic> toJson() {
    return {
      'sort': sort,
      'total': total,
      'size': size,
      'pages': pages,
      'current': current,
      'records': records,
      'limit': limit,
      'offset': offset,
      'searchCount': searchCount,
      'filters': filters,
    };
  }

  PageDataListModel copyWith({
    dynamic sort,
    int? total,
    int? size,
    int? pages,
    int? current,
    List<dynamic>? records,
    int? limit,
    int? offset,
    bool? searchCount,
    dynamic filters,
  }) {
    return PageDataListModel(
      sort: sort ?? this.sort,
      total: total ?? this.total,
      size: size ?? this.size,
      pages: pages ?? this.pages,
      current: current ?? this.current,
      records: records ?? this.records,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      searchCount: searchCount ?? this.searchCount,
      filters: filters ?? this.filters,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PageDataListModel &&
              runtimeType == other.runtimeType &&
              sort == other.sort &&
              total == other.total &&
              size == other.size &&
              pages == other.pages &&
              current == other.current &&
              const DeepCollectionEquality().equals(records, other.records) &&
              limit == other.limit &&
              offset == other.offset &&
              searchCount == other.searchCount &&
              filters == other.filters;

  @override
  int get hashCode => Object.hashAll([
    sort,
    total,
    size,
    pages,
    current,
    const DeepCollectionEquality().hash(records),
    limit,
    offset,
    searchCount,
    filters,
  ]);
}


class RecordsItem {
  RecordsItem({
    this.regularMessage,
    required this.userid,
    required this.id,
    required this.logname,
    required this.ip,
    required this.createtime,
    this.message,
    required this.userName,
    required this.createTime,
    required this.succeed,
  });

  factory RecordsItem.fromJson(Map json) {
    return RecordsItem(
      regularMessage: json['regularMessage'],
      userid: json['userid'],
      id: json['id'],
      logname: json['logname'],
      ip: json['ip'],
      createtime: json['createtime'],
      message: json['message'],
      userName: json['userName'],
      createTime: json['createTime'],
      succeed: json['succeed'],
    );
  }

  final dynamic regularMessage;
  final int userid;
  final int id;
  final String logname;
  final String ip;
  final String createtime;
  final dynamic message;
  final String userName;
  final String createTime;
  final String succeed;

  Map<String, dynamic> toJson() {
    return {
      'regularMessage': regularMessage,
      'userid': userid,
      'id': id,
      'logname': logname,
      'ip': ip,
      'createtime': createtime,
      'message': message,
      'userName': userName,
      'createTime': createTime,
      'succeed': succeed,
    };
  }

  RecordsItem copyWith({
    dynamic regularMessage,
    int? userid,
    int? id,
    String? logname,
    String? ip,
    String? createtime,
    dynamic message,
    String? userName,
    String? createTime,
    String? succeed,
  }) {
    return RecordsItem(
      regularMessage: regularMessage ?? this.regularMessage,
      userid: userid ?? this.userid,
      id: id ?? this.id,
      logname: logname ?? this.logname,
      ip: ip ?? this.ip,
      createtime: createtime ?? this.createtime,
      message: message ?? this.message,
      userName: userName ?? this.userName,
      createTime: createTime ?? this.createTime,
      succeed: succeed ?? this.succeed,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is RecordsItem &&
              runtimeType == other.runtimeType &&
              regularMessage == other.regularMessage &&
              userid == other.userid &&
              id == other.id &&
              logname == other.logname &&
              ip == other.ip &&
              createtime == other.createtime &&
              message == other.message &&
              userName == other.userName &&
              createTime == other.createTime &&
              succeed == other.succeed;

  @override
  int get hashCode => Object.hashAll([
    regularMessage,
    userid,
    id,
    logname,
    ip,
    createtime,
    message,
    userName,
    createTime,
    succeed,
  ]);
}






