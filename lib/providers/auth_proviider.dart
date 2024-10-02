import 'package:flutter_auth_tut/models/app_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// autoDispose means that the provider will be disposed when no-longer used.
// ref argument is a ProviderReference that allows you to read other providers.
// * means that the function is a generator function,
// returning several values over time, but not just one.
final authProvider = StreamProvider.autoDispose<AppUser?>((ref) async* {});
