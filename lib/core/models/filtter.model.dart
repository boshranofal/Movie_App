import 'package:movie_app/core/models/movie_response_model.dart';
import 'package:movie_app/core/utils/app_images.dart';

class FiltterModel {
  String name;
  String img;

  FiltterModel({required this.name, required this.img});

  static final List<FiltterModel> filtterItem = [
    FiltterModel(name: 'Gener', img: Images.general),
    FiltterModel(name: 'Top IMDB', img: Images.top),
    FiltterModel(name: 'Language', img: Images.language),
    FiltterModel(name: 'Watched', img: Images.watched),
  ];
   
}
