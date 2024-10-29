import 'package:go_router/go_router.dart';
import 'package:pelis/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        
        GoRoute(
          path: 'movie/:id',
          name: MovieDetailsScreen.name,
          builder: (context, state) {
            return MovieDetailsScreen(movieId: state.pathParameters['id'] ?? 'no-id');
        },
    )
      ]
    ),
  ]
);