import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../apis/notification_api.dart';
import '../../../core/utils/snackbar.dart';

final notificationControllerProvider =
    StateNotifierProvider<NotificationController, bool>((ref) {
  return NotificationController(
    notificationApi: ref.watch(notificationApiProvider),
    ref: ref,
  );
});

class NotificationController extends StateNotifier<bool> {
  final NotificationApi _notificationApi;
  final Ref _ref;
  NotificationController({
    required NotificationApi notificationApi,
    required Ref ref,
  })  : _notificationApi = notificationApi,
        _ref = ref,
        super(false);

  Future<bool> sendContactEmail({
    required String firstName,
    required String lastName,
    required String email,
    required String subject,
    required String description,
    required BuildContext context,
  }) async {
    // Generate a 6-digit unique OTP
    state = true;
    final result = await _notificationApi.sandContactEmail(
      email: email,
      firstName: firstName,
      lastName: lastName,
      subject: subject,
      description: description,
    );

    state = false;
    return result.fold(
      (failure) {
        showSnackBar(context, failure.message);
        return false;
      },
      (successMessage) {
        showSnackBar(context, successMessage);
        return true;
      },
    );
  }
}
