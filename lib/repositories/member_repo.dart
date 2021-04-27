import 'dart:convert';

import '../x_src/x_res.dart';

import '_main_repository.dart';

import '../models/x_exported_model.dart';

/// createdby Daewu Bintara
/// Monday, 4/26/21

class MemberRepo implements MainRepoImpl<Member> {

  @override
  Future<CallBackData<Member>> createData() async {

    var ress = await api.getResult(endPoint: "member");

    debugLog("Variable ress : ", ress.toJson());

    try {
      var member = parsingData(ress.body);
      return CallBackData(ress, member);
    } catch (e) {
      debugLog("Error repository : ", e.toString());
      return CallBackData(ress, null);
    }
  }

  @override
  Member parsingData(json) {
    return Member.fromMap(json);
  }


}