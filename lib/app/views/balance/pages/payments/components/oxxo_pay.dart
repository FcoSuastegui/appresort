import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/utils/formatters.dart';
import 'package:appresort/app/utils/helper.dart';
import 'package:appresort/app/views/balance/pages/payments/bloc/oxxo_bloc.dart';
import 'package:appresort/app/widgets/Loading/loading.dart';
import 'package:appresort/app/widgets/TextField/input_text_cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OxxoPayment extends StatelessWidget {
  final double total;
  const OxxoPayment({
    Key key,
    this.total,
  })  : assert(total != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController _pageViewController = PageController(initialPage: 0);
    return BlocProvider(
      create: (context) => OxxoBloc(
        total: total,
        pageViewController: _pageViewController,
      ),
      child: Builder(
        builder: (context) {
          final oxxo = BlocProvider.of<OxxoBloc>(context);
          return FormBlocListener<OxxoBloc, String, String>(
            onSubmitting: (context, state) => LoadingDialog.show(context),
            onSuccess: (context, state) {
              LoadingDialog.hide(context);
              if (state.stepCompleted == state.lastStep) {
                Get.back();
                oxxo.close();
              }
            },
            onFailure: (context, state) async {
              LoadingDialog.hide(context);
              Helper.error(message: state.failureResponse);
            },
            child: _OxxoViewer(
              oxxo: oxxo,
            ),
          );
        },
      ),
    );
  }
}

class _OxxoViewer extends StatefulWidget {
  final OxxoBloc oxxo;

  _OxxoViewer({Key key, @required this.oxxo}) : super(key: key);

  @override
  __OxxoViewerState createState() => __OxxoViewerState();
}

class __OxxoViewerState extends State<_OxxoViewer> {
  OxxoBloc oxxo;

  final deliverySteps = [
    'Datos personal',
    'Exito',
  ];

  @override
  void initState() {
    oxxo = widget.oxxo;
    super.initState();
  }

  @override
  void dispose() {
    oxxo.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: StreamBuilder(
              stream: oxxo,
              builder: (context, snapshot) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  constraints: const BoxConstraints(maxHeight: 890),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: deliverySteps.length,
                    itemBuilder: (BuildContext context, int index) {
                      final step = deliverySteps[index];
                      double indicatorSize = 20.0;
                      LineStyle beforeLineStyle = LineStyle(
                        color: Colors.green,
                      );
                      _DeliveryStatus status;
                      LineStyle afterLineStyle;
                      if (index < oxxo.state.currentStep) {
                        status = _DeliveryStatus.done;
                        indicatorSize = 30;
                      } else if (oxxo.state.isLastStep) {
                        status = _DeliveryStatus.done;
                        indicatorSize = 30;
                      } else if (index > oxxo.state.currentStep) {
                        status = _DeliveryStatus.todo;
                        indicatorSize = 30;
                        beforeLineStyle = const LineStyle(color: Color(0xFF747888));
                      } else {
                        afterLineStyle = const LineStyle(color: Colors.green);
                        status = _DeliveryStatus.doing;
                        indicatorSize = 30;
                      }

                      return TimelineTile(
                        axis: TimelineAxis.horizontal,
                        alignment: TimelineAlign.manual,
                        lineXY: 0.3,
                        isFirst: index == 0,
                        isLast: index == deliverySteps.length - 1,
                        beforeLineStyle: beforeLineStyle,
                        afterLineStyle: afterLineStyle,
                        indicatorStyle: IndicatorStyle(
                          width: indicatorSize,
                          height: indicatorSize,
                          indicator: _IndicatorDelivery(status: status),
                        ),
                        endChild: _EndChildDelivery(
                          text: step,
                          current: index == oxxo.state.currentStep,
                        ),
                      );
                    },
                  ),
                );
              }),
        ),
        Expanded(
          flex: 3,
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: oxxo.pageViewController,
            onPageChanged: (int i) {},
            children: [
              _StepperContent(
                controller: oxxo.pageViewController,
                content: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      InputTextCupertino(
                        textFieldBloc: oxxo.name,
                        placeholder: 'Nombre completo',
                        keyboardType: TextInputType.text,
                      ),
                      InputTextCupertino(
                        textFieldBloc: oxxo.email,
                        placeholder: 'Correo eletrónico',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      InputTextCupertino(
                        textFieldBloc: oxxo.phone,
                        placeholder: 'Número de celular',
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          MaskedTextInputFormatter(mask: "### #### ###", separator: " ")
                        ],
                      ),
                    ],
                  ),
                ),
                bloc: oxxo,
              ),
              _StepperContent(
                controller: oxxo.pageViewController,
                content: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xFF2ACA8E),
                        radius: 40,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          child: Text(
                            Helper.dateTimeFormat(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      StreamBuilder(
                        stream: oxxo,
                        builder: (context, snapshot) {
                          return Center(
                            child: Container(
                                child: Text(
                              oxxo.message,
                              textAlign: TextAlign.center,
                            )),
                          );
                        },
                      )
                    ],
                  ),
                ),
                bloc: oxxo,
              )
            ],
          ),
        ),
      ],
    );
  }
}

enum _DeliveryStatus { done, doing, todo }

class _StepperContent extends StatelessWidget {
  final Widget content;
  final PageController controller;
  final OxxoBloc bloc;

  const _StepperContent({
    Key key,
    @required this.content,
    @required this.controller,
    this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          content,
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(24.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                bloc.state.currentStep > 0 && !bloc.state.isLastStep
                    ? FlatButton(
                        color: AppTheme.kPrimaryColor,
                        onPressed: () {
                          bloc.updateCurrentStep(
                            bloc.state.currentStep != 0 ? bloc.state.currentStep - 1 : 0,
                          );
                          bloc.back();
                        },
                        child: Text(
                          "Regresar",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : SizedBox.shrink(),
                bloc.state.currentStep > 0
                    ? SizedBox(
                        width: 10,
                      )
                    : SizedBox.shrink(),
                FlatButton(
                  color: AppTheme.kPrimaryColor,
                  onPressed: bloc.submit,
                  child: Text(
                    bloc.state.currentStep > 0 && bloc.state.currentStep == (2 - 1)
                        ? "Terminar"
                        : "Siguiente",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EndChildDelivery extends StatelessWidget {
  const _EndChildDelivery({
    Key key,
    @required this.text,
    @required this.current,
  }) : super(key: key);

  final String text;
  final bool current;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 120),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sniglet(
                    fontSize: 16,
                    color: current ? const Color(0xFF2ACA8E) : Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IndicatorDelivery extends StatelessWidget {
  const _IndicatorDelivery({Key key, this.status}) : super(key: key);

  final _DeliveryStatus status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case _DeliveryStatus.done:
        return CircleAvatar(
          backgroundColor: Color(0xFF2ACA8E),
          child: Icon(Icons.check, color: Colors.white),
        );
      case _DeliveryStatus.doing:
        return Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF2ACA8E),
          ),
          child: const Center(
            child: SizedBox(
              height: 15,
              width: 15,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        );
      case _DeliveryStatus.todo:
        return Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF747888),
          ),
          child: Center(
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF5D6173),
              ),
            ),
          ),
        );
    }
    return Container();
  }
}
