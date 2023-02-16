import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController controlUsername = TextEditingController();
  final TextEditingController controlPssword = TextEditingController();
  bool error = false;
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SafeArea(
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                        color: Colors.green),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                   TextFormField(
                     controller: controlUsername,
                     textInputAction: TextInputAction.next,
                     decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(50),
                       ),
                       labelText: 'UserName',
                     ),
                     validator: (value) {
                       if(value!.isEmpty){
                         return 'Username is Required';
                       }
                     },
                   ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controlPssword,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelText: 'PassWord',
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'Password required';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: error,
                  child: const Text(
                    'Ussername or password incorect',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () async {
                    if(formKey.currentState!.validate()){
                      if (controlUsername.text == 'Arshad' &&
                        controlPssword.text == '12345') {
                      var pref = await SharedPreferences.getInstance();
                      pref.setBool('isLogged', true);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    } else {
                      setState(() {
                        error = true;
                      });
                      await Future.delayed(
                       const Duration(seconds: 3),
                      );
                      setState(() {
                        error=false;
                      });
                    }
                    }
                    
                  },
                  child: const Text('login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
