String baseUrl = "https://api.themoviedb.org/";
String baseAssetPath = "assets/icons";
String baseToken =
    "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NzViMGY1NDYxNTBkZTU4NjIwMTQwYTUzMDg3NDMyOSIsInN1YiI6IjYwNGY2YmI3MTdiNWVmMDAyOGY0YmE3NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Cu0N9KwKkJEbowjnwqsRvPn2ieuhKsahrVkPGHw7sH8";

final baseHeaders = {
  'authorization': baseToken,
};

enum KeyEnum { nowPlaying, popular, topRated, upcoming, airingToday, onTheAir }

const titleObject = {
  KeyEnum.nowPlaying: "현재상영중",
  KeyEnum.popular: "인기순",
  KeyEnum.topRated: "평점순",
  KeyEnum.upcoming: "개봉예정",
  KeyEnum.airingToday: "오늘방송",
  KeyEnum.onTheAir: "방송중"
};
