import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRemoteDatasource {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String> createUserAccount({
    required String email,
    required String password,
    required String name,
  }) async {
     try{
       await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
       await firebaseAuth.currentUser?.updateDisplayName(name);
       return "Account Created Successfully";
     }catch(e){
       return e.toString();
     }
  }

  Future<String> loginUserAccount({
    required String email,
    required String password,
  }) async {
    try{
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Login Success";
    }catch(e){
      return e.toString();
    }
  }
}
