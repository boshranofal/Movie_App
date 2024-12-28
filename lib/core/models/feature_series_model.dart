class FeatureSeriesModel {
  final String title;
  final String description;
  final String imageUrl;

  FeatureSeriesModel({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
  static final List<FeatureSeriesModel> featureSeriesItem = [
    FeatureSeriesModel(
      title: 'Lucifer',
      description: 'The Devil has come to Los Angeles...',
      imageUrl: 'assets/images/lucifer.png',
    ),
    FeatureSeriesModel(
      title: 'Money Heist',
      description: 'The Devil has come to Los Angeles...',
      imageUrl: 'assets/images/money.png',
    ),
    FeatureSeriesModel(
      title: 'Sex Education',
      description: 'The Devil has come to Los Angeles...',
      imageUrl: 'assets/images/education.png',
    ),
  ];
}
