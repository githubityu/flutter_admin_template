import 'package:ityu_tools/exports.dart';




class LoginLogModel  with SelectableX{
  LoginLogModel({
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

  factory LoginLogModel.fromJson(Map json) {
    return LoginLogModel(
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

  LoginLogModel copyWith({
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
    return LoginLogModel(
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
          other is LoginLogModel &&
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