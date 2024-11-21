import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/mitra/payment_type_widget.dart';

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int selectedIndex = -1;
  int selectedVirtualIndex = -1;

  final List<Map<String, String>> eWalletMethods = [
    {'name': 'Dana', 'logo': 'assets/dana.png'},
    {'name': 'GoPay', 'logo': 'assets/gopay.png'},
    {'name': 'E-money', 'logo': 'assets/emoney.png'},
    {'name': 'OVO', 'logo': 'assets/ovo.png'},

  ];

  final List<Map<String, String>> virtualAccountMethods = [
    {'name': 'Mandiri', 'logo': 'assets/mandiri.png'},
    {'name': 'BRI', 'logo': 'assets/bri.png'},
    {'name': 'BNI', 'logo': 'assets/bni.png'},
    {'name': 'BCA', 'logo': 'assets/bca.png'},
  ];

  @override
  Widget build(BuildContext context) {

    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor,
          centerTitle: false,
          flexibleSpace: Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, defaultMargin, defaultMargin, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/icon_panah_kiri.png',
                        width: 8,
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Metode Pembayaran',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget eWalletTitle() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        margin: EdgeInsets.only(top: 5, bottom: 10),
        child: Text(
          'E-Wallet',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: regular,
          ),
        ),
      );
    }

    Widget virtualAccountTitle() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        margin: EdgeInsets.only(top: 38, bottom: 10),
        child: Text(
          'Virtual Account',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: regular,
          ),
        ),
      );
    }

    Widget confirmButton() {
      return Container(
        height: 40,
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 0),
        width: double.infinity,
        child: TextButton(
          onPressed: (selectedIndex == -1 && selectedVirtualIndex == -1)
              ? null
              : () {
            if (selectedIndex != -1) {
              Navigator.pop(context, eWalletMethods[selectedIndex]);
            } else if (selectedVirtualIndex != -1) {
              Navigator.pop(context, virtualAccountMethods[selectedVirtualIndex]);
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: primaryColor,
                width: 1,
              ),
            ),
          ),
          child: Text(
            'KONFIRMASI',
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: bold,
            ),
          ),
        ),
      );
    }

    Widget content() {
      return ListView(
        children: [
          eWalletTitle(),
          ...eWalletMethods.map((paymentMethod) {
            int index = eWalletMethods.indexOf(paymentMethod);
            return PaymentTypeWidget(
              imagePath: paymentMethod['logo']!,
              title: paymentMethod['name']!,
              index: index,
              selectedIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                  selectedVirtualIndex = -1;
                });
              },
            );
          }).toList(),

          virtualAccountTitle(),
          ...virtualAccountMethods.map((paymentMethod) {
            int index = virtualAccountMethods.indexOf(paymentMethod);
            return PaymentTypeWidget(
              imagePath: paymentMethod['logo']!,
              title: paymentMethod['name']!,
              index: index,
              selectedIndex: selectedVirtualIndex,
              onTap: (index) {
                setState(() {
                  selectedVirtualIndex = index;
                  selectedIndex = -1;
                });
              },
            );
          }).toList(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header(),
      bottomNavigationBar: confirmButton(),
      body: content(),
    );
  }
}
