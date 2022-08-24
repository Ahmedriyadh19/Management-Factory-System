import 'package:flutter/material.dart';
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

  static List<dynamic> invoiceInfo = [];
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
      invoiceInfo.clear();
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
            showDone(context);
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
    setState(() {
      invoiceInfo.add([
        [null, null, null, null],
        [
          TextEditingController(),
          TextEditingController(),
          TextEditingController(),
          TextEditingController()
        ]
      ]);
      rowHolder.add(invoiceBuildOneItem(pointer++));
    });
  }

  void deleteRow(int index) {
    setState(() {
      invoiceInfo.removeAt(index);
      rowHolder.clear();
      pointer--;
      for (int i = 0; i < pointer; i++) {
        rowHolder.add(invoiceBuildOneItem(i));
      }
    });
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
          errorText: option != null ? invoiceInfo[option][0][index] : gstError,
          labelStyle: const TextStyle(color: Colors.black),
          iconColor: Colors.black,
        ),
        keyboardType: TextInputType.name,
        controller:
            option != null ? invoiceInfo[option][1][index] : gstController,
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
