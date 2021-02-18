import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/utils/helper.dart';
import 'package:appresort/app/views/balance/pages/pago_linea/controller/pago_linea_controller.dart';
import 'package:appresort/app/views/balance/pages/payments/components/oxxo_pay.dart';
import 'package:appresort/app/views/balance/pages/payments/components/credit_card_pay.dart';
import 'package:appresort/app/widgets/UnFocus/un_focus_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PaymentsView extends StatefulWidget {
  static final String routeName = '/payments';
  const PaymentsView({Key key}) : super(key: key);

  @override
  _PaymentsViewState createState() => _PaymentsViewState();
}

class _PaymentsViewState extends State<PaymentsView> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Tab> myTabs = <Tab>[
    Tab(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/credit_card.png',
              width: 90,
            ),
          ],
        ),
      ),
    ),
    Tab(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/oxxo_pay.png',
              width: 90,
            ),
          ],
        ),
      ),
    ),
  ];
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: myTabs.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final c = Get.find<PagoLineaController>().charge;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: UnFocusForm(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              color: Colors.white,
              icon: Icon(Icons.clear),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              "Processo de pago",
              style: TextStyle(color: Colors.white),
            ),
            elevation: 0.0,
            backgroundColor: AppTheme.kPrimaryColor,
          ),
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: double.infinity,
                color: AppTheme.kPrimaryColor,
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        c.concepto,
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        Helper.moneyFormat(c.total),
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        c.fechaCargo,
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                color: AppTheme.kPrimaryColor,
                child: TabBar(
                  unselectedLabelColor: Colors.white,
                  labelColor: Colors.white,
                  tabs: myTabs,
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.white,
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    CreditCardPayment(total: c.total.toDouble()),
                    OxxoPayment(total: c.total.toDouble()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
