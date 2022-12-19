import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<String> singUp(String e1, String p1) async {
  try {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    await firebaseAuth.createUserWithEmailAndPassword(email: e1, password: p1);
    return "Success";
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('Password at list 6 char');
      return "Password at list 6 char";
    } else if (e.code == 'email-already-in-use') {
      print("Email already Exits");
      return "Email already Exist";
    }
  }
  return "";
}

Future<String> loginemailpassword(String email, String password) async {
  try {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return "Success";
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      return "No user found for that email.";
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      return "Wrong password provider for that user.";
    }
  }
  return "";
}

bool checkUser() {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return true;
  }
  return false;
}

void logout() {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  firebaseAuth.signOut();
}

Future<bool> googleLogin() async {
  GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
  GoogleSignInAuthentication? googleSignInAuthentication =
      await googleSignInAccount?.authentication;
  var cred = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication!.accessToken,
      idToken: googleSignInAuthentication.idToken);
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  await firebaseAuth.signInWithCredential(cred);

  return checkUser();
}

Future<List<String?>> userprofile() async {
  User? user = await FirebaseAuth.instance.currentUser;
  return [
    user!.email,
    user.displayName,
    user.photoURL,
  ];
}

// void insertdata(String id, String name, String mobile, String std) {
//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//   CollectionReference collectionReference =
//       firebaseFirestore.collection("Student");
//
//   collectionReference
//       .add({
//         "id": "$id",
//         "name": "$name",
//         "mobile": "$mobile",
//         "std": "$std",
//       })
//       .then((value) => print("success"))
//       .catchError((error) => print("Error $error"));
// }

void voteinsertdata(String id, String vote) {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference collectionReference =
      firebaseFirestore.collection("Votelist");
  collectionReference
      .add({"id": "$id", "vote": "$vote"}).then((value) => print("success")).catchError((error) => print("Error $error"));
}

// Stream<QuerySnapshot<Map<String, dynamic>>> readdata() {
//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//   return firebaseFirestore.collection("Student").snapshots();
// }
//
// void deleteData(String key) {
//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//   firebaseFirestore.collection("Student").doc("$key").delete();
// }
//
// void updateData(String key, String id, String name, String mobile, String std) {
//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//   firebaseFirestore.collection("Student").doc("$key").set({
//     "id": "$id",
//     "name": "$name",
//     "mobile": "$mobile",
//     "std": "$std",
//   });
// }
