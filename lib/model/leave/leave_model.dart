// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

/*

approvedBy "NIPUN ATTRI"
description "hello"
displayName "NIPUN ATTRI"
endDate 25 June 2022 at 00:00:00 UTC+5:30
halfDayType null
isHalfDay true
startDate 25 June 2022 at 00:00:00 UTC+5:30
uid "Bg3HowiAZSXXhQbHyIdiMvrKowo1" 

*/

class LeaveDataModel {
  final String description;
  final String? displayName;
  final DateTime startDate;
  final DateTime endDate;
  final bool isHalfDay;
  final bool isMultipleDays;
  final String? uid;
  final String? halfDayType;
  LeaveDataModel({
    required this.description,
    this.displayName,
    required this.startDate,
    required this.endDate,
    required this.isHalfDay,
    this.isMultipleDays = false,
    this.uid,
    this.halfDayType,
  });

  LeaveDataModel copyWith({
    String? description,
    String? displayName,
    DateTime? startDate,
    DateTime? endDate,
    bool? isHalfDay,
    bool? isMultipleDays,
    String? uid,
    String? halfDayType,
  }) {
    return LeaveDataModel(
      description: description ?? this.description,
      displayName: displayName ?? this.displayName,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isHalfDay: isHalfDay ?? this.isHalfDay,
      isMultipleDays: isMultipleDays ?? this.isMultipleDays,
      uid: uid ?? this.uid,
      halfDayType: halfDayType ?? this.halfDayType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'displayName': displayName,
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
      'isHalfDay': isHalfDay,
      'isMultipleDays': isMultipleDays,
      'uid': uid,
      'halfDayType': halfDayType,
    };
  }

