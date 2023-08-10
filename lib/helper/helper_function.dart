import 'package:shared_preferences/shared_preferences.dart';

class HelperFuncton{
static String usserLoggedInkey="LOGGEDINKEY";
static String usserNamekey="USERNAMEKEY";
static String usserEmailkey="USEREMAILKEY";




static Future<bool?>getUserLoggedInStatus() async{
  SharedPreferences sf= await SharedPreferences.getInstance();
  return sf.getBool(usserLoggedInkey);
}
}