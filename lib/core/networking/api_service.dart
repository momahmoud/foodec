import 'package:dio/dio.dart';
import 'package:foodec/features/home/data/models/categories_model.dart';
import 'package:retrofit/http.dart';

import '../../features/home/data/models/slides_model.dart';
import '../../features/login/data/models/login_request_body.dart';
import '../../features/login/data/models/login_response.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

// --------------------------------- Auth --------------------------------- //
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  //--------------------------------- Home --------------------------------- //
  @GET(ApiConstants.slides)
  Future<SlidesModel> getSlides();
  @GET(ApiConstants.categories)
  Future<CategoriesModel> getCategories();
}
