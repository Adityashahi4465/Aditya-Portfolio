import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/testimonial.dart';
import '../../../repository/testimonial.dart';

final testimonialListProvider = Provider<List<Testimonial>>((ref) {
  return testimonialData.map((data) {
    return Testimonial(
      name: data['name'],
      position: data['position'],
      comment: data['comment'],
      avatarUrl: data['avatarUrl'],
    );
  }).toList();
});
final forwardButtonHoverProvider = StateProvider<bool>((ref) => false);
final backButtonHoverProvider = StateProvider<bool>((ref) => false);
