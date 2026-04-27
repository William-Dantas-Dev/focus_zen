import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/feedback_service.dart';

final feedbackServiceProvider = Provider<FeedbackService>((ref) {
  return FeedbackService();
});