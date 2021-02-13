import 'dart:io';
import 'dart:async';
import 'package:appresort/app/data/services/notification_service.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/views/notification/controller/notification_controller.dart';
import 'package:device_info/device_info.dart';
//import OneSignal
import 'package:onesignal_flutter/onesignal_flutter.dart';

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
      "cddab3f6-822b-4bd6-82cf-8d27c7d814f3",
      iOSSettings: settings,
    );

    OneSignal.shared.setInFocusDisplayType(
      OSNotificationDisplayType.notification,
    );

    await OneSignal.shared.requiresUserPrivacyConsent();
    await OneSignal.shared.promptUserForPushNotificationPermission();

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
    NotificationController.i.refresh();
    print(
      "Received notification: \n${notification.jsonRepresentation().replaceAll("\\n", "\n")}",
    );
  }

  void setNotificationOpenedHandler(OSNotificationOpenedResult result) {
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
    print("player : $playerId");
    if (playerId == null) return null;
    final device = await getDevice();
    final idUser = GetStorages.i.user.id;
    await NotificationService.playerId(
      device: device,
      playerId: playerId,
      idUser: int.parse(idUser),
    );
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
