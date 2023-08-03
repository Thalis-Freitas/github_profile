class User {
  final String name;
  final String avatarUrl;
  final int followers;
  final int publicRepos;

  User(this.name, this.avatarUrl, this.followers, this.publicRepos);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['name'],
      json['avatar_url'],
      json['followers'],
      json['public_repos'],
    );
  }
}