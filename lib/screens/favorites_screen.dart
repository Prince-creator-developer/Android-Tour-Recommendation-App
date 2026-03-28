import 'package:flutter/material.dart';
import '../models/tour.dart';
import '../theme/app_theme.dart';
import '../widgets/tour_card.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Tour> allTours;
  final Function(String) onFavoriteToggle;

  const FavoritesScreen({
    Key? key,
    required this.allTours,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favorites = allTours.where((t) => t.isFavorite).toList();

    return favorites.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: AppTheme.accent.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    color: AppTheme.accent,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'No Favourites Yet',
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Tap the heart on any tour\nto save it here',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            itemCount: favorites.length,
            itemBuilder: (ctx, i) {
              final tour = favorites[i];
              return TourCard(
                tour: tour,
                onFavoriteToggle: () => onFavoriteToggle(tour.id),
              );
            },
          );
  }
}
