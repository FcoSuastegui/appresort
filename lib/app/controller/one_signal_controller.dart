/* //import OneSignal
import 'dart:io';

/* import 'package:clubimperial/app/data/services/one_signal_backend.dart';
import 'package:clubimperial/app/utils/get_storages.dart';
import 'package:clubimperial/app/views/notifications/controller/notification_controller.dart'; */
//import 'package:appresort/app/utils/get_storage.dart';
import 'package:device_info/device_info.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'dart:async';

class OneSignalController {
  OneSignalController._internal();
  static OneSignalController _i = OneSignalController._internal();
  static OneSignalController get i => _i;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setRequiresUserPrivacyConsent(false);

    final settings = {
      OSiOSSettings.autoPrompt: true,
      OSiOSSettings.promptBeforeOpeningPushUrl: true
    };

    await OneSignal.shared.init(
      "09d2446d-e27a-4a33-b6a6-cf8996e4949c",
      iOSSettings: settings,
    );

    OneSignal.shared.setInFocusDisplayType(
      OSNotificationDisplayType.notification,
    );

    await OneSignal.shared.requiresUserPrivacyConsent();

    final status = await OneSignal.shared.getPermissionSubscriptionState();
    final playerId = status.subscriptionStatus.userId;
    setUserIdBackend(playerId);

    OneSignal.shared.setNotificationReceivedHandler(
      (OSNotification notification) => setNotificationReceivedHandler(notification),
    );

    OneSignal.shared.setNotificationOpenedHandler(
      (OSNotificationOpenedResult result) => setNotificationOpenedHandler(result),
    );

    OneSignal.shared.setInAppMessageClickedHandler(
      (OSInAppMessageAction action) => setInAppMessageClickedHandler(action),
    );

    OneSignal.shared.setSubscriptionObserver(
      (OSSubscriptionStateChanges changes) => setSubscriptionObserver(changes),
    );

    OneSignal.shared.setPermissionObserver(
      (OSPermissionStateChanges changes) => setPermissionObserver(changes),
    );
  }

  void setNotificationReceivedHandler(OSNotification notification) {
    //NotificationController.instance.getNotification();
    print(
      "Received notification: \n${notification.jsonRepresentation().replaceAll("\\n", "\n")}",
    );
  }

  void setNotificationOpenedHandler(OSNotificationOpenedResult result) {
    //NotificationController.instance.getNotification();
    print(
      "Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}",
    );
  }

  void setInAppMessageClickedHandler(OSInAppMessageAction action) {
    print(
      "In App Message Clicked: \n${action.jsonRepresentation().replaceAll("\\n", "\n")}",
    );
  }

  void setSubscriptionObserver(OSSubscriptionStateChanges changes) {
    setUserIdBackend(changes.to.userId);
    print(
      "SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}",
    );
  }

  void setPermissionObserver(OSPermissionStateChanges changes) {
    print(
      "PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}",
    );
  }

  Future<void> setUserIdBackend(String playerId) async {
    print(playerId);
    if (playerId == null) return null;
    //final device = await getDevice();
    //final idusuario = GetStorages.i.user.id;
    //await OneSignalBakend.sendPlayerId(device, playerId, idusuario);
  }

  Future<String> getDevice() async {
    String device = '';
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      device = "${iosInfo.name} - ${iosInfo.utsname.machine}";
    } else {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      device = androidInfo.model;
    }

    return device;
  }
}
 */
