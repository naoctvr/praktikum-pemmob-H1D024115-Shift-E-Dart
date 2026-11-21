class Login {
  int? code;
  bool? status;
  String? token;
  int? userID;
  String? userEmail;

  Login({this.code, this.status, this.token, this.userID, this.userEmail});

  factory Login.fromJson(Map<String, dynamic> obj) {
    var data = obj['data'];
    var user = data is Map ? data['user'] : null;
    var rawId = user != null ? user['id'] : null;
    int? parsedId;
    if (rawId is int) {
      parsedId = rawId;
    } else if (rawId != null) {
      parsedId = int.tryParse(rawId.toString());
    }

    return Login(
      code: obj['code'],
      status: obj['status'],
      token: data is Map ? data['token'] : null,
      userID: parsedId,
      userEmail: user != null ? user['email'] : null,
    );
  }
}
