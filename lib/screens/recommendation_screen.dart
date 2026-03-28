import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/tour.dart';
import '../theme/app_theme.dart';
import '../widgets/tour_card.dart';

class RecommendationScreen extends StatefulWidget {
  final double maxPrice;
  final String category;
  final String difficulty;

  const RecommendationScreen({
    Key? key,
    required this.maxPrice,
    required this.category,
    required this.difficulty,
  }) : super(key: key);

  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  late List<Tour> _tours;

  @override
  void initState() {
    super.initState();
    final tours = DUMMY_TOURS.cast<Tour>();
    _tours = tours.map((tour) => tour.copyWith()).toList();
  }

  List<Tour> get _filteredTours {
    return _tours.where((tour) {
      final withinBudget = tour.price <= widget.maxPrice;
      final matchesCategory =
          widget.category == 'All' || tour.categories.contains(widget.category);
      final matchesDifficulty =
          widget.difficulty == 'Any' || tour.difficulty == widget.difficulty;
      return withinBudget && matchesCategory && matchesDifficulty;
    }).toList()
      ..sort((a, b) => b.rating.compareTo(a.rating));
  }

  void _toggleFavorite(String id) {
    setState(() {
      final index = _tours.indexWhere((t) => t.id == id);
      if (index != -1) {
        _tours[index] = _tours[index].copyWith(isFavorite: !_tours[index].isFavorite);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredTours;

    return Scaffold(
      backgroundColor: AppTheme.primary,
      appBar: AppBar(
        title: const Text('Recommendations'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: AppTheme.accent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.accent.withOpacity(0.5)),
                ),
                child: Text(
                  '${filtered.length} found',
                  style: const TextStyle(
                    color: AppTheme.accent,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Filter Summary bar
          Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppTheme.surface.withOpacity(0.5),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppTheme.surface),
            ),
            child: Row(
              children: [
                const Icon(Icons.filter_alt, color: AppTheme.textSecondary, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${widget.category} · Max \$${widget.maxPrice.round()} · ${widget.difficulty}',
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          // Tours list
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: AppTheme.surface,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.search_off,
                            color: AppTheme.textSecondary,
                            size: 36,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'No tours found',
                          style: TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Try adjusting your filters\nor increasing your budget',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Adjust Filters'),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    itemCount: filtered.length,
                    itemBuilder: (ctx, i) {
                      final tour = filtered[i];
                      return TourCard(
                        tour: tour,
                        onFavoriteToggle: () => _toggleFavorite(tour.id),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
