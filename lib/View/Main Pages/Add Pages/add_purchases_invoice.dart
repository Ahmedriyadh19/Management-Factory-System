import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:management_factory_system/Controller/colors.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class AddPurchasesInvoicePage extends StatefulWidget {
  const AddPurchasesInvoicePage({Key? key, this.option, this.appBarTitle}) : super(key: key);

  final int? option;
  final String? appBarTitle;

  @override
  State<AddPurchasesInvoicePage> createState() => _AddPurchasesInvoicePageState();
}

class _AddPurchasesInvoicePageState extends State<AddPurchasesInvoicePage> {
  static String? errorTextHint;
  static String? invoiceTotalError;
  static String? gstError;
  static String? venderError;
  static bool hasError = false;
  bool otherActive = false;
  TextEditingController gstController = TextEditingController();
  TextEditingController invoiceTotalController = TextEditingController();
  TextEditingController venderController = TextEditingController();
  static List<List<TextEditingController>> controllerList = [];
  static List<List<String?>> errorList = [];
  static List<Align> rowHolder = [];
  static List<double> holdTotal = [];
  static int pointer = 0;
  final RegExp mySplit = RegExp(r'RM |,');
  final NumberFormat total = NumberFormat("#,##0.00");
  String dropMenuValue = 'Plumbing';

  List<String> items = [
    'Improper Surface Grading/Drainage',
    'Improper Electrical Wiring',
    'Roof Damage',
    'Heating or cooling system',
    'Poor Overall Maintenance',
    'Structurally Related Problems',
    'Plumbing',
    'Exteriors',
    'Facilities',
    'Improper Surface Grading/Drainage1',
    'Improper Electrical Wiring1',
    'Roof Damage1',
    'Heating or cooling system1',
    'Poor Overall Maintenance1',
    'Structurally Related Problems1',
    'Plumbing1',
    'Exterior1',
    'Facilities1',
    'Improper Surface Grading/Drainage2',
    'Improper Electrical Wiring2',
    'Roof Damage2',
    'Heating or cooling system2',
    'Poor Overall Maintenance2',
    'Structurally Related Problems2',
    'Plumbing2',
    'Exteriors2',
    'Facilities2',
    'Other'
  ];

  @override
  void initState() {
    setDefault();
    super.initState();
  }

  Widget bodyPage() {
    return SizedBox(
      width: 810,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('New Purchases Invoice',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: MyColors.myColorFont)),
            const SizedBox(height: 20),
            listOFVender(),
            const SizedBox(height: 20),
            otherActive ? onActiveFunc() : const SizedBox(height: 20),
            otherActive ? const SizedBox(height: 20) : Container(),
            Center(
                child: Column(
              children: rowHolder,
            )),
            hasError ? Text(errorTextHint!) : Container(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                fieldInput(hint: 'Add GST', label: 'GST', hasGST: true),
                fieldInput(hint: 'Invoice Total', label: 'Invoice Total', hasGST: false),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buttons('Clear All', 0, Icons.delete_forever_rounded),
                const SizedBox(width: 20),
                buttons('Save', 1, Icons.save),
                const SizedBox(width: 20),
                buttons('Add', 2, Icons.add),
              ],
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }

