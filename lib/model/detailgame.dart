class MinimumSystemRequirements {
  final String os;
  final String processor;
  final String memory;
  final String graphics;
  final String storage;

  MinimumSystemRequirements({
    required this.os,
    required this.processor,
    required this.memory,
    required this.graphics,
    required this.storage,
  });

  factory MinimumSystemRequirements.fromJson(Map<String, dynamic> json) {
    return MinimumSystemRequirements(
      os: json['os'] ?? 'N/A',
      processor: json['processor'] ?? 'N/A',
      memory: json['memory'] ?? 'N/A',
      graphics: json['graphics'] ?? 'N/A',
      storage: json['storage'] ?? 'N/A',
    );
  }
}

class Screenshot {
  final int id;
  final String image;

  Screenshot({required this.id, required this.image});

  factory Screenshot.fromJson(Map<String, dynamic> json) {
    return Screenshot(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
    );
  }
}

class DetailGame {
  final int id;
  final String title;
  final String thumbnail;
  final String status;
  final String shortDescription;
  final String description;
  final String gameUrl;
  final String genre;
  final String platform;
  final String publisher;
  final String developer;
  final String releaseDate;
  final String freetogameProfileUrl;
  final MinimumSystemRequirements minimumSystemRequirements;
  final List<Screenshot> screenshots;

  DetailGame({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.status,
    required this.shortDescription,
    required this.description,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.freetogameProfileUrl,
    required this.minimumSystemRequirements,
    required this.screenshots,
  });

  factory DetailGame.fromJson(Map<String, dynamic> json) {
    return DetailGame(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      status: json['status'] ?? '',
      shortDescription: json['short_description'] ?? '',
      description: json['description'] ?? '',
      gameUrl: json['game_url'] ?? '',
      genre: json['genre'] ?? '',
      platform: json['platform'] ?? '',
      publisher: json['publisher'] ?? '',
      developer: json['developer'] ?? '',
      releaseDate: json['release_date'] ?? '',
      freetogameProfileUrl: json['freetogame_profile_url'] ?? '',
      minimumSystemRequirements: json['minimum_system_requirements'] != null
          ? MinimumSystemRequirements.fromJson(json['minimum_system_requirements'])
          : MinimumSystemRequirements(os: 'N/A', processor: 'N/A', memory: 'N/A', graphics: 'N/A', storage: 'N/A'),
      screenshots: (json['screenshots'] as List<dynamic>?)
              ?.map((item) => Screenshot.fromJson(item))
              .toList() ??
          [],
    );
  }
}