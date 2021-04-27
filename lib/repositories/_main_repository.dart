/// createdby Daewu Bintara
/// Monday, 4/26/21

import '../base/services/api.dart';
export '../base/services/api.dart';

var api = Api();

class CallBackData<T> {
  final Result result;
  final T data;
  CallBackData(this.result, this.data);
}

abstract class MainRepoImpl<T> {
  // ignore: missing_return
  Future<CallBackData<T>> createData() {}

  // ignore: missing_return
  T parsingData(dynamic json) {
    // return T.fromMap(json);
  }
}
