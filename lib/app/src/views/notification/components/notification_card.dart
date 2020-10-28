import 'package:appresort/app/src/data/models/notification_model.dart';
import 'package:appresort/app/src/helpers/iconos.dart';
import 'package:appresort/app/src/themes/app_theme.dart';
import 'package:appresort/app/src/widgets/ListTile/list_tile_notification.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notificacion;
  final Function onTap;
  final Function(DismissDirection) onDismissed;

  const NotificationCard({
    Key key,
    this.notificacion,
    this.onTap,
    this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileNotification(
      text: notificacion.descripcion,
      onPress: onTap,
      leading: notificacion.status
          ? Icon(Icons.done, color: AppTheme.kIconColor)
          : Icon(Icons.done_all, color: AppTheme.kIconColor),
      trailing: Iconos.nombre(
        nombre: notificacion.icono,
        size: 25.0,
        color: AppTheme.kIconColor,
      ),
      bottom: 10.0,
    );
  }
}
