import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class CommonService {
  // Fonction pour récupérer le menu depuis l'API
  // Future<void> fetchAppMenu() async {
  //   _showLoadingSpinner();
  //   try {
  //     debugPrint('Fetching menu...');
  //     final response = await getWithDio('/core/menu?include__subMenus=true');
  //     // debugPrint('Response: ${response["data"].toString()}');
  //     final List<IAppMenu> menuList = _parseMenu(response['data']);
  //     if (!_appMenuController.isClosed) {
  //       _appMenuController.add(menuList);
  //     }
  //   } catch (error) {
  //     _handleError('Error fetching menu', error);
  //   } finally {
  //     _hideLoadingSpinner();
  //   }
  // }

  // Fonction pour récupérer un chemin sélectionné depuis l'API
  // Future<void> getSelectedPath(String url) async {
  //   _showLoadingSpinner();
  //   try {
  //     // debugPrint('Fetching data from path: $url');
  //     final response = await getWithDio(url);
  //     debugPrint('Response: ${response["data"]["data"]}');
  //   } catch (error, stackTrace) {
  //     _handleError('Error fetching selected path', error, stackTrace);
  //   } finally {
  //     _hideLoadingSpinner();
  //   }
  // }
}
