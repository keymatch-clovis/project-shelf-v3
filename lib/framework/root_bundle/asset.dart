enum Asset {
  CURRENCIES_ASSET("assets/static/currenciesInfo.json"),
  CITIES_ASSET("assets/raw/departments_cities.csv"),
  DEFAULT_LOGO_ASSET("assets/img/default_logo.jpeg");

  final String uri;

  const Asset(this.uri);
}
