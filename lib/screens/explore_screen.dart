import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/tour.dart';
import '../theme/app_theme.dart';
import '../widgets/tour_card.dart';

class ExploreScreen extends StatefulWidget {
  final List<Tour> tours;
  final Function(String) onFavoriteToggle;

  const ExploreScreen({
    Key? key,
    required this.tours,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String _sortBy = 'Rating';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  List<Tour> get _sortedTours {
    List<Tour> result = widget.tours
        .where((t) =>
            t.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            t.location.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            t.categories.any(
                (c) => c.toLowerCase().contains(_searchQuery.toLowerCase())))
        .toList();

    switch (_sortBy) {
      case 'Price ↑':
        result.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Price ↓':
        result.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Duration':
        result.sort((a, b) => a.durationHours.compareTo(b.durationHours));
        break;
      default: // Rating
        result.sort((a, b) => b.rating.compareTo(a.rating));
    }
    return result;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tours = _sortedTours;

    return Column(
      children: [
        // Search bar
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.cardBg,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppTheme.surface),
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (val) => setState(() => _searchQuery = val),
              style: const TextStyle(color: AppTheme.textPrimary),
              decoration: InputDecoration(
                hintText: 'Search tours, locations...',
                hintStyle: const TextStyle(color: AppTheme.textSecondary, fontSize: 14),
                prefixIcon: const Icon(Icons.search, color: AppTheme.textSecondary, size: 20),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: AppTheme.textSecondary, size: 18),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
          ),
        ),
        // Sort row
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Row(
            children: [
              Text(
                '${tours.length} tours',
                style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 13,
                ),
              ),
              const Spacer(),
              const Text(
                'Sort: ',
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 13),
              ),
              DropdownButton<String>(
                value: _sortBy,
                dropdownColor: AppTheme.cardBg,
                underline: const SizedBox(),
                icon: const Icon(Icons.keyboard_arrow_down, color: AppTheme.accent, size: 18),
                style: const TextStyle(color: AppTheme.accent, fontSize: 13, fontWeight: FontWeight.w600),
                items: ['Rating', 'Price ↑', 'Price ↓', 'Duration'].map((s) {
                  return DropdownMenuItem(value: s, child: Text(s));
                }).toList(),
                onChanged: (val) => setState(() => _sortBy = val!),
              ),
            ],
          ),
        ),
        // List
        Expanded(
          child: tours.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.search_off, color: AppTheme.textSecondary, size: 40),
                      const SizedBox(height: 12),
                      Text(
                        'No results for "$_searchQuery"',
                        style: const TextStyle(color: AppTheme.textSecondary, fontSize: 14),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  itemCount: tours.length,
                  itemBuilder: (ctx, i) {
                    final tour = tours[i];
                    return TourCard(
                      tour: tour,
                      onFavoriteToggle: () => widget.onFavoriteToggle(tour.id),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
