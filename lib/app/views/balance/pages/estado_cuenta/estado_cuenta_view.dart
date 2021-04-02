import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/utils/helper.dart';
import 'package:appresort/app/views/balance/pages/estado_cuenta/bloc/estado_cuenta_bloc.dart';
import 'package:appresort/app/widgets/Buttons/button_submit.dart';
import 'package:appresort/app/widgets/Loading/loading_apleeks.dart';
import 'package:appresort/app/widgets/PdfViewer/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

class EstadoCuentaView extends StatelessWidget {
  const EstadoCuentaView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = GetStorages.i.user;
    return Scaffold(
      appBar: AppBar(
        title: Text("Estado de cuenta"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: BlocProvider(
            create: (context) => EstadoCuentaBloc(
              propietario: int.parse(user.idpropietario),
            ),
            child: Builder(builder: (context) {
              // ignore: close_sinks
              final cuenta = BlocProvider.of<EstadoCuentaBloc>(context);
              return FormBlocListener<EstadoCuentaBloc, String, String>(
                onSubmitting: (context, state) => LoadingApleeks.show(context),
                onSuccess: (context, state) async {
                  LoadingApleeks.hide(context);
                  Get.to(
                    PdfViewer(
                      path: state.successResponse,
                      title: cuenta.selectOpcion.value,
                    ),
                    fullscreenDialog: true,
                  );
                },
                onFailure: (context, state) async {
                  LoadingApleeks.hide(context);
                  Helper.error(message: state.failureResponse);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: DropdownFieldBlocBuilder<String>(
                        selectFieldBloc: cuenta.selectOpcion,
                        decoration: InputDecoration(
                          labelText: 'Seleccione una opción',
                          border: InputBorder.none,
                        ),
                        itemBuilder: (context, value) => value,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: DropdownFieldBlocBuilder<String>(
                        selectFieldBloc: cuenta.lastDays,
                        decoration: InputDecoration(
                          labelText: 'Movimientos de los últimos',
                          border: InputBorder.none,
                        ),
                        itemBuilder: (context, value) => value,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: DropdownFieldBlocBuilder<String>(
                        selectFieldBloc: cuenta.months,
                        decoration: InputDecoration(
                          labelText: 'Mes',
                          border: InputBorder.none,
                        ),
                        itemBuilder: (context, value) => value,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: DropdownFieldBlocBuilder<String>(
                        selectFieldBloc: cuenta.years,
                        decoration: InputDecoration(
                          labelText: 'Año',
                          border: InputBorder.none,
                        ),
                        itemBuilder: (context, value) => value,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ButtonSubmit(
                      submit: cuenta.submit,
                      text: 'Aceptar',
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
