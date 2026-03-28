import '../models/tour.dart';

final List<Tour> DUMMY_TOURS = [
  Tour(
    id: 't1',
    title: 'Alpine Summit Trek',
    description:
        'A breathtaking 5-hour guided hike through the Swiss Alps. Experience cascading waterfalls, pristine glacial lakes, and panoramic mountain vistas that will leave you speechless.',
    price: 75.0,
    categories: ['Nature', 'Adventure'],
    imageUrl:
        'https://images.unsplash.com/photo-1551632811-561732d1e306?w=600',
    locationId: 'd1',
    rating: 4.8,
    durationHours: 5,
    location: 'Swiss Alps',
    difficulty: 'Hard',
  ),
  Tour(
    id: 't2',
    title: 'Street Food Safari',
    description:
        'Taste 12 iconic street foods across 6 neighbourhoods. From spicy tacos to local sweets — your palate will never be the same. Includes food and drinks.',
    price: 35.0,
    categories: ['Food', 'City'],
    imageUrl:
        'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=600',
    locationId: 'd2',
    rating: 4.9,
    durationHours: 3,
    location: 'Old Town',
    difficulty: 'Easy',
  ),
  Tour(
    id: 't3',
    title: 'Ancient Ruins Explorer',
    description:
        'Walk through 2,000 years of history with an expert archaeologist. Discover hidden chambers, ancient inscriptions, and forgotten legends buried beneath your feet.',
    price: 55.0,
    categories: ['History', 'City'],
    imageUrl:
        'https://images.unsplash.com/photo-1563177978-4c5dddf57ded?w=600',
    locationId: 'd3',
    rating: 4.7,
    durationHours: 4,
    location: 'Historic Quarter',
    difficulty: 'Easy',
  ),
  Tour(
    id: 't4',
    title: 'Sunset Kayak Adventure',
    description:
        'Paddle through sea caves and hidden coves as the sun dips below the horizon. Perfect for beginners — all equipment and a certified guide included.',
    price: 65.0,
    categories: ['Nature', 'Adventure', 'Water'],
    imageUrl:
        'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=600',
    locationId: 'd4',
    rating: 4.6,
    durationHours: 3,
    location: 'Coastal Bay',
    difficulty: 'Moderate',
  ),
  Tour(
    id: 't5',
    title: 'Night Market Immersion',
    description:
        'Experience the vibrant chaos of an authentic Asian night market. Sample exotic fruits, watch street performers, and bargain for unique handcrafted souvenirs.',
    price: 25.0,
    categories: ['Food', 'Culture', 'City'],
    imageUrl:
        'https://images.unsplash.com/photo-1516802273409-68526ee1bdd6?w=600',
    locationId: 'd5',
    rating: 4.5,
    durationHours: 2,
    location: 'Night Market District',
    difficulty: 'Easy',
  ),
  Tour(
    id: 't6',
    title: 'Forest Canopy Walk',
    description:
        'Stroll 40 metres above the forest floor on suspended walkways. Spot exotic birds, giant trees, and wildlife that most visitors never get to see.',
    price: 45.0,
    categories: ['Nature', 'Wildlife'],
    imageUrl:
        'https://images.unsplash.com/photo-1448375240586-882707db888b?w=600',
    locationId: 'd6',
    rating: 4.4,
    durationHours: 2,
    location: 'Rainforest Reserve',
    difficulty: 'Easy',
  ),
  Tour(
    id: 't7',
    title: 'Craft Beer Crawl',
    description:
        'Visit 5 local breweries and taste 15+ craft beers with an expert beer sommelier. Learn the brewing process and take home your own tasting notes.',
    price: 50.0,
    categories: ['Food', 'City', 'Culture'],
    imageUrl:
        'https://images.unsplash.com/photo-1559526324-4b87b5e36e44?w=600',
    locationId: 'd7',
    rating: 4.7,
    durationHours: 4,
    location: 'Brewery Row',
    difficulty: 'Easy',
  ),
  Tour(
    id: 't8',
    title: 'Desert Dune Expedition',
    description:
        'Ride camels, sandboard down massive dunes, and camp under a blanket of stars in the Sahara. A true once-in-a-lifetime adventure awaits.',
    price: 120.0,
    categories: ['Adventure', 'Nature'],
    imageUrl:
        'https://images.unsplash.com/photo-1509316785289-025f5b846b35?w=600',
    locationId: 'd8',
    rating: 4.9,
    durationHours: 12,
    location: 'Sahara Desert',
    difficulty: 'Moderate',
  ),
  Tour(
    id: 't9',
    title: 'Palace & Gardens Tour',
    description:
        'Explore grand royal palaces, baroque gardens, and hidden courtyards. Perfect for art lovers and history enthusiasts seeking refined culture.',
    price: 40.0,
    categories: ['History', 'Culture', 'City'],
    imageUrl:
        'https://images.unsplash.com/photo-1571115764595-644a1f56a55c?w=600',
    locationId: 'd9',
    rating: 4.6,
    durationHours: 3,
    location: 'Royal District',
    difficulty: 'Easy',
  ),
  Tour(
    id: 't10',
    title: 'Rock Climbing Basics',
    description:
        'Learn foundational rock climbing techniques on a stunning natural rock face. Fully equipped with harness, helmet, and a certified climbing instructor.',
    price: 85.0,
    categories: ['Adventure', 'Nature'],
    imageUrl:
        'https://images.unsplash.com/photo-1522163182402-834f871fd851?w=600',
    locationId: 'd10',
    rating: 4.8,
    durationHours: 6,
    location: 'Rocky Cliffs',
    difficulty: 'Hard',
  ),
];