  factory LeaveDataModel.fromMap(Map<String, dynamic> map) {
    return LeaveDataModel(
      description: map['description'] as String,
      displayName:
          map['displayName'] != null ? map['displayName'] as String : null,
      startDate: (map['startDate'] as Timestamp).toDate(),
      endDate: (map['endDate'] as Timestamp).toDate(),
      isHalfDay: map['isHalfDay'] as bool,
      isMultipleDays: (DateFormat.yMMMMd()
                  .format((map['startDate'] as Timestamp).toDate()) !=
              DateFormat.yMMMMd()
                  .format((map['endDate'] as Timestamp).toDate()))
          ? true
          : false,
      uid: map['uid'] != null ? map['uid'] as String : null,
      halfDayType:
          map['halfDayType'] != null ? map['halfDayType'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LeaveDataModel.fromJson(String source) =>
      LeaveDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LeaveDataModel(description: $description, displayName: $displayName, startDate: $startDate, endDate: $endDate, isHalfDay: $isHalfDay, isMultipleDays: $isMultipleDays, uid: $uid, halfDayType: $halfDayType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LeaveDataModel &&
        other.description == description &&
        other.displayName == displayName &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.isHalfDay == isHalfDay &&
        other.isMultipleDays == isMultipleDays &&
        other.uid == uid &&
        other.halfDayType == halfDayType;
  }

  @override
  int get hashCode {
    return description.hashCode ^
        displayName.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        isHalfDay.hashCode ^
        isMultipleDays.hashCode ^
        uid.hashCode ^
        halfDayType.hashCode;
  }
}

class PendingLeaveModel extends LeaveDataModel {
  PendingLeaveModel(
      {required String description,
      required String displayName,
      required DateTime startDate,
      required DateTime endDate,
      required bool isHalfDay,
      required bool isMultipleDays,
      required String uid})
      : super(
          description: description,
          displayName: displayName,
          startDate: startDate,
          endDate: endDate,
          isHalfDay: isHalfDay,
          isMultipleDays: isMultipleDays,
          uid: uid,
        );
}

class ApprovedLeaveModel extends LeaveDataModel {
  final String approvedBy;

  ApprovedLeaveModel({
    required this.approvedBy,
    required String description,
    required String? displayName,
    required DateTime startDate,
    required DateTime endDate,
    required bool isHalfDay,
    required bool isMultipleDays,
    required String? uid,
    String? halfDayType,
  }) : super(
          description: description,
          displayName: displayName,
          startDate: startDate,
          endDate: endDate,
          isHalfDay: isHalfDay,
          isMultipleDays: isMultipleDays,
          uid: uid,
        );
  factory ApprovedLeaveModel.fromMap(Map<String, dynamic> map) {
    return ApprovedLeaveModel(
      description: map['description'] as String,
      displayName:
          map['displayName'] != null ? map['displayName'] as String : null,
      startDate: (map['startDate'] as Timestamp).toDate(),
      endDate: (map['endDate'] as Timestamp).toDate(),
      isHalfDay: map['isHalfDay'] as bool,
      isMultipleDays: (DateFormat.yMMMMd()
                  .format((map['startDate'] as Timestamp).toDate()) !=
              DateFormat.yMMMMd()
                  .format((map['endDate'] as Timestamp).toDate()))
          ? true
          : false,
      uid: map['uid'] != null ? map['uid'] as String : null,
      halfDayType:
          map['halfDayType'] != null ? map['halfDayType'] as String : null,
      approvedBy: map["approvedBy"] as String,
    );
  }

  @override
  int get hashCode => approvedBy.hashCode ^ super.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApprovedLeaveModel &&
        other.description == description &&
        other.displayName == displayName &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.isHalfDay == isHalfDay &&
        other.isMultipleDays == isMultipleDays &&
        other.uid == uid &&
        other.halfDayType == halfDayType &&
        other.approvedBy == approvedBy;
  }
}

class RejectedLeaveModel extends LeaveDataModel {
  final String rejetedBy;

  RejectedLeaveModel(
    this.rejetedBy, {
    required String description,
    required String displayName,
    required DateTime startDate,
    required DateTime endDate,
    required bool isHalfDay,
    required bool isMultipleDays,
    required String uid,
  }) : super(
          description: description,
          displayName: displayName,
          startDate: startDate,
          endDate: endDate,
          isHalfDay: isHalfDay,
          isMultipleDays: isMultipleDays,
          uid: uid,
        );

  @override
  int get hashCode => rejetedBy.hashCode ^ super.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApprovedLeaveModel &&
        other.description == description &&
        other.displayName == displayName &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.isHalfDay == isHalfDay &&
        other.isMultipleDays == isMultipleDays &&
        other.uid == uid &&
        other.halfDayType == halfDayType &&
        other.approvedBy == rejetedBy;
  }
}

// class LeaveModel {
//   final String? reason;
//   final bool isMultiple;
//   final bool isHalfDay;
//   final DateTime startDate;
//   final DateTime? endDate;
//   final bool? isMorningHalfDay;
//   LeaveModel({
//     required this.reason,
//     this.isMultiple = false,
//     this.isHalfDay = false,
//     required this.startDate,
//     this.endDate,
//     this.isMorningHalfDay,
//   });

//   LeaveModel copyWith({
//     String? reason,
//     bool? isMultiple,
//     bool? isHalfDay,
//     DateTime? startDate,
//     DateTime? endDate,
//     bool? isMorningHalfDay,
//   }) {
//     return LeaveModel(
//       reason: reason ?? this.reason,
//       isMultiple: isMultiple ?? this.isMultiple,
//       isHalfDay: isHalfDay ?? this.isHalfDay,
//       startDate: startDate ?? this.startDate,
//       endDate: endDate ?? this.endDate,
//       isMorningHalfDay: isMorningHalfDay ?? this.isMorningHalfDay,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'reason': reason,
//       'isMultiple': isMultiple,
//       'isHalfDay': isHalfDay,
//       'startDate': startDate.millisecondsSinceEpoch,
//       'endDate': endDate?.millisecondsSinceEpoch,
//       'isMorningHalfDay': isMorningHalfDay,
//     };
//   }

//   factory LeaveModel.fromMap(Map<String, dynamic> map) {
//     return LeaveModel(
//       reason: map['description'] != null ? map['description'] as String : null,
//       isMultiple: (DateFormat.yMMMMd()
//                   .format((map['startDate'] as Timestamp).toDate()) !=
//               DateFormat.yMMMMd()
//                   .format((map['endDate'] as Timestamp).toDate()))
//           ? true
//           : false,
//       isHalfDay: map['isHalfDay'] as bool,
//       startDate: (map['startDate'] as Timestamp).toDate(),
//       endDate: map['endDate'] != null
//           ? (map['endDate'] as Timestamp).toDate()
//           : null,
//       isMorningHalfDay: map['isMorningHalfDay'] != null
//           ? map['isMorningHalfDay'] as bool
//           : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory LeaveModel.fromJson(String source) =>
//       LeaveModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'LeaveModel(reason: $reason, isMultiple: $isMultiple, isHalfDay: $isHalfDay, startDate: $startDate, endDate: $endDate, isMorningHalfDay: $isMorningHalfDay)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is LeaveModel &&
//         other.reason == reason &&
//         other.isMultiple == isMultiple &&
//         other.isHalfDay == isHalfDay &&
//         other.startDate == startDate &&
//         other.endDate == endDate &&
//         other.isMorningHalfDay == isMorningHalfDay;
//   }

//   @override
//   int get hashCode {
//     return reason.hashCode ^
//         isMultiple.hashCode ^
//         isHalfDay.hashCode ^
//         startDate.hashCode ^
//         endDate.hashCode ^
//         isMorningHalfDay.hashCode;
//   }
// }
