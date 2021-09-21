import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'HttpsRequest.g.dart';

@RestApi(baseUrl: 'https://hacker-news.firebaseio.com/v0')
abstract class HttpsRequest {
  // factory HttpsRequest(Dio dio, String baseUrl) = _HttpsRequest;

  @GET('/topstories.json')
  Future<List<int>> getTopNewsId();

//  @POST('')
//  Future<List<int>> getProductList();
}

class ProductModel {}

@JsonSerializable()
class News {
  int id;
  String title;
  String type;
  String url;

  News({
    required this.id,
    required this.title,
    required this.type,
    required this.url,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
