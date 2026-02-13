enum Zodiac {
  capricorn,
  aquarius,
  pisces,
  aries,
  taurus,
  gemini,
  cancer,
  leo,
  virgo,
  libra,
  scorpio,
  sagittarius;

  String get assetPath => 'assets/images/zodiac/$name.png';

  String get displayName => name[0].toUpperCase() + name.substring(1);
}
