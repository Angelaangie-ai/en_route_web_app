import 'package:enroute/components/point_orders_list.dart';
import 'package:enroute/components/point_text_Styles.dart';
import 'package:enroute/components/point_top_app_bar.dart';
import 'package:enroute/components/point_orange_button.dart';
import 'package:enroute/components/point_header_text.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  // List of orders
  final ordersList = OrdersList();

  @override
  Widget build(BuildContext context) {
    final String ordersText = 'Your orders';
    final String checkoutButtonText = 'checkout';

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Container(
        // The background color is slightly different from home screen
        color: Theme.of(context).primaryColorLight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTopAppBar(isCart: true),
              HeaderText(
                text: ordersText,
                isCart: true,
              ),
              SizedBox(height: 40),
              ordersList,
              SizedBox(height: 30),
              _totalPrice(),
              SizedBox(height: 20),
              GradientOrangeButton(title: checkoutButtonText),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Row _totalPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Total',
          style: kTotalLabelTextStyle,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          '11 points',
          style: kTotalPriceValueTextStyle,
        ),
      ],
    );
  }
}
