import 'package:flutter/material.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  final TextEditingController _phoneNumberCtr = TextEditingController();
  final TextEditingController _passWordCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Login',
            style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 36,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 16
          ),
          TextFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.grey.shade200)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.grey.shade300)),
                filled: true,
                fillColor: Colors.grey.shade100,
                hintText: 'Nhap so dien thoai'),
            controller: _phoneNumberCtr,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.grey.shade200)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.grey.shade300)),
                filled: true,
                fillColor: Colors.grey.shade100,
                hintText: 'Nhap mat khau'),
            controller: _passWordCtr,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                print('Login');
              },
            ),
          )
        ],
      ),
    );
  }

/*   Function */
  // Future RegisterUser(String mobile, BuildContext context) async {
  //   FirebaseAuth _auth = FirebaseAuth.instance;
  //   _auth.verifyPhoneNumber(
  //       verificationCompleted: (AuthCredential authCredential) {
  //       _auth.signInWithCredential(_cre)
  //       },
  //       verificationFailed: null,
  //       codeSent: null,
  //       codeAutoRetrievalTimeout: null,
  //       phoneNumber: mobile,
  //       timeout: const Duration(seconds: 60)
  //       );
  // }
}
