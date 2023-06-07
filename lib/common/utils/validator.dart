import 'package:string_validator/string_validator.dart';

class Validator {
  static var youtubeRegex =
      r"^(?:https?:\/\/)?(?:youtu\.be\/|(?:www\.|m\.)?youtube\.com\/(?:watch|v|embed)(?:\.php)?(?:\?.*v=|\/))([a-zA-Z0-9\-_]+)";
  static var vimeoRegex =
      r"^https?:\/\/(?:www\.|player\.)?vimeo.com\/(?:channels\/(?:\w+\/)?|groups\/([^\/]*)\/videos\/|album\/(\d+)\/video\/|video\/|)(\d+)(?:$|\/|\?)";

  bool emailVerification(String value) {
    return value.trim().isEmpty || !isEmail(value);
  }

  bool passwordVerification(String value) {
    RegExp regExp = RegExp(
        r"^.*(?=.{8,})((?=.*[!@#$%^&*()\-_=+{};:,<.>]){1})(?=.*\d)((?=.*[a-z]){1})((?=.*[A-Z]){1}).*$");
    return regExp.hasMatch(value);
  }

  bool emptyFieldVerification(String value) {
    return value.trim().isEmpty;
  }

  bool nullFieldValidation(dynamic value) {
    return value == null;
  }

  bool urlVerification(String value) {
    return value.trim().isEmpty || !isURL(value);
  }

  bool videoUrlVerification(String value) {
    bool isVerified = true;
    if (value.trim().isEmpty || !isURL(value)) {
      isVerified = false;
    }

    if (value.contains("youtu")) {
      RegExp youtubeExp = RegExp(youtubeRegex);

      if (isVerified) isVerified = youtubeExp.hasMatch(value);
    } else if (value.contains("vimeo")) {
      RegExp viemoExp = RegExp(vimeoRegex);

      if (isVerified) isVerified = viemoExp.hasMatch(value);
    } else {
      isVerified = false;
    }

    return isVerified;
  }

  bool compareTwoStrings(String value1, String value2) {
    return value1 == value2;
  }

  bool phoneVerification(String value) {
    return value.trim().isEmpty || value.trim().length != 10;
  }
}
