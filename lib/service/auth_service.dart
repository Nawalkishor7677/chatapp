import 'package:chatapp_firebase/helper/helper_function.dart';
import 'package:chatapp_firebase/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthService{
  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;

  //  login


  //  register
   Future registerUserWithEmailandPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        // call our database service to update the user data.
       DatabaseService(uid: user.uid).updateUserData(fullName, email, password);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }



  // signout
  Future signOut() async {
    try {
      await HelperFunctons.saveUserLoggedInStatus(false);
      await HelperFunctons.saveUserEmailSF("");
      await HelperFunctons.saveUserNameSF("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}