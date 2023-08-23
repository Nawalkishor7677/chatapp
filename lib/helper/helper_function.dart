import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctons{
static String userLoggedInkey="LOGGEDINKEY";
static String userNamekey="USERNAMEKEY";
static String userEmailkey="USEREMAILKEY";




 // saving the data to SF

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInkey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNamekey, userName);
  }

  static Future<bool> saveUserEmailSF(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailkey, userEmail);
  }

 // getting the data to SF

  static Future<bool?>getUserLoggedInStatus() async{
    SharedPreferences sf= await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInkey);
  }

}