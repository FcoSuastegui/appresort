import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/views/tickets/bloc/ticket_bloc.dart';
import 'package:appresort/app/views/tickets/controller/ticket_controller.dart';
import 'package:appresort/app/widgets/Alerts/alert_image_picker.dart';
import 'package:appresort/app/widgets/Alerts/custom_alert.dart';
import 'package:appresort/app/widgets/Buttons/button_submit_align.dart';
import 'package:appresort/app/widgets/Fields/drop_search_field.dart';
import 'package:appresort/app/widgets/Fields/input_text_field_bloc.dart';
import 'package:appresort/app/widgets/Loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

class TicketAddForm extends GetView<TicketController> {
  const TicketAddForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TicketBloc(),
      child: Builder(
        builder: (context) {
          final ticket = BlocProvider.of<TicketBloc>(context);
          return FormBlocListener<TicketBloc, String, String>(
            onSubmitting: (context, state) => LoadingDialog.show(context),
            onSuccess: (context, state) async {
              controller.listarTickets();
              LoadingDialog.hide(context);
              await Get.dialog(
                CustomAlert(
                  type: AlertDialogType.SUCCESS,
                  text: state.successResponse,
                  action: () => Get.back(),
                ),
                barrierDismissible: true,
              );
              ticket.close();
              Get.back();
            },
            onFailure: (context, state) async {
              LoadingDialog.hide(context);
              Get.dialog(
                CustomAlert(
                  type: AlertDialogType.ERROR,
                  text: state.failureResponse,
                  action: () => Get.back(),
                ),
                barrierDismissible: true,
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Obx(
                    () => DropSearchField(
                      showClearButton: false,
                      label: " Seleccione una opción",
                      items: controller.catalogoItems,
                      onChanged: (String v) => controller.seleccionarCatalogo(v),
                    ),
                  ),
                  InputTextFieldBloc(
                    textFieldBloc: ticket.descripcion,
                    labelText: "Descripción",
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Text(
                      "*Favor de describir a detalle el caso.",
                      style: TextStyle(fontSize: 17.0),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: RaisedButton(
                              onPressed: showSelectDialog,
                              color: Colors.white,
                              padding: EdgeInsets.all(10.0),
                              elevation: 0.0,
                              child: Text(
                                "Seleccione una imagen(opcional).",
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(
                                  color: AppTheme.kPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GetBuilder<TicketController>(
                          id: "image",
                          builder: (controller) => Container(
                            width: Get.width,
                            margin: EdgeInsets.only(top: 20.0),
                            child: controller.image != null
                                ? Stack(
                                    children: [
                                      Center(
                                        child: Container(
                                          height: 200.0,
                                          width: 300.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: Image.file(controller.image).image,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          child: null,
                                        ),
                                      ),
                                      Positioned(
                                        right: 1,
                                        child: GestureDetector(
                                          behavior: HitTestBehavior.translucent,
                                          onTap: controller.deleteImage,
                                          child: Icon(
                                            Icons.clear,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : SizedBox.shrink(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonSubmitAlign(
                    submit: ticket.submit,
                    text: "Agregar",
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> showSelectDialog() async {
    Get.dialog(AlertImagePicker(
      onPressCamara: () async => await controller.openCamara(),
      onPressGalery: () async => await controller.openGallery(),
    ));
  }
}
