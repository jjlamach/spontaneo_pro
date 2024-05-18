class Categories {
  final String title;
  final List<String> categories;
  Categories(this.title, this.categories);
}

final List<Categories> items = [
  Categories(
    'Personal Development',
    [
      'Mindfulness & Meditation',
      'Skill Learning',
      'Language Practice',
      'Reading & Writing',
    ],
  ),
  Categories(
    'Physical Health',
    [
      'Exercise & Fitness',
      'Yoga & Pilates',
      'Outdoor Activities',
      'Dance Moves',
    ],
  ),
  Categories(
    'Mental Wellness',
    [
      'Journaling',
      'Gratitude Practice',
    ],
  ),
];
