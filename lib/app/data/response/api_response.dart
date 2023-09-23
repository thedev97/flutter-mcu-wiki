import 'status.dart';

class ApiResponse<T> {
  String? msg;
  Status? status;
  T? data;

  ApiResponse(this.msg, this.status, this.data);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.success() : status = Status.SUCCESS;

  ApiResponse.failed() : status = Status.FAILED;

  @override
  String toString() {
    return "Status $status \n Message $msg \n Data $data";
  }
}
