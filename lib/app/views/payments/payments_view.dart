import 'package:appresort/app/data/models/charges_model.dart';
import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/utils/helper.dart';
import 'package:appresort/app/views/payments/components/oxxo_pay.dart';
import 'package:appresort/app/views/payments/components/credit_card_pay.dart';
import 'package:appresort/app/widgets/UnFocus/un_focus_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentsView extends StatefulWidget {
  static final String routeName = '/payments';
  final ChargesModel charge;
  const PaymentsView({
    Key key,
    @required this.charge,
  }) : super(key: key);

  @override
  _PaymentsViewState createState() => _PaymentsViewState();
}

class _PaymentsViewState extends State<PaymentsView> with SingleTickerProviderStateMixin {
  final user = GetStorages.i.user;

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: UnFocusForm(
        child: Scaffold(
          resizeToAvoidBottomPadding: true,
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
                        widget.charge.concepto ?? '',
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
                        Helper.moneyFormat(widget.charge.total ?? 0),
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
                        widget.charge.fechaCargo ?? DateTime.now().toString(),
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
                    CreditCardPayment(
                      total: widget.charge.total,
                      charge: int.parse(widget.charge.id),
                      unidad: int.parse(widget.charge.idUnidad),
                      concepto: int.parse(widget.charge.idTipoConcepto),
                      propietario: int.parse(user.idpropietario),
                    ),
                    OxxoPayment(
                      total: widget.charge.total,
                      charge: int.parse(widget.charge.id),
                      unidad: int.parse(widget.charge.idUnidad),
                      concepto: int.parse(widget.charge.idTipoConcepto),
                      propietario: int.parse(user.idpropietario),
                    ),
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
