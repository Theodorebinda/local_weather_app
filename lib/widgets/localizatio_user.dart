import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<String> getUserLocation() async {
    try {
      // Vérifie et demande les permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      // Vérifie si la permission est refusée
      if (permission == LocationPermission.deniedForever) {
        return "Permission définitivement refusée. Veuillez activer la géolocalisation dans les paramètres.";
      }

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        // Obtient la position actuelle
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        // Utilise les coordonnées pour obtenir le nom du lieu
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);

        if (placemarks.isNotEmpty) {
          Placemark place = placemarks[0];
          return "${place.locality}, ${place.administrativeArea}, ${place.country}";
        } else {
          return "Lieu introuvable";
        }
      } else {
        return "Permission refusée";
      }
    } catch (e) {
      return "Erreur: ${e.toString()}";
    }
  }
}
