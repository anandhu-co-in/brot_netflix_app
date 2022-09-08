import 'package:brot_netflix_app/core/strings.dart';
import 'package:brot_netflix_app/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$baseURL/trending/all/day?api_key=$APIKEY";
  static const search =
      "$baseURL/3/search/movie?api_key=$APIKEY&query=twilight";
}

// So that i can access the api urls like ApiEndPoints.downloads etc..
