import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/utils/helper.dart';
import 'package:appresort/app/views/tickets/bloc/ticket_bloc.dart';
import 'package:appresort/app/views/tickets/controller/ticket_controller.dart';
import 'package:appresort/app/widgets/Alerts/alert_image_picker.dart';
import 'package:appresort/app/widgets/Alerts/custom_alert.dart';
import 'package:appresort/app/widgets/Buttons/button_submit_align.dart';
import 'package:appresort/app/widgets/Fields/drop_search_field.dart';
import 'package:appresort/app/widgets/Loading/loading.dart';
import 'package:appresort/app/widgets/TextField/input_text_cupertino.dart';
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
              LoadingDialog.hide(context);
              ticket.controller.pagingController.refresh();
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
              Helper.error(message: state.failureResponse);
            },
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Obx(
                    () => DropSearchField(
                      showClearButton: false,
                      label: " Seleccione una servicio",
                      items: controller.catalogoItems,
                      onChanged: (String v) => controller.seleccionarCatalogo(v),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "*Favor de describir a detalle el caso.",
                    style: TextStyle(fontSize: 17.0),
                    textAlign: TextAlign.start,
                  ),
                  InputTextCupertino(
                    textFieldBloc: ticket.descripcion,
                    placeholder: "Descripción",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Seleccione una imagen(opcional).",
                    style: TextStyle(fontSize: 17.0),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: GetBuilder<TicketController>(
                      id: "image",
                      builder: (c) => Stack(
                        children: [
                          Container(
                            height: 200,
                            width: 200,
                            child: c.image == null
                                ? GestureDetector(
                                    onTap: showSelectDialog,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: Image.file(controller.image).image,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                          ),
                          c.image != null
                              ? Positioned(
                                  right: 0,
                                  top: 0,
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: controller.deleteImage,
                                    child: CircleAvatar(
                                      radius: Adapt.px(25),
                                      backgroundColor: Colors.black,
                                      child: Icon(
                                        Icons.clear,
                                        size: Adapt.px(30),
                                        color: Colors.white.withOpacity(0.9),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox.shrink()
                        ],
                      ),
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
