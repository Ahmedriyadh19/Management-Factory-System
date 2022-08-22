import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:management_factory_system/Controller/windows_configuration.dart';
import 'package:management_factory_system/Database/database_helper.dart';
import 'package:management_factory_system/View/Containers/background.dart';
import 'package:management_factory_system/Controller/colors.dart';
import 'package:management_factory_system/View/Main%20Pages/Essential%20Pages/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isDatabaseConnected = DatabaseHelper.isDatabaseEx;
  bool passwordVis = true;
  bool hasTargetPath = false;
  bool hasError = false;
  static double heightCont = 300;
  static String? targetPath;
  static String? catchLoginError;
  static List<PopupMenuItem> optionDatabase = [];
  static List<String?> errorsTexts = List.generate(2, (i) => null);
  static List<TextEditingController> myControllerLogin =
      List.generate(2, (i) => TextEditingController());

  initializeOptionsDatabaseMenuList() {
    optionDatabase.clear();
    optionDatabase
        .add(createOption(FontAwesomeIcons.folderPlus, 'New Database file', 0));
    optionDatabase
        .add(createOption(FontAwesomeIcons.link, 'Link your Database', 1));
  }

  setVisibility() {
    setState(() {
      passwordVis = !passwordVis;
    });
  }

  @override
  void initState() {
    super.initState();
    WindowsConfiguration().exitAction(context);
    initializeOptionsDatabaseMenuList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Background(widget: loginBuild(height)).build(),
    );
  }

  loginBuild(double height) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: 405,
          height: heightCont,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: MyColors.myColor.withOpacity(0.4),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              inputBorder(
                inputField(
                    editingController: myControllerLogin[0],
                    errorText: errorsTexts[0],
                    hint: 'Input User name',
                    isPassword: false,
                    label: 'User Name',
                    icon: Icons.person),
              ),
              inputBorder(inputField(
                  editingController: myControllerLogin[1],
                  errorText: errorsTexts[1],
                  hint: 'Input Password',
                  isPassword: true,
                  label: 'Password',
                  icon: Icons.lock_rounded)),
              hasError
                  ? Center(
                      child: Text(
                        catchLoginError!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(children: [
                  const SizedBox(
                    width: 135,
                    child: Text(''),
                  ),
                  SizedBox(width: 135, child: btn()),
                  SizedBox(
                      width: 135,
                      child: option(FontAwesomeIcons.database, optionDatabase,
                          'Select File'))
                ]),
              ),
              hasTargetPath
                  ? Container(
                      margin: const EdgeInsets.all(15),
                      child: Text(targetPath!))
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  Container inputBorder(Widget w) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: MyColors.myColor.withOpacity(0.4)),
      child: w,
    );
  }

  TextField inputField(
      {required IconData icon,
      required String label,
      required String hint,
      String? errorText,
      required bool isPassword,
      required TextEditingController editingController}) {
    return TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          icon: Icon(
            icon,
            color: Colors.black,
          ),
          labelText: label,
          hintText: hint,
          errorText: errorText,
          labelStyle: const TextStyle(color: Colors.black),
          iconColor: Colors.black,
          suffixIcon: isPassword ? hidePassword() : null),
      keyboardType: isPassword
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      obscureText: isPassword ? passwordVis : false,
      controller: editingController,
    );
  }

  IconButton hidePassword() {
    return IconButton(
        onPressed: setVisibility,
        icon: passwordVis
            ? const Icon(
                Icons.visibility,
                color: Colors.black,
              )
            : const Icon(
                Icons.visibility_off,
                color: Colors.black,
              ));
  }

  void setDefaulted() {
    for (int i = 0; i < 2; i++) {
      myControllerLogin[i].clear();
      errorsTexts[i] = null;
    }
    catchLoginError = null;
    hasError = false;
  }

  FloatingActionButton btn() {
    return FloatingActionButton.extended(
      label: const Text(''),
      icon: const Icon(FontAwesomeIcons.personWalkingArrowRight),
      backgroundColor: Colors.black12,
      elevation: 0,
      hoverColor: const Color.fromARGB(255, 7, 114, 62),
      onPressed: () {
        if ((myControllerLogin[0].text == '' &&
                myControllerLogin[1].text == '') ||
            isDatabaseConnected) {
          setState(() {
            hasTargetPath = false;
            targetPath = null;
            heightCont = 300;
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const Home()),
            );
          });
          setDefaulted();
        } else {
          setState(() {
            hasError = true;
            if (!isDatabaseConnected) {
              catchLoginError = 'Please select your database File';
            } else {
              catchLoginError = 'incorrect username or password';
            }
          });
        }
      },
    );
  }

  PopupMenuButton option(
      IconData icon, List<PopupMenuEntry> optionsList, String tooltips) {
    return PopupMenuButton(
      color: MyColors.myColor.withOpacity(0.8),
      tooltip: tooltips,
      icon: Icon(icon),
      itemBuilder: ((ctx) => optionsList),
      onSelected: (value) {
        getOptionPick(value);
      },
    );
  }

  void getOptionPick(int op) async {
    if (op == 0) {
      String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

      if (selectedDirectory != null) {
        setState(() {
          hasTargetPath = true;
          heightCont = 370;
          targetPath = selectedDirectory;
          isDatabaseConnected = true;
        });
      }
    } else {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        setState(() {
          hasTargetPath = true;
          heightCont = 370;
          targetPath = result.files.single.path;
          isDatabaseConnected = true;
        });
      }
    }
  }

  PopupMenuItem createOption(IconData icon, String label, int option) {
    return PopupMenuItem(
      value: option,
      child: ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(
            label,
            style: const TextStyle(color: Colors.black),
          )),
    );
  }
}
