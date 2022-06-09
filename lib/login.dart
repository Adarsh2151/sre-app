import 'package:e_comm/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

// ignore: must_be_immutable
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String your_email = "";
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  void sendOtp() async {
    try {
      ConfirmationResult confirmationResult =
          await firebaseAuth.signInWithPhoneNumber("+91 7091 568 357");
      UserCredential userCredential =
          await confirmationResult.confirm('123456');
      print(confirmationResult);
      print(userCredential.credential);

      // await firebaseAuth.verifyPhoneNumber(
      //   phoneNumber: '+91 7091 568 357',
      //   verificationCompleted: (PhoneAuthCredential credential) {},
      //   verificationFailed: (FirebaseAuthException e) {},
      //   codeSent: (String verificationId, int? resendToken) {},
      //   codeAutoRetrievalTimeout: (String verificationId) {},
      // );
    } catch (e) {
      print(e);
    }
  }

  void signup() async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: your_email, password: "123456789");
    } catch (e) {
      print(e);
    }
  }

  String hu = "";
  String number = "";
  String page = "phone no.";
  String notpage = "email";
  int code = 12;

  bool disabled = true;
  bool enable = true;

  double myHeight(BuildContext context, int percent) {
    var screenSize = MediaQuery.of(context).size;

    return (screenSize.height) * percent / 100;
  }

  double myWidth(BuildContext context, int percent) {
    var screenSize = MediaQuery.of(context).size;
    return (screenSize.width) * percent / 100;
  }

  double myRatio(BuildContext context, int percent) {
    var screenSize = MediaQuery.of(context).size;

    return (screenSize.width) * (screenSize.height) * percent / 100000;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Home()));
          },
        ),
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
          Text(
            "Sreinter",
            style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontFamily: "Libre_Baskerville"),
          ),
          SizedBox(width: 30, child: Image(image: AssetImage("img/logo.png")))
        ]),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(myRatio(context, 5)),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Log in for the best experiance ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                  child: Text(
                    "Enter your phone to continue ",
                    style: TextStyle(
                      fontFamily: "Akshar",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: myHeight(context, 4)),
                  child: Stack(
                    alignment: const Alignment(-0.85, -0.45),
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(),
                      //   child:
                      //       Container(height: 50, width: 250, child: TextField()),
                      // ),

                      Container(
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                        height: myHeight(context, 7),
                        width: myWidth(context, 60),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.blue, width: 2.0)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: myWidth(context, code),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "+91",
                                    style: TextStyle(
                                        fontSize: myHeight(context, 3)),
                                  )),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: myHeight(context, 1)),
                              child: SizedBox(
                                width: myWidth(context, 25),
                                child: TextField(
                                    keyboardType: TextInputType.phone,
                                    cursorHeight: 25.0,
                                    maxLength: 10,
                                    onChanged: (value) {
                                      setState(() {
                                        if (value.length == 10) {
                                          disabled = false;
                                        } else {
                                          disabled = true;
                                        }
                                      });
                                    },
                                    decoration: const InputDecoration(
                                        counterText: "",
                                        border: InputBorder.none)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "  Phone no.",
                        style: TextStyle(
                            backgroundColor: Colors.white,
                            color: Colors.blue[900]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: myWidth(context, 45), top: myHeight(context, 2)),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text("Use Email",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold))),
                ),
                Container(
                  margin: EdgeInsets.only(top: myHeight(context, 8)),
                  // margin: EdgeInsets.only(bottom: myHeight(context, 20)),
                  height: myHeight(context, 7),
                  width: myWidth(context, 85),
                  child: ElevatedButton(
                    onPressed: disabled
                        ? null
                        : () {
                            sendOtp();
                            _LoginState().hu = "78485";
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const EnterOtp()));
                          },
                    child: const Text("Continue"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// this kind

class EnterOtp extends StatefulWidget {
  const EnterOtp({Key? key}) : super(key: key);

  @override
  State<EnterOtp> createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enter Otp")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PinCodeTextField(
            appContext: context,
            blinkDuration: const Duration(milliseconds: 1000),
            length: 4,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: Colors.white,
            ),
            enableActiveFill: true,
            onCompleted: (object) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
            onChanged: (object) {},
          ),
          SizedBox(
            width: 400,
            height: 50,
            child: ElevatedButton(
              child: const Text("Validate"),
              onPressed: () {},
            ),
          )
        ],
      )),
    );
  }
}