  onActiveFunc() {
    return Container(
      width: 450,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: MyColors.myColorContainer.withOpacity(0.4)),
      child: TextFormField(
        autocorrect: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorText: venderError,
          label: Text(
            'Vender Name',
            style: TextStyle(color: MyColors.myColorFont),
          ),
          hintText: 'Enter Vender Name',
        ),
        keyboardType: TextInputType.name,
        controller: venderController,
      ),
    );
  }

  Theme listOFVender() {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: MyColors.myColorContainer.withOpacity(0.9),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: dropMenuValue,
          items: items.map(buildMenuItem).toList(),
          onChanged: selectedMenuValue,
        ),
      ),
    );
  }

  selectedMenuValue(value) {
    setState(() {
      dropMenuValue = value;
      if (value == 'Other') {
        otherActive = true;
      } else {
        otherActive = false;
      }
    });
  }

  DropdownMenuItem buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );

  void setDefault() {
    setState(() {
      rowHolder.clear();
      errorList.clear();
      controllerList.clear();
      pointer = 0;
      gstError = null;
      gstController.clear();
      invoiceTotalController.clear();
      holdTotal.clear();
      invoiceTotalError = null;
    });
    addRow();
  }

  Future showDone(BuildContext ctx) async {
    return await showDialog(
        context: ctx,
        builder: (ctx) {
          return AlertDialog(
            backgroundColor: MyColors.myColorContainer.withOpacity(0.7),
            title: const Text('Success'),
            content: const Text('Your record has saved successfully'),
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(MyColors.myColorContainer.withOpacity(1))),
                onPressed: () {
                  Navigator.of(ctx).pop();
                  setDefault();
                },
                child: Text('Okay', style: TextStyle(color: MyColors.myColorFont)),
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

  ElevatedButton buttons(String txt, int op, IconData? icon) {
    return ElevatedButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(MyColors.myColorContainer.withOpacity(1))),
      child: SizedBox(
        width: 100,
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: MyColors.myColorIcon,
            ),
            const SizedBox(width: 10),
            Text(txt, style: TextStyle(color: MyColors.myColorFont)),
          ],
        ),
      ),
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
            Text('${indexes + 1}', style: TextStyle(color: MyColors.myColorFont)),
            fieldInput(hint: 'Name', index: 0, label: 'Item Name', option: indexes),
            fieldInput(hint: 'Quantity', index: 1, label: 'Item Quantity', option: indexes),
            fieldInput(hint: 'Price', index: 2, label: 'Item Price', option: indexes),
            fieldInput(hint: 'Total', label: 'Item Total', index: 3, option: indexes),
            const SizedBox(width: 20),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyColors.myColorContainer)),
              child: Icon(
                Icons.delete_forever_rounded,
                color: MyColors.myColorIcon,
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

      if (index < holdTotal.length && holdTotal.isNotEmpty) {
        holdTotal.removeAt(index);
      }

      if (holdTotal.isEmpty) {
        invoiceTotalController.clear();
      }

      getTotalInvoice();
    });
  }

  bool validRow(int where) {
    bool rowError = true, hasNoCountError = true;
    double q, p, price;
    String priceString;
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
          }
        }

        if (controllerList[where][1].text.isNotEmpty && controllerList[where][2].text.isNotEmpty) {
          q = double.parse(controllerList[where][1].text.split(',').join());
          p = double.parse(controllerList[where][2].text.split(mySplit).join());

          if (q <= 0) {
            errorList[where][1] = 'Please input valid data';
            deleteRowWithKeep(where);
            hasNoCountError = false;
            rowError = false;
          }
          if (p <= 0) {
            errorList[where][2] = 'Please input valid data';
            deleteRowWithKeep(where);
            rowError = false;
            hasNoCountError = false;
          }

          if (hasNoCountError) {
            price = (q * p);
            if (holdTotal.length < rowHolder.length) {
              holdTotal.add(price);
            }

            priceString = price.toStringAsFixed(3);
            controllerList[where].last.text = 'RM ${total.format(double.parse(priceString))}';
          }
        }
      });
      getTotalInvoice();
    }

    return rowError;
  }

  void getTotalInvoice() {
    double g = 0, totalAll = 0;
    String totalAllString;
    setState(() {
      if (gstController.text.isNotEmpty) {
        g = double.parse(gstController.text.split(mySplit).join());
      }
      totalAll += g;
      if (holdTotal.isNotEmpty) {
        for (int i = 0; i < holdTotal.length; i++) {
          totalAll += holdTotal[i];
        }
        totalAllString = totalAll.toStringAsFixed(2);
        invoiceTotalController.text = 'RM ${total.format(double.parse(totalAllString))}';
      }
    });
  }

  Container fieldInput({String? label, String? hint, int? index, int? option, bool? hasGST}) {
    return Container(
      width: index == 0 ? 250 : 130,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: MyColors.myColorContainer.withOpacity(0.4)),
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
              : hasGST != null && hasGST
                  ? gstError
                  : invoiceTotalError,
          labelStyle: TextStyle(color: MyColors.myColorFont),
          iconColor: MyColors.myColorIcon,
        ),
        readOnly: ((index != null && index == 3) || (hasGST != null && !hasGST)) ? true : false,
        inputFormatters: index == 0
            ? null
            : <TextInputFormatter>[
                index == 1
                    ? CurrencyTextInputFormatter(symbol: '')
                    : CurrencyTextInputFormatter(symbol: 'RM ')
              ],
        keyboardType: index == 0 ? TextInputType.name : TextInputType.number,
        controller: (option != null && index != null)
            ? controllerList[option][index]
            : (hasGST != null && hasGST)
                ? gstController
                : invoiceTotalController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.option != 0
        ? Background(widget: bodyPage()).build()
        : Scaffold(
            appBar: CustomizeAppBar().createCustomizeAppBar(widget.appBarTitle!),
            body: Background(widget: bodyPage()).build(),
          );
  }
}
