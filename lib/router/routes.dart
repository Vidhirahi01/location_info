import 'package:go_router/go_router.dart';
import 'package:network_image_generator_app/screens/location_info_screen.dart';
import '../screens/detail_screen.dart';
import '../models/location_model.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LocationInfoScreen(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) {
        final location = state.extra as LocationModel;
        return DetailScreen(location: location);
      },
    ),
  ],
);
