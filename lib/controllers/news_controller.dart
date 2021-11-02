import 'package:get/get.dart';
import 'package:newsapp/services/remote_services.dart';

class NewsController extends GetxController {
  var newsList = [].obs;
  var articleListForQuery = [].obs;
  var sourceList = [].obs;
  var isLoading = true.obs;
  var isSourcesLoading = true.obs;
  var isResultsForQueryLoading = true.obs;
  var category = "general".obs;
  var countryCode = "us".obs;
  var country = "US".obs;
  var posForLocation = 0.obs;
  var posForCategory = 0.obs;
  var query = "".obs;

  @override
  void onInit() {
    fetchTopHeadlines(category, countryCode);
    fetchSources();
    fetchResultsforQuery(query);

    super.onInit();
  }

  void fetchTopHeadlines(
    RxString category,
    RxString countryCode,
  ) async {
    try {
      isLoading(true);
      var articles = await RemoteServices.fetchTopHeadlines(
          category.string, countryCode.string);

      if (articles != null) {
        newsList.assignAll(articles);
      }
      print("Working topheadlines");
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void fetchSources() async {
    try {
      isSourcesLoading(true);
      var sources = await RemoteServices.fetchSources();
      if (sources != null) {
        sourceList.assignAll(sources);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isSourcesLoading(false);
    }
  }

  void fetchResultsforQuery(RxString query) async {
    try {
      isResultsForQueryLoading(true);
      var results = await RemoteServices.fetchResultsForQuery(query.string);
      if (results != null) {
        articleListForQuery.assignAll(results);
      }
      print("Working search");
    } catch (e) {
      print(e.toString());
    } finally {
      isResultsForQueryLoading(false);
    }
  }
}
