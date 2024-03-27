import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../presentation/themes/app_colors.dart';

class Utils {
  static void showSnackBar({required String title, required String message}) {
    FocusManager.instance.primaryFocus?.unfocus();
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 2500),
        backgroundColor: AppColors.primary,
        content: Text("$title\n$message")));
  }

  static bool isDark(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;
    return isDarkMode;
  }

  static void showLoadingDialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierColor: isDark(context)
            ? Colors.white.withOpacity(0.2)
            : Colors.black.withOpacity(0.2),
        barrierDismissible: false,
        transitionDuration: const Duration(milliseconds: 0),
        pageBuilder: (context, animation, secondaryAnimation) =>
            SizedBox.expand(
              // makes widget fullscreen
              child: Center(
                child: Card(
                    color: isDark(context)
                        ? Colors.black.withOpacity(.9)
                        : Colors.white.withOpacity(.9),
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: const CircularProgressIndicator(
                        strokeWidth: 4,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.primary),
                      ),
                    )),
              ),
            ));
  }

  static void dismissLoadingDialog() {
    Get.back();
  }

  static Future<void> showExitConfirmation(BuildContext context) async {
    bool exitConfirmed = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App?'),
            content: const Text('Do you really want to exit the app?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Exit'),
              ),
            ],
          ),
        ) ??
        false;

    if (exitConfirmed) {
      SystemNavigator.pop(); // Close the app
    }
  }

  static Future<void> showLogoutConfirmation(BuildContext context) async {
    bool exitConfirmed = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App?'),
            content: const Text('Do you really want to logout the app?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Logout'),
              ),
            ],
          ),
        ) ??
        false;

    if (exitConfirmed) {
      SystemNavigator.pop(); // Close the app
    }
  }

  static Future<void> showAlert(
      {required BuildContext context,
      required String title,
      required String body,
      required String primaryButtonLabel,
      Function()? primaryButtonOnPress,
      String? secondaryButtonLabel,
      Function()? secondaryButtonOnPress}) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          if (secondaryButtonLabel != null)
            TextButton(
              onPressed: () {
                if (secondaryButtonOnPress != null) {
                  secondaryButtonOnPress();
                } else {
                  Navigator.pop(context);
                }
              },
              child: const Text('Cancel'),
            ),
          TextButton(
            onPressed: () {
              if (primaryButtonOnPress != null) {
                primaryButtonOnPress();
              } else {
                Navigator.pop(context);
              }
            },
            child: Text(primaryButtonLabel),
          ),
        ],
      ),
    );
  }
}
