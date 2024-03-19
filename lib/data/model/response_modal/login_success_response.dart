class LoginSuccessResponse {
  LoginSuccessResponse({
    this.accessToken,
    this.refreshToken,
  });

  factory LoginSuccessResponse.fromJson(Map<String, dynamic> json) =>
      LoginSuccessResponse(
        accessToken: json['access_token'] == null
            ? null
            : json['access_token'] as String,
        refreshToken: json['refresh_token'] == null
            ? null
            : json['refresh_token'] as String,
      );
  String? accessToken;
  String? refreshToken;
}
