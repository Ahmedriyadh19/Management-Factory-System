import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:management_factory_system/Controller/colors.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class AddPurchasesInvoicePage extends StatefulWidget {
  const AddPurchasesInvoicePage({Key? key, this.option, this.appBarTitle})
      : super(key: key);

  final int? option;
  final String? appBarTitle;

  @override
  State<AddPurchasesInvoicePage> createState() =>
      _AddPurchasesInvoicePageState();
}

class _AddPurchasesInvoicePageState extends State<AddPurchasesInvoicePage> {
  static String? errorTextHint;
  static bool hasError = false;
  static String? gstError;
  TextEditingController gstController = TextEditingController();
  static List<List<TextEditingController>> controllerList = [];
  static List<List<String?>> errorList = [];
  static List<Align> rowHolder = [];
  static int pointer = 0;

  @override
  void initState() {
    addRow();
    super.initState();
  }

  Widget bodyPage() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Center(
              child: Column(
            children: rowHolder,
          )),
          hasError ? Text(errorTextHint!) : Container(),
          const SizedBox(height: 10),
          rowHolder.isNotEmpty
              ? fieldInput(hint: 'Add GST', label: 'GST')
              : Container(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttons('Clear All', 0),
              const SizedBox(width: 20),
              buttons('Save', 1),
              const SizedBox(width: 20),
              buttons('Add', 2),
            ],
          ),
          const SizedBox(height: 50)
        ],
      ),
    );
  }

  void setDefault() {
    setState(() {
      rowHolder.clear();
      errorList.clear();
      controllerList.clear();
      pointer = 0;
      gstError = null;
      gstController.clear();
    });
    addRow();
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
                  setDefault();
                },
                child:
                    const Text('Okay', style: TextStyle(color: Colors.black)),
              )
            ],
          );
        });
  }

  void validationAll() {
    int numberOfError = 0;
    for (var i = 0; i < rowHolder.length; i++) {
      if (!validRow(i)) {
        numberOfError++;
      }
    }
    if (numberOfError == 0) {
      showDone(context);
    }
  }

  ElevatedButton buttons(String txt, int op) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(MyColors.myColor.withOpacity(1))),
      child: Text(txt, style: const TextStyle(color: Colors.black)),
      onPressed: () {
        setState(() {
          if (op == 0) {
            setDefault();
          } else if (op == 1) {
            validationAll();
          } else {
            addRow();
          }
        });
      },
    );
  }

  Align invoiceBuildOneItem(int indexes) {
    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Text('${indexes + 1}'),
            fieldInput(
                hint: 'Name', index: 0, label: 'Item Name', option: indexes),
            fieldInput(
                hint: 'Quantity',
                index: 1,
                label: 'Item Quantity',
                option: indexes),
            fieldInput(
                hint: 'Price', index: 2, label: 'Item Price', option: indexes),
            fieldInput(
                hint: 'Total', index: 3, label: 'Item Total', option: indexes),
            const SizedBox(width: 20),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(MyColors.myColor)),
              child: const Icon(
                Icons.delete_forever_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                deleteRow(indexes);
              },
            ),
          ],
        ),
      ),
    );
  }

  void addRow() {
    if (validRow(pointer - 1)) {
      setState(() {
        errorList.add([null, null, null, null]);
        controllerList.add([
          TextEditingController(),
          TextEditingController(),
          TextEditingController(),
          TextEditingController()
        ]);
        rowHolder.add(invoiceBuildOneItem(pointer++));
      });
    }
  }

  void deleteRowWithKeep(int index) {
    setState(() {
      rowHolder.removeAt(index);
      rowHolder.insert(index, invoiceBuildOneItem(index));
    });
  }

  void deleteRow(int index) {
    setState(() {
      errorList.removeAt(index);
      controllerList.removeAt(index);
      rowHolder.clear();
      pointer--;
      for (int i = 0; i < pointer; i++) {
        rowHolder.add(invoiceBuildOneItem(i));
      }

      if (rowHolder.isEmpty) {
        addRow();
      }
    });
  }

  bool validRow(int where) {
    final NumberFormat total = NumberFormat("#,##0.00", "en_US");
    bool rowError = true;
    int q;
    double p;
    String price;
    if (rowHolder.isNotEmpty) {
      setState(() {
        for (int i = 0; i < controllerList[where].length; i++) {
          if (controllerList[where][i].text.isEmpty && i != 3) {
            errorList[where][i] = 'Please input data';
            deleteRowWithKeep(where);
            rowError = false;
          } else if (controllerList[where][i].text.isNotEmpty) {
            errorList[where][i] = null;
            deleteRowWithKeep(where);
          } else if (controllerList[where][1].text.isNotEmpty &&
              controllerList[where][2].text.isNotEmpty) {
            q = int.parse(controllerList[where][1].text.split(',').join());
            p = double.parse(
                controllerList[where][2].text.split(RegExp(r'RM |,')).join());
            if (q <= 0) {
              errorList[where][1] = 'Please input valid data';
              deleteRowWithKeep(where);
              rowError = false;
            }
            if (p <= 0) {
              errorList[where][2] = 'Please input valid data';
              deleteRowWithKeep(where);
              rowError = false;
            }
            if (rowError) {
              price = (q * p).toStringAsFixed(2);
              controllerList[where].last.text =
                  'RM ${total.format(double.parse(price))}';
            }
          }
        }
      });
    }

    return rowError;
  }

  Container fieldInput({String? label, String? hint, int? index, int? option}) {
    return Container(
      width: index == 0 ? 250 : 130,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyColors.myColor.withOpacity(0.4)),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          labelText: label,
          hintText: hint,
          errorText: option != null && index != null
              ? errorList[option][index]
              : gstError,
          labelStyle: const TextStyle(color: Colors.black),
          iconColor: Colors.black,
        ),
        inputFormatters: index == 0
            ? null
            : <TextInputFormatter>[
                index == 1
                    ? CurrencyTextInputFormatter(symbol: '', decimalDigits: 0)
                    : CurrencyTextInputFormatter(symbol: 'RM ')
              ],
        keyboardType: index == 0 ? TextInputType.name : TextInputType.number,
        controller: option != null && index != null
            ? controllerList[option][index]
            : gstController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.option != 0
        ? Background(widget: bodyPage()).build()
        : Scaffold(
            appBar:
                CustomizeAppBar().createCustomizeAppBar(widget.appBarTitle!),
            body: Background(widget: bodyPage()).build(),
          );
  }
}
