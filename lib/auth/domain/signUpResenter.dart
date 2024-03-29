import 'package:ses_sion_1_7/common/utils.dart';

class SignUpPresenter{

  var isValidEmail = true;
  var isValidPassword = true;
  var isValidConfirmPassword = true;

  bool isValid(
      String email,
      String password,
      String confirmPassword
      ){
    isValidEmail = true;
    isValidPassword = true;
    isValidConfirmPassword = true;
    if (!checkEmail(email)){
      isValidEmail = false;
      return false;
    }
    if (password.isEmpty){
      isValidPassword = false;
      return false;
    }
    if (confirmPassword.isEmpty){
      isValidConfirmPassword = false;
      return false;
    }
    return true;
  }
}