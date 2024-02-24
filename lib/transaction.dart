import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'text_box_widgets/textfield.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  String? selctedItem;
  String? selctedItemi;
  final TextEditingController expalin = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController amountMoney = TextEditingController();
  final TextEditingController accouuntNo = TextEditingController();
  FocusNode amount_ = FocusNode();
  FocusNode account = FocusNode();
  FocusNode passw = FocusNode();
  FocusNode ex = FocusNode();
  // ignore: non_constant_identifier_names
  final TextEditingController password = TextEditingController();

  bool _isHidden = true;
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  final List<String> _itemei = [
    "تومان",
    'دالر',
    'افغانی',
    "کالدار",
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ex.addListener(() {
      setState(() {});
    });
    amount_.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.blue,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: Container(
            color: Colors.blue,
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth: MediaQuery.of(context).size.width),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.list,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Implement share functionality here
                        },
                      ),
                      const Text(
                        'ارسال پول',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      IconButton(
                        icon: const Icon(
                          CupertinoIcons.qrcode_viewfinder,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Implement share functionality here
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(30.0, 120.0, 30.0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            myTextField(
                                "شماره حساب", TextInputType.number, accouuntNo),
                            myTextField(
                                "مقدار", TextInputType.number, amountMoney),
                            unite(),
                            myTextField("توصیحات", TextInputType.text, expalin),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                myButton(
                                    "ارسال", 50, 120, Colors.white, Colors.blue,
                                    () {
                                  openDialogPassword(context);
                                }),
                                myButton("انصراف", 50, 120, Colors.white,
                                    Colors.redAccent, () {
                                  accouuntNo.clear();
                                  amountMoney.clear();
                                  expalin.clear();

                                  //Navigator.of(context).pop();
                                })
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding unite() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 249, 253, 252),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: Colors.blue,
          ),
        ),
        child: DropdownButton<String>(
          onChanged: ((value) {
            setState(() {
              selctedItemi = value!;
            });
          }),
          value: selctedItemi,
          items: _itemei
              .map((e) => DropdownMenuItem(
                    // ignore: sort_child_properties_last
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Text(
                              e,
                              style: const TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                    value: e,
                  ))
              .toList(),
          selectedItemBuilder: (BuildContext context) => _itemei
              .map((e) => Row(
                    children: [Text(e)],
                  ))
              .toList(),
          hint: Text(
            'واحد',
            style: TextStyle(color: Colors.grey.shade500),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }

  void openDialog(BuildContext context) {
    DateTime now = DateTime.now();

    String formattedTime =
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
    String formattedDate =
        '${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
    String formattedDateTime = '$formattedDate   $formattedTime';
    showDialog(
      context: context,
      builder: (ctx) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 30,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "مؤفق",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
              ),
            ],
          ),
          titleTextStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Align(
                    alignment: Alignment.center,
                    child: myRichText('زمان: ', formattedDateTime)),
                const Divider(
                  indent: 30,
                  endIndent: 30,
                ),
                const SizedBox(
                  height: 4,
                ),
                myRichText('کد پیگیری: ', "4576584"),
                myRichText('مبلغ: ', "${amountMoney.text} $selctedItemi"),
                myRichText("به نام: ", "علی احمد کریمی "),
                myRichText('شماره حساب: ', accouuntNo.text),
                const SizedBox(
                  height: 4,
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.share,
                        color: Colors.green[600],
                      ),
                      onPressed: () {
                        // Implement share functionality here
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.save,
                        color: Colors.green[600],
                      ),
                      onPressed: () {
                        // Implement share functionality here
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // ignore: non_constant_identifier_names
  }

  void openDialogPassword(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          backgroundColor: Colors.white,
          title: const Column(
            children: [
              Text(
                "تایید ارسال پول",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 1,
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                myButton("ارسال", 50, 120, Colors.white, Colors.blue, () {
                  openDialog(context);
                }),
                myButton("انصراف", 50, 120, Colors.white, Colors.redAccent, () {
                  password.clear();
                  Navigator.of(context).pop();
                })
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                myRichText('مبلغ: ', "${amountMoney.text} $selctedItemi"),
                myRichText("علی احمد کریمی ", ""),
                myRichText('شماره حساب: ', accouuntNo.text),
                const SizedBox(
                  height: 10,
                ),
                myPassword_textField_with_Icon(
                    "رمز", password, _isHidden, () {}),

                // _password1(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
