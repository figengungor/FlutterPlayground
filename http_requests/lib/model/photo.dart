class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo.fromJson(Map<String, dynamic> jsonMap)
      : this.albumId = jsonMap['albumId'],
        this.id = jsonMap['id'],
        this.title = jsonMap['title'],
        this.url = jsonMap['url'],
        this.thumbnailUrl = jsonMap['thumbnailUrl'];
}
