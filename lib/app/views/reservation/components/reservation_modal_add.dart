import 'package:appresort/app/utils/helper.dart';
import 'package:appresort/app/views/reservation/bloc/reservation_add_bloc.dart';
import 'package:appresort/app/widgets/FormField/input_cupertino_bloc.dart';
import 'package:appresort/app/widgets/FormField/select_bloc_builder.dart';
import 'package:appresort/app/widgets/Buttons/button_submit.dart';
import 'package:appresort/app/widgets/Loading/loading_apleeks.dart';
import 'package:appresort/app/widgets/UnFocus/un_focus_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ReservacionesModalAdd extends StatelessWidget {
  const ReservacionesModalAdd({
    Key key,
    this.title = '',
    this.date = '',
    this.weekend = 0,
  }) : super(key: key);

  final String title;
  final String date;
  final int weekend;

  @override
  Widget build(BuildContext context) {
    return UnFocusForm(
      child: Material(
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: SizedBox.shrink(),
            middle: Text(title),
            trailing: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          child: BlocProvider(
            create: (context) => ReservationAddBloc(
              date: date,
              weekend: weekend,
            ),
            child: Builder(
              builder: (context) {
                final bloc = BlocProvider.of<ReservationAddBloc>(context);
                return FormBlocListener<ReservationAddBloc, String, String>(
                  onSubmitting: (context, state) => LoadingApleeks.show(context),
                  onSuccess: (context, state) {
                    LoadingApleeks.hide(context);
                    Navigator.of(context).pop(state.successResponse);
                    bloc.close();
                  },
                  onFailure: (context, state) async {
                    LoadingApleeks.hide(context);
                    Helper.error(
                      message: state.failureResponse,
                      duration: 2000,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SelectBlocBuilder(
                                label: 'Selecciones una áreas',
                                selectFieldBloc: bloc.areas,
                                itemBuilder: (context, value) => value,
                                onChanged: (s) {
                                  bloc.getHorarios(s);
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: SelectBlocBuilder(
                                label: 'Selecciones un horario',
                                selectFieldBloc: bloc.horarios,
                                itemBuilder: (context, value) => value,
                                onChanged: (s) {
                                  bloc.cupoDisponible(s);
                                },
                              ),
                            ),
                          ],
                        ),
                        SelectBlocBuilder(
                          label: 'Seleccione una unidad',
                          selectFieldBloc: bloc.unidades,
                          itemBuilder: (context, value) => value,
                          onChanged: (s) {},
                        ),
                        StreamBuilder<int>(
                          stream: bloc.getOcupacionMax,
                          initialData: 0,
                          builder: (context, data) {
                            final ocupacion = data.data;
                            return ocupacion > 0
                                ? RichText(
                                    text: TextSpan(
                                      text: 'Cupo disponible ',
                                      style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '$ocupacion',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox.shrink();
                          },
                        ),
                        InputCupertinoBloc(
                          label: Text("Núm. de personas"),
                          textFieldBloc: bloc.numeroPersonas,
                          inputColor: Colors.transparent,
                        ),
                        InputCupertinoBloc(
                          label: Text("Comentarios adicionales"),
                          textFieldBloc: bloc.comentarios,
                          inputColor: Colors.transparent,
                        ),
                        ButtonSubmit(
                          submit: bloc.submit,
                          text: "Aceptar",
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
