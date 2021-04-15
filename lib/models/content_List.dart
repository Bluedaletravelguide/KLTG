class ContentLi {
  final String id;
  final String title;
  final String contentListTitle;
  final String categories;
  final String image;

  const ContentLi({
    this.id,
    this.title,
    this.categories,
    this.contentListTitle,
    this.image,
  });

  factory ContentLi.fromJson(Map<String, dynamic> pJson) {
    return ContentLi(
        id: pJson['id'],
        title: pJson['title'],
        categories: pJson['categories'],
        contentListTitle: pJson['contentListTitle'],
        image: pJson['image']);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'title': this.title,
        'categories': this.categories,
        'contentListTitle': this.contentListTitle,
        'image': this.image
      };
}