// class EmailLogin extends StatefulWidget {
//   const EmailLogin({Key? key}) : super(key: key);

//   @override
//   State<EmailLogin> createState() => _EmailLoginState();
// }

// class _EmailLoginState extends State<EmailLogin> {
//   String number = "";

//   bool disabled = true;
//   bool enable = true;

//   double myHeight(BuildContext context, int percent) {
//     var screen_size = MediaQuery.of(context).size;

//     return (screen_size.height) * percent / 100;
//   }

//   double myWidth(BuildContext context, int percent) {
//     var screen_size = MediaQuery.of(context).size;
//     // print(screen_size.width);
//     // print(screen_size.height);
//     return (screen_size.width) * percent / 100;
//   }

//   double myRatio(BuildContext context, int percent) {
//     var screen_size = MediaQuery.of(context).size;

//     return (screen_size.width) * (screen_size.height) * percent / 100000;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.close),
//           onPressed: () {},
//         ),
//         title:
//             Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
//           Text(
//             "Sreinter",
//             style: TextStyle(
//                 fontSize: 24,
//                 fontStyle: FontStyle.italic,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: "Libre_Baskerville"),
//           ),
//           SizedBox(width: 30, child: Image(image: AssetImage("img/logo.png")))
//         ]),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(myRatio(context, 5)),
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Log in for the best experiance ",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.fromLTRB(0, 8.0, 0, 0),
//                   child: Text(
//                     "Enter your phone number to continue ",
//                     style: TextStyle(
//                       fontFamily: "Akshar",
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: myHeight(context, 4)),
//                   child: Stack(
//                     alignment: const Alignment(-0.85, -0.45),
//                     children: [
//                       // Padding(
//                       //   padding: const EdgeInsets.fromLTRB(),
//                       //   child:
//                       //       Container(height: 50, width: 250, child: TextField()),
//                       // ),

//                       Container(
//                         padding: const EdgeInsets.all(10.0),
//                         margin: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
//                         height: myHeight(context, 7),
//                         width: myWidth(context, 60),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5.0),
//                             border: Border.all(color: Colors.blue, width: 2.0)),
//                         child: Row(
//                           children: [
//                             TextButton(
//                                 onPressed: () {},
//                                 child: Text(
//                                   "+91",
//                                   style:
//                                       TextStyle(fontSize: myHeight(context, 3)),
//                                 )),
//                             Padding(
//                               padding:
//                                   EdgeInsets.only(bottom: myHeight(context, 1)),
//                               child: SizedBox(
//                                 width: myWidth(context, 25),
//                                 child: TextField(
//                                     keyboardType: TextInputType.number,
//                                     cursorHeight: 25.0,
//                                     maxLength: 10,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         if (value.length == 10) {
//                                           disabled = false;
//                                         } else {
//                                           disabled = true;
//                                         }
//                                         print(value);
//                                       });
//                                     },
//                                     decoration: InputDecoration(
//                                         counterText: "",
//                                         border: InputBorder.none)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Text(
//                         "  phone no.  ",
//                         style: TextStyle(
//                             backgroundColor: Colors.white,
//                             color: Colors.blue[900]),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: myWidth(context, 45), top: myHeight(context, 2)),
//                   child: TextButton(
//                       onPressed: () {},
//                       child: const Text("Use Email-ID",
//                           style: TextStyle(
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold))),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: myHeight(context, 8)),
//                   // margin: EdgeInsets.only(bottom: myHeight(context, 20)),
//                   height: myHeight(context, 7),
//                   width: myWidth(context, 85),
//                   child: ElevatedButton(
//                     onPressed: disabled ? null : () {},
//                     child: const Text("Continue"),
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
