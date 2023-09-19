


import 'package:flutter_admin_template/exports.dart';

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


