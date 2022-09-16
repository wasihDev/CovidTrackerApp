class AppUrl {
  // this is our base url
  static const String baseUrl = 'https://disease.sh/v3/covid-19/';

  //fetch world covid status
  static const String worldStatusApi = '${baseUrl}all';
  static const String countriesStatusApi = '${baseUrl}countries';
}
