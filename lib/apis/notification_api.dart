import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';

import '../core/constants/api_constents.dart';
import '../core/faliure.dart';
import '../core/providers/instance_providers.dart';
import '../core/type_defs.dart';

final notificationApiProvider = Provider<NotificationApi>((ref) {
  return NotificationApi(
    client: ref.read(httpClientProvider),
  );
});

abstract class INotificationApi {
  FutureEither<String> sandContactEmail({
    required String firstName,
    required String lastName,
    required String email,
    required String subject,
    required String description,
  });
}

class NotificationApi implements INotificationApi {
  final Client _client;

  NotificationApi({required Client client}) : _client = client;

  @override
  FutureEither<String> sandContactEmail({
    required String firstName,
    required String lastName,
    required String email,
    required String subject,
    required String description,
  }) async {
    try {
      final res = await _client.post(
        Uri.parse('$backendUrl/send-message'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': '$firstName $lastName',
          'email': email,
          'subject': subject,
          'message': description,
        }),
      );

      print('Response Code: ${res.statusCode}');
      print('Response Body: ${res.body}');

      if (res.statusCode == 200) {
        return right('Your message has been sent successfully.');
      } else {
        return left(Failure(
          message: 'Oops! Something went wrong. Please try again later.',
        ));
      }
    } catch (e) {
      print(e);
      return left(Failure(message: 'Unexpected error occurred: $e'));
    }
  }
}
