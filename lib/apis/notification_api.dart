import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';

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
  NotificationApi({
    required Client client,
  }) : _client = client;


  final sendGrid =
      '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';


  @override
  FutureEither<String> sandContactEmail({
    required String firstName,
    required String lastName,
    required String email,
    required String subject,
    required String description,
  }) async {
    try {
      if (sendGrid.isEmpty) {
        return left(Failure(
            message:
                'SendGrid API key is not configured. Please try again later.'));
      }

      final res = await _client.post(
        Uri.parse('https://api.sendgrid.com/v3/mail/send'),
        body: jsonEncode({
          'personalizations': [
            {
              'to': [
                {'email': 'adityakmcs@gmail.com'} // Your receiving email
              ],
              'subject': '[Contact Form] $subject',
            }
          ],
          'from': {
            'email': 'adityakmcs@gmail.com'
          }, // Must be verified in SendGrid
          'reply_to': {
            'email': email
          }, // So you can reply directly to the sender
          'content': [
            {
              'type': 'text/plain',
              'value': '''
You’ve received a new message from your website contact form.

Name    : $firstName $lastName
Email   : $email
Subject : $subject

Message:
$description

---
This message was sent from your website’s contact form.
            '''
            }
          ],
        }),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $sendGrid',
        },
      );

      print('Response Code: ${res.statusCode}');
      print('Response Headers: ${res.headers}');
      print('Response Body: ${res.body}');

      if (res.statusCode == 202) {
        return right('Your message has been sent successfully.');
      } else {
        return left(Failure(
            message: 'Oops! Something went wrong. Please try again later.'));
      }
    } catch (e) {
      print(e);
      return left(
          Failure(message: 'Unexpected error occurred: ${e.toString()}'));
    }
  }
}
