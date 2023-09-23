class McuModel {
  List<Data>? data;
  int? total;

  McuModel({this.data, this.total});

  McuModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data?.map((v) => v.toJson()).toList();
    _data['total'] = total;
    return _data;
  }
}

class Data {
  int? id;
  String? title;
  String? releaseDate;
  String? boxOffice;
  int? duration;
  String? overview;
  String? coverUrl;
  String? trailerUrl;
  String? directedBy;
  int? phase;
  String? saga;
  int? chronology;
  int? postCreditScenes;
  String? imdbId;
  String? updatedAt;

  Data(
      {this.id,
      this.title,
      this.releaseDate,
      this.boxOffice,
      this.duration,
      this.overview,
      this.coverUrl,
      this.trailerUrl,
      this.directedBy,
      this.phase,
      this.saga,
      this.chronology,
      this.postCreditScenes,
      this.imdbId,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    releaseDate = json['release_date'];
    boxOffice = json['box_office'];
    duration = json['duration'];
    overview = json['overview'];
    coverUrl = json['cover_url'];
    trailerUrl = json['trailer_url'];
    directedBy = json['directed_by'];
    phase = json['phase'];
    saga = json['saga'];
    chronology = json['chronology'];
    postCreditScenes = json['post_credit_scenes'];
    imdbId = json['imdb_id'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['release_date'] = releaseDate;
    data['box_office'] = boxOffice;
    data['duration'] = duration;
    data['overview'] = overview;
    data['cover_url'] = coverUrl;
    data['trailer_url'] = trailerUrl;
    data['directed_by'] = directedBy;
    data['phase'] = phase;
    data['saga'] = saga;
    data['chronology'] = chronology;
    data['post_credit_scenes'] = postCreditScenes;
    data['imdb_id'] = imdbId;
    data['updated_at'] = updatedAt;
    return data;
  }
}
