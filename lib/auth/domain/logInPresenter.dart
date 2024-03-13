import '../../common/utils.dart';

class SignUpPresenter{

  var isValidEmail = true;
  var isValidPassword = true;

  bool isValid(
      String email,
      String password,
      String confirmPassword
      ){
    isValidEmail = true;
    isValidPassword = true;
    if (!checkEmail(email)){
      isValidEmail = false;
      return false;
    }
    if (password.isEmpty){
      isValidPassword = false;
      return false;
    }
    return true;
  }
}