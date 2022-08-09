import 'package:flutter/material.dart';
import 'package:management_factory_system/Controller/windows_configuration.dart';
import 'package:management_factory_system/View/Containers/background.dart';
import 'package:management_factory_system/View/Main%20Pages/Essential%20Pages/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordVis = true;
  String catchLoginError = '';
  static List<String?> errorsTexts = List.generate(2, (i) => null);
  static List<TextEditingController> myControllerLogin =
      List.generate(2, (i) => TextEditingController());

  setVisibility() {
    setState(() {
      passwordVis = !passwordVis;
    });
  }

  @override
  void initState() {
    super.initState();
    WindowsConfiguration().exitAction(context);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Background(
          widget: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(80, 7, 32, 34),
            ),
            margin: EdgeInsets.symmetric(vertical: (height / 2) - 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                userNameInput(),
                passwordInput(),
                Text(
                  catchLoginError,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                btn()
              ],
            ),
          ),
        ),
      )),
    );
  }

  Container userNameInput() {
    return Container(
      width: 350,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 169, 225, 228)),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          icon: const Icon(
            Icons.person,
            color: Colors.black,
          ),
          labelText: "User Name",
          hintText: 'Input your User name',
          errorText: errorsTexts[1],
          labelStyle: const TextStyle(color: Colors.black),
          iconColor: Colors.black,
        ),
        keyboardType: TextInputType.name,
        controller: myControllerLogin[0],
      ),
    );
  }

  Container passwordInput() {
    return Container(
      margin: const EdgeInsets.all(20),
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 169, 225, 228)),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            icon: const Icon(
              Icons.lock_rounded,
              color: Colors.black,
            ),
            labelText: "Password",
            hintText: 'Password',
            errorText: errorsTexts[1],
            labelStyle: const TextStyle(color: Colors.black),
            iconColor: Colors.black,
            suffixIcon: IconButton(
                onPressed: setVisibility,
                icon: passwordVis
                    ? const Icon(
                        Icons.visibility,
                        color: Colors.black,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: Colors.black,
                      ))),
        keyboardType: TextInputType.visiblePassword,
        obscureText: passwordVis,
        controller: myControllerLogin[1],
      ),
    );
  }

  void setDefaulted() {
    for (int i = 0; i < 2; i++) {
      myControllerLogin[i].clear();
      errorsTexts[i] = null;
    }
    catchLoginError = '';
  }

  Container btn() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: FloatingActionButton.extended(
        label: const Text('Login'),
        icon: const Icon(Icons.login_rounded),
        backgroundColor: Colors.black12,
        elevation: 0,
        hoverColor: const Color.fromARGB(255, 7, 114, 62),
        onPressed: () {
          if (myControllerLogin[0].text == '' &&
              myControllerLogin[1].text == '') {
            setDefaulted();
            setState(() {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const Home()),
              );
            });
          } else {
            setState(() {
              catchLoginError = 'incorrect username or password';
            });
          }
        },
      ),
    );
  }
}
