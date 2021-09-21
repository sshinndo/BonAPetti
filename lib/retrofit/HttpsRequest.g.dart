// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HttpsRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
    id: json['id'] as int,
    title: json['title'] as String,
    type: json['type'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// class _HttpsRequest implements HttpsRequest {
//   _HttpsRequest(this._dio, this.baseUrl) {
//     ArgumentError.checkNotNull(_dio, '_dio');
//     baseUrl ??= 'https://hacker-news.firebaseio.com/v0';
//   }
//
//   final Dio _dio;
//
//   String baseUrl;
//
//   @override
//   Future<List<int>> getTopNewsId() async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     final _result = await _dio.request<List<dynamic>>('/topstories.json',
//         queryParameters: queryParameters,
//         options: RequestOptions(
//             method: 'GET',
//             headers: <String, dynamic>{},
//             extra: _extra,
//             baseUrl: baseUrl),
//         data: _data);
//     final value = _result.data.cast<int>();
//     return value;
//   }
// }
