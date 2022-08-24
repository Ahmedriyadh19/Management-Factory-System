import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';
import 'package:management_factory_system/Controller/colors.dart';
import 'package:month_year_picker/month_year_picker.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({
    Key? key,
    this.option,
    this.appBarTitle,
  }) : super(key: key);
  final int? option;
  final String? appBarTitle;
  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  @override
  void initState() {
    super.initState();
    emptyAllData();
  }

  static String? errorTextHint;
  static bool hasError = false;

  static List<String?> errorsTexts = List.generate(4, (i) => null);
  static List<TextEditingController> myControllerNewProduct =
      List.generate(4, (i) => TextEditingController());
  Widget bodyPage(BuildContext ctx) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Add New Product',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          fieldInput('Product name', 'Input Product Name',
              Icons.crop_square_rounded, 0, ctx),
          fieldInput('Package Number', 'Input Package Pcs',
              Icons.align_horizontal_left_rounded, 1, ctx),
          fieldInput(
              'Price', 'Input The Price', Icons.price_change_rounded, 2, ctx),
          fieldInput('Expire Date', 'Input Expire Date',
              Icons.date_range_rounded, 3, ctx),
          hasError
              ? Text(errorTextHint!, style: const TextStyle(color: Colors.red))
              : Container(),
          const SizedBox(height: 10),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buttonAction('Clear', 0),
                const SizedBox(width: 20),
                buttonAction('Save', 1)
              ],
            ),
          )
        ],
      ),
    );
  }

  ElevatedButton buttonAction(String txt, int op) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyColors.myColor)),
        onPressed: () {
          setState(() {
            if (op == 0) {
              emptyAllData();
            } else {
              emptyDataVisible();
              validity();
            }
          });
        },
        child: Text(txt, style: const TextStyle(color: Colors.black)));
  }

  void emptyDataVisible() {
    for (int i = 0; i < errorsTexts.length; i++) {
      errorsTexts[i] = null;
    }
    errorTextHint = null;
    hasError = false;
  }

  void validity() {
    if (myControllerNewProduct[0].text.isEmpty ||
        myControllerNewProduct[0].text.trim().isEmpty) {
      hasError = true;
      errorsTexts[0] = 'Please at least input Me !';
      errorTextHint = 'Check the input';
    } else {
      showDone(context);
    }
  }

  void emptyAllData() {
    for (int i = 0; i < errorsTexts.length; i++) {
      errorsTexts[i] = null;
      myControllerNewProduct[i].clear();
    }
    errorTextHint = null;
    hasError = false;
  }

  Container fieldInput(String label, String hint, IconData icon, int index,
      BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: MyColors.myColor.withOpacity(0.4)),
      child: TextField(
        readOnly: index == 3 ? true : false,
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
          errorText: errorsTexts[index],
          labelStyle: const TextStyle(color: Colors.black),
          iconColor: Colors.black,
        ),
        keyboardType: TextInputType.name,
        controller: myControllerNewProduct[index],
        onTap: index == 3
            ? () async {
                final DateTime? pickedDate = await showMonthYearPicker(
                  context: context,
                  initialDate: DateTime.now().add(const Duration(days: 730)),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 2555)),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: MyColors.myColor,
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            primary: MyColors.myColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);

                  setState(() {
                    myControllerNewProduct[3].text = formattedDate;
                  });
                } else {
                  setState(() {
                    hint = "Date is not selected";
                  });
                }
              }
            : null,
      ),
    );
  }

  showDone(BuildContext ctx) async {
    return await showDialog(
        context: ctx,
        builder: (ctx) {
          return AlertDialog(
            backgroundColor: MyColors.myColor.withOpacity(0.7),
            title: const Text('Success'),
            content: const Text('Your record has saved successfully'),
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        MyColors.myColor.withOpacity(1))),
                onPressed: () {
                  Navigator.of(ctx).pop();
                  emptyAllData();
                },
                child:
                    const Text('Okay', style: TextStyle(color: Colors.black)),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return widget.option != 0
        ? Background(widget: bodyPage(context)).build()
        : Scaffold(
            appBar:
                CustomizeAppBar().createCustomizeAppBar(widget.appBarTitle!),
            body: Background(widget: bodyPage(context)).build(),
          );
  }
}
